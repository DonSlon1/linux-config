#!/bin/bash

# Instalace závislostí (pokud nejsou nainstalovány)
sudo pacman -Syu --noconfirm zsh neovim git tmux cargo composer python php nodejs jre-openjdk jdk-openjdk julia pip ruby python-pip luarocks xclip cpanminus

# downloading of yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

yay -Syu codelldb python-pynvim ripgrep fd
gem install neovim
sudo npm install -g tree-sitter
cargo install tree-sitter-cli
export PATH=~/.cargo/bin:$PATH
sudo npm install -g neovim
cpanm -n Neovim::Ext

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp -r ./zsh ~/
mkdir ~/.config/nvim
cp -r ./nvim ~/.config/nvim/
mkdir ~/.config/tmux
cp -r ./tmux ~/.config/tmux/

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

for font_file in fonts/*.ttf; do
    sudo cp "$font_file" /usr/share/fonts/
done

sudo fc-cache -f
chsh -s $(which zsh)

echo "Instalace dokončena. Restartujte svůj systém nebo spusťte 'zsh' pro aktivaci Zsh a 'nvim' pro spuštění NeoVim."
