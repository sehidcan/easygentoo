## Easy Gentoo - Example Profile ##

## Note: if you want to use a default value, then you don't have to specify it

## keymap        name (trq, trf or us...) - default: us
keymap           trq

## boot          partition    label
boot             hda1         Boot

## swap          partition    label
swap             hda2         Swap

## home          partition    label    filesystem
home             hda7         Home     xfs

## root          partition    label    filesystem
root             hda3         Root     ext3

## extra         partition    label    filesystem     mount point
extra            hda5         Temp     reiserfs       /var/tmp
extra            hda6         Portage  xfs            /usr/portage

## windows       Windows installed partition (will be added to grub menu)
windows          sda1

## arch          desired architecture (i686 or amd64) - default: detected by $(uname -m)
arch             i686

## grub          where to install grub (hdc, sdb, sda3...) - default: root partition
grub             hda

## setup         enable/disable audio/video codec USE flags (disabled for basic, enabled for normal) - default: basic
setup            normal

## domainname    domainname to use - default: easygentoo
domainname       venus

## hostname      hostname to use - default: freshinstall
hostname         twister

## rootpass      root password - default: toor
rootpass         Tbr3Va

## username      your username - default: owner
username         tiny

## userpass      your user password - default: resu
userpass         kv693eRx

## blimit        bandwidth limit for installation (KB/s) (will not be active after setup finishes) - default: 0
blimit           125