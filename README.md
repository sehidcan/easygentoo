YOU ARE FREE TO DISTRIBUTE, CHANGE, CUSTOMIZE OR PUBLISH THIS SCRIPT
OR ANY PART OF IT.

THIS SCRIPT WILL NOT BE UPDATED/FIXED/CHANGED ANYMORE.
ANYONE WHO WANTS TO IMPROVE IT IS WELCOME :)

THIS SCRIPT IS INCOMPLETE AND NOT SUITABLE FOR LINUX BEGINNERS. THIS
SCRIPT MAY HAVE LOTS OF BUGS AND/OR MAY CAUSE UNEXPECTED DATA LOSS AND/OR
MAY WASTE YOUR VALUABLE TIME. IT IS NOT RECOMMENDED TO TEST THIS SCRIPT
ON A DAILY USED COMPUTER. PLEASE USE AT YOUR OWN RISK.

I'M NOT A PROGRAMMER AND I CREATED THIS SCRIPT AS A HOBBY FOR MY OWN NEEDS.

I KNOW NOTHING ABOUT SOFTWARE LICENSES, SO THIS CODE
PILE (>2500 LINES) IS LICENSED UNDER "ALL YOURS".

THERE MUST BE SOME MISTAKES OR PARTS THAT NEED
IMPROVING. I RECOMMEND YOU TO USE IT IN A VIRTUAL ENVIRONMENT FIRST.
DON'T FORGET TO CROSS FINGERS WHILE USING IT ON A REAL MACHINE :)


Easy Gentoo
===========

Bash script for easy Gentoo installation

"Easy Gentoo" is a bash script, which is basically a combination of
Gentoo Handbook steps, that installs Gentoo Linux from a stage3 tarball.
The overall procedure is unattended, everything is handled by script.
Installation includes "localization (English, Brazilian and Turkish),
kernel compilation, X server setup, desktop environment setup (Xfce)"
and more. These steps are enabled or disabled according to a profile.

Profile is a simple text file which has the necessary options, settings
etc. for the installation. (Profile must be named as "profile") With
a proper profile, it is possible to have a basic system (without X) or
a ready to use Xfce desktop with a few key strokes.

"Easy Gentoo" was tested on lots of machines with different profiles.
Many successful installations were made. Hope it becomes a time-saver
for you. Happy compiling!

*** IMPORTANT NOTES ***
- Easy Gentoo doesn't do partitioning, you need to do that by yourself.
  It formats and mounts your selection of existing partitions.
- Using a capable intallation media which has more filesystem utilities,
  Easy Gentoo can format, mount, configure partitions for these filesystems:
  "btrfs, ext2, ext3, ext4, ntfs, reiserfs, xfs"
- Localization is based on your "keymap". "us" is for English,
  "br" is for Brazilian, "trq" and "trf" are for Turkish.
- A temporary swap file with 1 GB size is created as a precaution if root
  partition is bigger than 8 GB
- There are two install types;
  basic:   doesn't include X,Gdm,Xfce,Alsa,NetworkManager
  normal:  includes X,Gdm,Xfce,Alsa,NetworkManager
  base system configuration is the same for both
- Easy Gentoo needs an ethernet connection to operate, wireless connection
  is not an option. Because when connection is lost, reconnection attemps
  are based on eth* names. (ex. dhcpcd eth0)
- If the host computer is a laptop, some USE flag changes and additional
  package merges are made (these have nothing to do with wireless)
- Stable packages are used
- Based on a stage3 tarball (latest one)
- CFLAGS="-march=native -O2 -pipe"
- LDFLAGS="-Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,--hash-style=gnu"
- Mirrors for Turkish users:
      http://ftp.linux.org.tr/gentoo 
      ftp://ftp.linux.org.tr/gentoo 
      ftp://mirrors.linuxant.fr/distfiles.gentoo.org
  Mirrors for other users:
      ftp://mirrors.linuxant.fr/distfiles.gentoo.org
      http://gentoo.supp.name
      http://portage.org.ua
- Portage profile is "${arch}/13.0/ for basic install"
  and "${arch}/13.0/desktop for normal install"
- Kernel has lots of drivers activated to help to get an error free first boot
- Grub legacy is used, not Grub2
- No system logger and no cron included
- A few performance and security related sysctl settings are included
- sudo configuration and some aliases are included
- File manager is Thunar with automount support
- Login Manager is GDM

*** After Using Easy Gentoo, you should check/change these ***
- Timezone
- Grub config (parameters, title)
- Startup services
- USE flags (default ones may not be enough for you)
- Mirrors
- Kernel config (it is recommended to compile a new kernel with a customized config)
- Compile list (to check if your 'must have' ones are installed)

*** How to use ***
- Boot from an installation media (ex. Gentoo Minimal Install CD)
- execute these commands:
  wget https://raw.github.com/shdcn/easygentoo/master/easygentoo
  chmod +x easygentoo
  chmod 755 easygentoo
- create a profile
  for more information on profile please read:
  https://github.com/shdcn/easygentoo/blob/master/profile
- start script:
  sh easygentoo

*** Steps for basic install ***
 1- Check if necessary tools/commands are available to continue
 2- Format partitions
 3- Mount partitions
 4- Check mirrors
 5- Download and extract latest stage3 tarball and portage snapshot
 6- Continue inside chroot
 7- Create a temporary make.conf
 8- Emerge portage and some tools
 9- Create locale.gen
10- Update make.conf and create package.use
11- Do a controlled "emerge -e system"
12- Kernel compilation (genkernel) with lots of needed settings/drivers
13- Emerge grub and create grub.conf
    *** Steps for normal install ***
    --- Emerge xorg-server and create xorg.conf
    --- Emerge and configure Xfce
    --- Emerge and configure Gdm Login Manager
    --- Configure evdev
    --- Emerge NetworkManager
    --- Emerge and configure Alsa
14- Create/update configuration files (localtime, keymaps, hostname, etc)
15- Change locale based on keymap
16- Change root password and create user
17- Update /etc/sudoers and .bashrc
18- Unmerge unnecessary packages and do "emerge -uDN world"
19- Purge unnecessary man pages etc. (localepurge)
20- Create a small report about whole process.
21- Delete temporary files that were created by script
22- Shutdown computer