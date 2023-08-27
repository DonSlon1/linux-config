#!/bin/bash

# Instalace závislostí (pokud nejsou nainstalovány)
sudo pacman -Syu --noconfirm zsh neovim git tmux

# downloading of yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp -r zsh/* ~/
cp -r nvim/* ~/.config/nvim/
cp -r tmux/* ~/.config/tmux/


for font_file in fonts/*.ttf; do
    sudo cp "$font_file" /usr/share/fonts/
done

sudo fc-cache -f
chsh -s $(which zsh)

echo "Instalace dokončena. Restartujte svůj systém nebo spusťte 'zsh' pro aktivaci Zsh a 'nvim' pro spuštění NeoVim."
