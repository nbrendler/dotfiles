#!/bin/bash

set -eo pipefail

dir=$1
olddir=~/dotfiles.old
files=$(cat <<EOF
bash_profile
bashrc
config/termite/config
fehbg
vim
vimrc
xinitrc
xmobarrc
xmonad/xmonad.hs
zshrc
EOF
)

private_files=$(cat <<EOF
aws
gitconfig
ssh/config
ngrok2/ngrok.yml
EOF
)

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo -n "Updating private dotfiles"
cd private

for file in $private_files; do
    echo "Moving any existing private dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

echo "done"
