{ flake, pkgs, ... }: 

{
  imports = [
    flake.inputs.home.darwinModules.home-manager
  ];

  system.stateVersion = 4;

  nixpkgs.hostPlatform = "aarch64-darwin";
  services.nix-daemon.enable = true;
  nix = {
    package = pkgs.nix;
    settings.experimental-features = "nix-command flakes";
    settings.trusted-users = [ "vladislavwohlrath" ];
    nixPath = [
      { nixpkgs = flake.inputs.nixpkgs; }
      { python = flake.inputs.python; }
      { sys = flake; }
    ];
    registry = {
      nixpkgs.flake = flake.inputs.nixpkgs;
      python.flake = flake.inputs.python;
      sys.flake = flake;
    };
    linux-builder.enable = true;
    buildMachines = [
      {
        sshUser = "root";
        hostName = "37.205.14.94";
        protocol = "ssh";
        system = "x86_64-linux";
        maxJobs = 8;
        publicHostKey = "c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSU9MMFNQUjlZTDJWL1FxTjFCZEttOURuL3JxbXVLWmFVSG50cUwwVWZEVUYgcm9vdEBuaXhvcwo=";
        sshKey = "/users/vladislavwohlrath/.ssh/id_private";
      }
    ];
  };

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit flake; };
  };

  programs.bash.enable = true;
  programs.zsh.enable = true;

  users.users.vladislavwohlrath.home = "/Users/vladislavwohlrath";
  home-manager.users.vladislavwohlrath = flake.hmModules.darwin;
}
