#!/bin/bash
#set -e

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### We are on AmOs"
	echo "################################################################"
	tput sgr0
	echo

		

		echo "Changing the whiskermenu"
		echo
		cp $installed_dir/settings/amos/whiskermenu-1.rc ~/.config/xfce4/panel/whiskermenu-1.rc
		sudo cp $installed_dir/settings/amos/whiskermenu-1.rc /etc/skel/.config/xfce4/panel/whiskermenu-1.rc
		
		cp $installed_dir/settings/amos/.face ~/.face
		sudo cp $installed_dir/settings/amos/.face /etc/skel/.face

		




		
