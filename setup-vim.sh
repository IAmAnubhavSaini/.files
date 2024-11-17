#!/usr/bin/env bash
#

mkdir -p ~/.vim/{backups,swaps}
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
vim -u NONE -c ":helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q

git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
echo '" CtrlP\nlet g:ctrlp_working_path_mode = '"'ra'" >> ~/.vimrc


