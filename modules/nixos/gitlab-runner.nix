{pkgs, ...}: {
    # services.gitlab-runner.services = {
    #     # runner for building docker images
    #     docker-images = {
    #         # File should contain at least these two variables:
    #         # `CI_SERVER_URL`
    #         # `REGISTRATION_TOKEN`
    #         registrationConfigFile = "/run/secrets/gitlab-runner-registration";
    #         dockerImage = "docker:stable";
    #         dockerVolumes = [
    #             "/var/run/docker.sock:/var/run/docker.sock"
    #         ];
    #         tagList = [ "docker" "pi" ];
    #     };
    # }
}