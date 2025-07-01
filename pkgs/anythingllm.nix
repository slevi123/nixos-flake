{ lib
, appimageTools
, fetchurl
, makeDesktopItem
, copyDesktopItems
, writeShellScriptBin
, nodejs
, coreutils
, findutils
, gnused
, prisma-engines
}:

let
  pname = "anythingllm-desktop";
  version = "1.0.0";
  src = fetchurl {
    url = "https://cdn.anythingllm.com/latest/AnythingLLMDesktop.AppImage";
    hash = "sha256-SBj+ln0VbE6H4097TvmYu+pQdg6JizfMs9lA+yI9SoE=";  # REPLACE WITH ACTUAL HASH
  };
  
  extracted = appimageTools.extractType2 {
    inherit pname version src;
  };

  # Create custom desktop entry
  desktopItem = makeDesktopItem {
    name = "AnythingLLM";
    desktopName = "AnythingLLM";
    exec = "${pname}";
    icon = "${pname}";
    comment = "Private desktop AI application";
    categories = [ "Utility" "AI" ];
    startupWMClass = "anything-llm";
  };

  # Custom wrapper script to fix Prisma issues
  appWrapper = writeShellScriptBin "${pname}" ''
    set -euo pipefail
    
    # Prepare work directory
    WORK_DIR="''${XDG_DATA_HOME:-$HOME/.local/share}/${pname}"
    mkdir -p "$WORK_DIR"
    cd "$WORK_DIR"
    
    # Copy backend resources if not already present
    if [ ! -d "backend" ]; then
      cp -r ${extracted}/resources/backend .
      
      # Patch Prisma configuration
      PRISMA_SCHEMA="backend/prisma/schema.prisma"
      if [ -f "$PRISMA_SCHEMA" ]; then
        ${gnused}/bin/sed -i 's|binaryTargets =.*|binaryTargets = ["native", "linux-nixos"]|' "$PRISMA_SCHEMA"
        
        # Regenerate Prisma client with NixOS-compatible engine
        export PRISMA_QUERY_ENGINE_BINARY="${prisma-engines}/bin/query-engine"
        export PRISMA_SCHEMA_ENGINE_BINARY="${prisma-engines}/bin/schema-engine"
        pushd backend >/dev/null
        ${nodejs}/bin/node node_modules/prisma/build/index.js generate
        popd >/dev/null
      fi
    fi

    # Run the application
    exec ${extracted}/AppRun "$@"
  '';

in appimageTools.wrapType2 {
  inherit pname version src;

  nativeBuildInputs = [ copyDesktopItems ];
  desktopItems = [ desktopItem ];

  extraInstallCommands = ''
    # Replace default wrapper with our custom script
    rm $out/bin/${pname}
    cp ${appWrapper}/bin/${pname} $out/bin/${pname}
    
    # Install icon
    icon_path=$(find ${extracted} -path '*/resources/*' \( -name 'icon.png' -o -name '*.ico' -o -name '*.svg' \) -print -quit)
    if [ -n "$icon_path" ]; then
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp "$icon_path" $out/share/icons/hicolor/256x256/apps/${pname}.png
    else
      # Create fallback icon
      mkdir -p $out/share/icons/hicolor/256x256/apps
      echo "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=" | base64 -d > $out/share/icons/hicolor/256x256/apps/${pname}.png
    fi
  '';

  meta = with lib; {
    description = "Private desktop AI application with document ingestion";
    homepage = "https://anythingllm.com";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
  };
}