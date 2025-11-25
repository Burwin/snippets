#!/bin/bash
# setup git
ssh-keygen -t ed25519 -C "michael@bamboo.dev"
ssh-add ~/.ssh/id_ed25519

# add key to github profile
cat ~/.ssh/id_ed25519.pub | wl-copy
echo "ssh key copied to clipboard"
echo "add key to GitHub profile: https://github.com/settings/keys"
