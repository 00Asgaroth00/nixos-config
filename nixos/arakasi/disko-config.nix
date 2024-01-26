# see following links for more info
#    https://github.com/nix-community/disko/blob/master/docs/quickstart.md
#    https://github.com/nix-community/disko/blob/master/docs/HowTo.md

{ ... }: {
  disko.devices = {
    disk = {
      nvme1n1 = {
        type = "disk";
        device = "/dev/disk/by-id/nvme-Sabrent_Rocket_Q4_03F1070C0E4419321941";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            zfs = {
              size = "100%";
              content = {
                type = "zfs";
                pool = "zroot";
              };
            };
          };
        };
      };
      sdc = {
        type = "disk";
	device = "/dev/disk/by-id/ata-CT4000MX500SSD1_2242E67B842E";
	content = {
	  type = "gpt";
	  partitions = {
	    zfs = {
	      size = "100%";
	      content = {
	        type = "zfs";
		pool = "zdata";
	      };
	    };
	  };
	};
      };
      sdd = {
        type = "disk";
	device = "/dev/disk/by-id/ata-CT4000MX500SSD1_2242E67B8D3F";
	content = {
	  type = "gpt";
	  partitions = {
	    zfs = {
	      size = "100%";
	      content = {
	        type = "zfs";
		pool = "zdata";
	      };
	    };
	  };
	};
      };
    };
    zpool = {
      zroot = {
        type = "zpool";
        rootFsOptions = {
          canmount = "off";
        };
        datasets = {
          root = {
            type = "zfs_fs";
            mountpoint = "/";
            options.mountpoint = "legacy";
            postCreateHook = "zfs snapshot zroot/root@blank";
          };
          nix = {
            type = "zfs_fs";
            mountpoint = "/nix";
            options.mountpoint = "legacy";
          };
          persist = {
            type = "zfs_fs";
            options.mountpoint = "legacy";
            mountpoint = "/persist";
          };
          home = {
            type = "zfs_fs";
            options.mountpoint = "legacy";
            mountpoint = "/home";
            postCreateHook = "zfs snapshot zroot/home@blank";
          };
        };
      };
      zdata = {
        type = "zpool";
	rootFsOptions = {
	  canmount = "off";
	};
	datasets = {
	  data = {
	    type = "zfs_fs";
	    mountpoint = "/data";
	    options.mountpoint = "legacy";
	  };
	};
      };
    };
  };
}
