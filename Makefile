DIR="$(HOME)/.dotfiles"
LATEST_RUBY="2.4.1"
DOTFILE_REPO="get your own dotfiles kthx"

all: dirs brew shellz zplug tmx envlink text nvm python ruby
	echo "Enjoy your new OSX environment!"


dirs:
	[ -d $(HOME)/.dotfiles ] || git clone $(DOTFILE_REPO)/dotfiles.git $(DIR)

brew:
	command -v brew >/dev/null 2>&1 || echo >&2 "Brew not installed.  Installing..."; ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update

shellz:
	[ -d /usr/local/Cellar/zsh/ ] || echo  "Zsh not managed via Brew, installing..."; brew install zsh; echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells; chsh -s /usr/local/bin/zsh $(USER)

zplug:
	[-d $(HOME)/.zplug ] || echo "Zplug not installed, installing Zplug..."; curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

antigen:
	[ -d $(HOME)/.antigen ] || echo "Antigen not installed, installing Antigen..."; git clone https://github.com/zsh-users/antigen.git

tmx:
	command -v tmux >/dev/null 2>&1 || echo >&2 "tmux not installed, installing..."; brew install tmux
	brew install reattach-to-user-namespace

envlink:
	@ln -sf $(DIR)/ssh/ssh.config ~/.ssh/config
	@ln -sf $(DIR)/zsh/zshenv ~/.zshenv
	@ln -sf $(DIR)/zsh/zshrc ~/.zshrc
	@ln -sf $(DIR)/vim/vimrc ~/.vimrc
	@ln -nsf $(DIR)/tmux/tmux.conf ~/.tmux.conf

py:
	command -v pyenv >/dev/null 2>&1 || echo >&2 "Pyenv not installed, let me help u with that"; brew install pyenv
	pyenv install 3.6.1
	pyenv global 3.6.1
	pip install --user powerline-status

text:
	git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh && cd .. && rm -rf fonts
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

ruby:
	[ -d ~/.rbenv/versions/$(LATEST_RUBY) ] || brew install rbenv; rbenv init
	rbenv install $(LATEST_RUBY)
	rbenv global $(LATEST_RUBY)
	sudo gem install bundler -n /usr/local/bin #github.com/bundler/bundler/issues/4065
	rbenv rehash
	git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
