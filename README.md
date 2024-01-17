# nixos-config
NixOS Configuration

Using Plasma installer, connect to network and cancel gui installer, then to install

```
# git clone https://github.com/00Asgaroth00/nixos-config
# cd nixos-config
# sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./nixos/thanos/disko-config.nix
# sudo nixos-install --flake .#thanos
# sudo reboot now
```

Currently no wifi config for thanos in nix configuration, todo, however, to enable wifi after initial reboot:

```
# sudo -i
# nmcli radio wifi on
# nmcli dev wifi
# nmcli dev wifi connect "<SSID>" password '<WPA2 password>'
```
