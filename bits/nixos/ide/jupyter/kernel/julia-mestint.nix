{ pkgs, ... }:

{
  services.jupyter = {
    kernels = {
      julia =
        let
          juliaEnv = pkgs.julia.withPackages [
            "IJulia"
            "Plots"
            "DataFrames"
            "IJulia"
            "GR"
            "CSV"

            "Plotly"
            "PyPlot"
            "PolygonOps"
            "TiffImages"
            "PlotlyJS"
            "JSON3"
            "RDatasets"
            "Distributions"
            "MLDataPattern"
            "Colors"
            "ImageView"
            "ImageMagick"
            "Pluto"
            "JLD"
            "ImageFiltering"
            "ColorTypes"
            "ImageMorphology"
            "Statistics"
            "Zygote"
            "ImageIO"
            "Flux"
            "Images"
            "Dates"
            "ImageSegmentation"
            "DataSets"
            "Makie"
            "Conda"
          ];
        in
        {
          displayName = "Julia Mestint";
          argv = [
            "${juliaEnv}/bin/julia"
            "-i"
            "--color=yes"
            "--project=@."
            "-J${juliaEnv}/lib/julia/sys.so"
            "-e"
            ''
              using IJulia
              IJulia.installkernel("Julia", "--project=@.")
            ''
            "-f"
            "{connection_file}"
          ];
          language = "julia";
          logo32 = "${juliaEnv}/share/julia/base/htdocs/js/logo-32x32.png";
          logo64 = "${juliaEnv}/share/julia/base/htdocs/js/logo-64x64.png";
        };
    };
  };
}
