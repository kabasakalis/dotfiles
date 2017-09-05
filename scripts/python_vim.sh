#!/bin/zsh

echo "Installing essentials base system python modules"
pip install \
virtualenv \
flake8 \
isort \
jedi \
mistune \
psutil \
psutil \
setproctitle \
neovim \

echo "Done."


# neovim is the required pip module
# jedi for python completion
# mistune for markdown completion (optional)
# psutil (optional)
# setproctitle (optional)
pip3 install --user neovim jedi mistune psutil setproctitle
