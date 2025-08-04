{pkgs, ...}:
{
  # # frenck, the original author of the package, sadly doesnt likes it to be distributed for nix :(
  # # also this seemed broken to me, maybe the config...
  # services.home-assistant = {
  #   enable = true;
  #   "config" = {
  #     # Includes dependencies for a basic setup
  #     # https://www.home-assistant.io/integrations/default_config/
  #     default_config = {};
  #     homeassistant = {
  #       name = "My Home";
  #       unit_system = "metric";
  #       time_zone = "Europe/Bucharest";
  #     };
  #   };
  # };

  services.wyoming = {
    openwakeword = {
      enable = true;
      preloadModels = [
        "hey_jarvis"
        "hey_mycroft"
        "hey_rhasspy"
        "ok_nabu"
      ];
    };
    faster-whisper.servers.suttogo = {
      enable = true;
      uri = "tcp://0.0.0.0:10300";
      language = "auto";
      model = "base-int8";
      device = "cuda";
      extraArgs = [
        "--data-dir"
        "$XDG_DATA_HOME/wyoming/faster-whisper-models"
      ];
    };
    piper.servers.bors = {
      enable = true;
      uri = "tcp://0.0.0.0:10200";
      voice = "en-us-ryan-medium";
    };
  };

  systemd.services.wyoming-faster-whisper-suttogo = {
    environment = {
      TRANSFORMERS_CACHE = "$XDG_DATA_HOME/wyoming/faster-whisper-models";
      HF_HOME = "$XDG_DATA_HOME/wyoming/faster-whisper-models";
    };
  };
}