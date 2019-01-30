# dotfiles

## vim

* Add plugin

  * `git submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/bundle/start/vim-airline`

* Update plugins

  * `git submodule update --remote --merge`
  * `git commit`

* Remove plugin

  * `git submodule deinit -f -- ./.vim/pack/bundle/start/vim-airline`
  * `rm -rf ./.git/modules/.vim/pack/bundle/start/vim-airline`
  * `git rm -f ./.vim/pack/bundle/start/vim-airline`
  * `git commit`

* Plugins
  * ALE

    * `gem install rubocop`

  * `screen -AmdS d4m ~/Library/Containers/com.docker.docker/Data/vms/0/tty`

  * `brew install ripgrep`

  * LanguageClient-neovim

    * `cd cd .vim/pack/bundle/start/LanguageClient-neovim`
    * `./install.sh`
