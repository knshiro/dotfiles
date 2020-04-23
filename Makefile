install: install-deps install-dotfiles

install-dotfiles: install-deps
	ln -s `pwd`/home/.* "$(HOME)/" || >&2 echo "HOME must be clean"

install-deps: install-omz install-zsh-syntax-highlight install-iterm2-zsh

install-omz:
ifeq "$(wildcard $(HOME)/.oh-my-zsh)" ""
	(sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)") && rm "$(HOME)/.zshrc"
endif

install-zsh-syntax-highlight: install-omz
ifeq "$(wildcard $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting)" ""
	cd "$(HOME)/.oh-my-zsh/custom/plugins/" && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
endif

install-iterm2-zsh: install-omz
ifeq "$(wildcard $(HOME)/.iterm2_shell_integration.zsh)" ""
	curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
endif

