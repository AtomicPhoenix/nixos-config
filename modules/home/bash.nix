{pkgs, ...}: {
  home.packages = [pkgs.bash];
  programs.bash = {
    enable = true;
    enableCompletion = true;

    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
      eval "$(direnv hook bash)"

      function rebuild()  {
        RED='\033[0;31m'
        NOCOLOR='\033[0m' # No Color
        if [[ -z $host ]]; then
          host="$HOSTNAME"
          printf "\033[0;31mERROR: \033[0mNo hostname specified. Defaulting to using hostname (%s) for flake...\n" "$HOSTNAME"
        else
          host="$1"
          printf "Using flake %s...\n" "$host"
        fi
        printf "System will be rebuilt using the selected flake (%s)\n" "$host"
        printf " Rebuilding...\n\n"
        sudo nixos-rebuild switch --show-trace --flake ~/nixos-config/#$host
      }
    '';

    shellAliases = {
      docker = "sudo docker";
      ls = "ls --color=auto";
      grep = "grep --color=auto";
      reboot-windows = "sudo grub-reboot 2; reboot";
    };
  };

  # Customizable shell prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;

      aws.symbol = "  ";
      buf.symbol = " ";
      bun.symbol = " ";
      c.symbol = " ";
      cpp.symbol = " ";
      cmake.symbol = " ";
      conda.symbol = " ";
      crystal.symbol = " ";
      dart.symbol = " ";
      deno.symbol = " ";
      directory.read_only = " 󰌾";
      docker_context.symbol = " ";
      elixir.symbol = " ";
      elm.symbol = " ";
      fennel.symbol = " ";
      fossil_branch.symbol = " ";
      gcloud.symbol = "  ";
      git_branch.symbol = " ";
      git_commit.tag_symbol = "  ";
      golang.symbol = " ";
      guix_shell.symbol = " ";
      haskell.symbol = " ";
      haxe.symbol = " ";
      hg_branch.symbol = " ";
      hostname.ssh_symbol = " ";
      java.symbol = " ";
      julia.symbol = " ";
      kotlin.symbol = " ";
      lua.symbol = " ";
      memory_usage.symbol = "󰍛 ";
      meson.symbol = "󰔷 ";
      nim.symbol = "󰆥 ";
      nix_shell.symbol = " ";
      nodejs.symbol = " ";
      ocaml.symbol = " ";
      package.symbol = "󰏗 ";
      perl.symbol = " ";
      php.symbol = " ";
      pijul_channel.symbol = " ";
      pixi.symbol = "󰏗 ";
      python.symbol = " ";
      rlang.symbol = "󰟔 ";
      ruby.symbol = " ";
      rust.symbol = "󱘗 ";
      scala.symbol = " ";
      swift.symbol = " ";
      zig.symbol = " ";
      gradle.symbol = " ";

      os.symbols = {
        Alpine = " ";
        AlmaLinux = " ";
        Amazon = " ";
        Android = " ";
        Arch = " ";
        Artix = " ";
        CachyOS = " ";
        CentOS = " ";
        Debian = " ";
        DragonFly = " ";
        Emscripten = " ";
        EndeavourOS = " ";
        Fedora = " ";
        FreeBSD = " ";
        Garuda = "󰛓 ";
        Gentoo = " ";
        HardenedBSD = "󰞌 ";
        Illumos = "󰈸 ";
        Kali = " ";
        Linux = " ";
        Mabox = " ";
        Macos = " ";
        Manjaro = " ";
        Mariner = " ";
        MidnightBSD = " ";
        Mint = " ";
        NetBSD = " ";
        NixOS = " ";
        Nobara = " ";
        OpenBSD = "󰈺 ";
        openSUSE = " ";
        OracleLinux = "󰌷 ";
        Pop = " ";
        Raspbian = " ";
        Redhat = " ";
        RedHatEnterprise = " ";
        RockyLinux = " ";
        Redox = "󰀘 ";
        Solus = "󰠳 ";
        SUSE = " ";
        Ubuntu = " ";
        Unknown = " ";
        Void = " ";
        Windows = "󰍲 ";
      };
    };
  };
}
