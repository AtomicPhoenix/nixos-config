{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./git.nix
    ./alacritty.nix
    ./bash.nix
    ./nix-direnv.nix
    ./firefox.nix
    ./tmux.nix
    ./mpv.nix
    ./proton.nix
    ./hyprland.nix
    ./wayland.nix
    # ./nvf.nix
  ];

  /**
  Default Applications
  */
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "text/xml" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      "x-scheme-handler/ftp" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/chrome" = "firefox.desktop";
      "application/x-extension-htm" = "firefox.desktop";
      "application/x-extension-html" = "firefox.desktop";
      "application/x-extension-shtml" = "firefox.desktop";
      "application/x-extension-xhtml" = "firefox.desktop";
      "application/x-extension-xht" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  home = {
    username = "ai";
    homeDirectory = lib.mkForce "/home/ai";
    stateVersion = "25.05";

    # Packages that should be installed to the user profile.
    packages = with pkgs; [
      # neofetch
      # nnn # terminal file manager

      # # archives
      # zip
      # xz
      # unzip
      # p7zip

      # # utils
      # ripgrep # recursively searches directories for a regex pattern
      # jq # A lightweight and flexible command-line JSON processor
      # yq-go # yaml processor https://github.com/mikefarah/yq
      # eza # A modern replacement for ‘ls’
      # fzf # A command-line fuzzy finder

      # # networking tools
      # mtr # A network diagnostic tool
      # iperf3
      # dnsutils  # `dig` + `nslookup`
      # ldns # replacement of `dig`, it provide the command `drill`
      # aria2 # A lightweight multi-protocol & multi-source command-line download utility
      # socat # replacement of openbsd-netcat
      # nmap # A utility for network discovery and security auditing
      # ipcalc  # it is a calculator for the IPv4/v6 addresses

      # # misc
      # cowsay
      # file
      # which
      # tree
      # gnused
      # gnutar
      # gawk
      # zstd
      # gnupg

      # # nix related
      # #
      # # it provides the command `nom` works just like `nix`
      # # with more details log output
      # nix-output-monitor

      # # productivity
      # hugo # static site generator
      # glow # markdown previewer in terminal

      # btop  # replacement of htop/nmon
      # iotop # io monitoring
      # iftop # network monitoring

      # # system call monitoring
      # strace # system call monitoring
      # ltrace # library call monitoring
      # lsof # list open files

      # # system tools
      # sysstat
      # lm_sensors # for `sensors` command
      # ethtool
      # pciutils # lspci
      # usbutils # lsusb
    ];
  };

  # # starship - an customizable prompt for any shell
  # programs.starship = {
  #   enable = true;
  #   # custom settings
  #   settings = {
  #     add_newline = false;
  #     aws.disabled = true;
  #     gcloud.disabled = true;
  #     line_break.disabled = true;
  #   };
  # };
}
