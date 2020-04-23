install: install-omz install-dotfiles install-zsh-syntax-highlight

install-dotfiles: install-omz
	ln -s `pwd`/home/.* "$(HOME)/" || >&2 echo "HOME must be clean"

install-omz:
ifeq "$(wildcard $(HOME)/.oh-my-zsh)" ""
	(sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)") && rm "$(HOME)/.zshrc"
endif

install-zsh-syntax-highlight: install-omz
ifeq "$(wildcard $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting)" ""
	cd "$(HOME)/.oh-my-zsh/custom/plugins/" && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
endif
