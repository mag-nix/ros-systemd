{ config, lib, nixpkgs, nix-ros-overlay }:
{
  imports = [
    <nixpkgs/nixos/modules/virtualisation/google-compute-image.nix>
  ];

  services.ros = {
    enable = true;
    distro = "noetic";
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
}