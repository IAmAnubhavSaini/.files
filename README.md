# .files

the dotfiles and more

- .vimrc-simple `cp ~/.files/.vimrc-simple ~/.vimrc`
- .gitignore (global)
- .bashrc
- .gitconfig

## For .vimrc

### backup and swap

```bash
## need ~/.vim/backups and ~/.vim/swaps directories
md -p ~/.vim/{backups,swaps}
```

### nerdtree

```bash
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
```

### vim-airline

```bash
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
vim -u NONE -c ":helptags ~/.vim/pack/dist/start/vim-airline/doc" -c q
```

### ctrl P

```bash
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugins/start/ctrlp
echo '" CtrlP\nlet g:ctrlp_working_path_mode = '"'ra'" >> ~/.vimrc
```

## Build debian container

```bash
docker build . --file debian.Dockerfile --tag f0c1s/debian:2024.11.17_7
docker run --interactive --tty --rm f0c1s/debian:2024.11.17_7
```

