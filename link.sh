#!/bin/bash

set -u
DOT_DIRECTORY="${HOME}/repos/dotfiles"

echo "LINK DOTFILES"

cd ${DOT_DIRECTORY}

for f in .??*
do
  # ignore files
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue
  [ "$f" = ".gitmodules" ] && continue
  [ "$f" = ".config" ] && continue
  [ "$f" = ".DS_Store" ] && continue
  ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

# fish
ln -snfv ${DOT_DIRECTORY}/.config/fish/functions/* ${HOME}/.config/fish/functions/
ln -snfv ${DOT_DIRECTORY}/.config/fish/config.fish ${HOME}/.config/fish/config.fish

echo "DONE LINK"
