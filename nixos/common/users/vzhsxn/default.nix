{
  pkgs,
  username,
  ...
}: {
  users.users.${username} = {
    # TODO: You can set an initial password for your user.
    # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
    # Be sure to change it (using passwd) after rebooting!
    # run 'mkpasswd -m yescrypt'
    # initialPassword = "correcthorsebatterystaple";
    hashedPassword = "$y$j9T$LOW.UUJZdl94Miro2rPYi0$X7HGYuYWgrG87fGU9F31lElzJSrXC3rwYozqYbc0fZ6";
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
    ];
    # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
    extraGroups = [
      "audio"
      "networkmanager"
      "systemd-journal"
      "wheel"
    ];
    packages = with pkgs; [
      home-manager
    ];
  };
}
