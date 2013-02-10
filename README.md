-------------------------------------------------------------------------
YOU ARE FREE TO DISTRIBUTE, CHANGE, CUSTOMIZE OR PUBLISH THIS SCRIPT
OR ANY PART OF IT.

THIS SCRIPT WILL NOT BE UPDATED/FIXED/CHANGED ANYMORE.
ANYONE WHO WANTS TO IMPROVE IT IS WELCOME :)

THIS SCRIPT IS INCOMPLETE AND NOT SUITABLE FOR LINUX BEGINNERS. THIS
SCRIPT MAY HAVE LOTS OF BUGS AND/OR MAY CAUSE UNEXPECTED DATA LOSS AND/OR
MAY WASTE YOUR VALUABLE TIME. IT IS NOT RECOMMENDED TO TEST THIS SCRIPT
ON A DAILY USED COMPUTER. PLEASE USE AT YOUR OWN RISK.

AS A SIDE NOTE; I'M NOT A PROGRAMMER AND I CREATED THIS SCRIPT AS A HOBBY
FOR MY OWN NEEDS. THERE MUST BE SOME MISTAKES OR PARTS THAT NEED
IMPROVING. I RECOMMEND YOU TO USE IT IN A VIRTUAL ENVIRONMENT FIRST.
DON'T FORGET TO CROSS FINGERS WHILE USING IT ON A REAL MACHINE :)
-------------------------------------------------------------------------

Easy Gentoo
===========

Bash script for easy Gentoo installation

"Easy Gentoo" is a bash script, which is basically a combination of
Gentoo Handbook steps, that installs Gentoo Linux from a stage3 tarball.
The overall procedure is unattended, everything is handled by script.
Installation includes "localization (English and Turkish), kernel
compilation, X server setup, desktop environment setup (Xfce)" and more.
These steps are enabled or disabled according to a profile.

Profile is a simple text file which has the necessary options, settings
etc. for the installation. (Profile must be named as "profile") With
a proper profile, it is possible to have a basic system (without X) or
an Xfce desktop with a few key strokes.

Using a capable intallation media which has more filesystem utilities,
you can use "btrfs, jfs, nfs, xfs, reiserfs, ext2, ext3, ext4" in your
profile for partitions.

*** Steps for basic install ***
 1- Check if necessary tools/command are available to continue
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
12- Kernel compilation (genkernel)
13- Emerge grub and create grub.conf
    *** Steps for normal installation ***
    --- Emerge xorg-server and create xorg.conf
    --- Emerge and configure Xfce
    --- Emerge and configure Gdm Login Manager
    --- Configure evdev settings
    --- Emerge NetworkManager
    --- Emerge Pulseaudio
14- Create/update configuration files (localtime, keymaps, hostname, etc)
15- Change locale based on keymap
16- Change root password and create user
17- Update /etc/sudoers and .bashrc
18- Unmerge unnecessary packages and do "emerge -uDN world"
19- Purge unnecessary man pages etc. (localepurge)
20- Create a small report about whole process.
21- Delete temporary files that script created
22- Shutdown computer

"Easy Gentoo" was tested on lots of machines with different profiles.
Many successful installations were made. Hope it becomes a time-saver
for you. Happy compiling!