{ config, lib, nixpkgs, nix-ros-overlay, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/google-compute-image.nix>
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.ros = {
    enable = true;
    distro = "noetic";

    masterUri = "https://localhost:11311/";
    hostname = "localhost";

    overlays = [
      nix-ros-overlay.overlays.default
    ];

    systemPackages = p: with p; [ rosbash roslaunch rostopic rospy-tutorials ];

    nodes = {
      talker = {
        package = "rospy-tutorials";
        node = "talker";
      };

      listener = {
        package = "rospy-tutorials";
        node = "listener";
      };
    };
  };

  system.stateVersion = "24.05";
}
