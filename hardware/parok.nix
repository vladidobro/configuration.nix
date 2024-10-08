{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ 
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/299315fe-e8b5-4b5a-8b02-01ace801599f";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/299315fe-e8b5-4b5a-8b02-01ace801599f";
      fsType = "btrfs";
      options = [ "subvol=home" "compress=zstd" ];
    };

  fileSystems."/home/data" =
    { device = "/dev/disk/by-uuid/299315fe-e8b5-4b5a-8b02-01ace801599f";
      fsType = "btrfs";
      options = [ "subvol=data" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/299315fe-e8b5-4b5a-8b02-01ace801599f";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/swap" =
    { device = "/dev/disk/by-uuid/299315fe-e8b5-4b5a-8b02-01ace801599f";
      fsType = "btrfs";
      options = [ "subvol=swap" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/22D0-6931";
      fsType = "vfat";
    };

  swapDevices = [ { device = "/swap/swapfile"; } ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };
}
