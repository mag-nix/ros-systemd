# NixOS ROS systemd

- This installs ros and the ros packages declared in `systemPackages`
- Sets up systemd services for the `roscore`, `talker` and `listener`

## Open points

- [ ] Properly configure and use GCE (currently `--impure` is used)
- [ ] Installation into nix containers might be interesting for separation for robustness and resource limitation
- [ ] Declare multiple ros services instead of one with all nodes and launch files
