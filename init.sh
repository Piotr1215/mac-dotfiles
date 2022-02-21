git init --bare $HOME/.dotfiles
alias dconf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dconf config --local status.showUntrackedFiles no
echo "alias dotconfig='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
echo ".dotfiles" >> .gitignore