{ lib, buildPythonPackage, fetchFromGitHub }:

buildPythonPackage rec {
  pname = "your_project_name";
  version = "your_project_version";

  src = fetchFromGitHub {
    owner = "yurijmikhalevich";
    repo = "rclip";
    rev = "2d4c075cc6b5895114dfedc96fc8efb6a2d4def0";
    sha256 = "0i71vnnsx2vycbif1cb8srbghcciplcvdx89wm08vvig8vnmrn6s";
  };

  meta = with lib; {
    description = "rclip nix wrapper";
    license = licenses.mit;
  };
}
