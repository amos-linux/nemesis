#!/bin/bash
echo '

[am-repo]
SigLevel = Optional TrustedOnly
Server = https://amanre.github.io/$repo/$arch

[amos-3rd-party-repo]
SigLevel = Optional TrustedOnly
Server = https://amanre.github.io/$repo/$arch' | sudo tee --append /etc/pacman.conf
