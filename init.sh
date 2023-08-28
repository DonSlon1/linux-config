#!/bin/bash

# # Instalace závislostí (pokud nejsou nainstalovány)
# sudo pacman -Syu --noconfirm zsh neovim git tmux cargo composer python php nodejs jre-openjdk jdk-openjdk julia ruby python-pip luarocks xclip cpanminus cmake hidapi 

# # downloading of yay
# git clone https://aur.archlinux.org/yay.git
# cd yay
# makepkg -si --noconfirm
# cd ..
# rm -rf yay

# yay -Syu codelldb python-pynvim ripgrep fd
# gem install neovim
# sudo npm install -g tree-sitter
# cargo install tree-sitter-cli
# export PATH=~/.cargo/bin:$PATH
# sudo npm install -g neovim
# cpanm -n Neovim::Ext

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# yay -S --noconfirm zsh-theme-powerlevel10k-git
# echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Setup of headphone contreler
git clone https://github.com/Sapd/HeadsetControl 
cd HeadsetControl
mkdir build 
cd build
cmake ..
make
sudo make intall
sudo udevadm control --reload-rules && sudo udevadm trigger
cd ../..
rm -rf ./HeadsetControl
cp -r ./zsh/.p10k.zsh ~/
cp -r ./zsh/.zshrc ~/
mkdir ~/.config/nvim
cp -r ./nvim/* ~/.config/nvim/
mkdir ~/.config/tmux
cp -r ./tmux/* ~/.config/tmux/
mkdir ~/.scripts
cp -r ./autostart/* ~/.scripts/
mkdir ~/.config/autostart
cp -r ./autostart-config/* ~/.config/autostart

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  echo "repo zsh-syntax-highlighting alerady exist" 
else
  echo "cloning  zsh-syntax-highlighting"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  echo "repo zsh-autosuggestions alerady exist" 
else
  echo "cloning  zsh-autosuggestions"
 git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

# for font_file in fonts/*.ttf; do
#     sudo cp "$font_file" /usr/share/fonts/
# done

# sudo fc-cache -f
# chsh -s $(which zsh)

# echo "Instalace dokončena. Restartujte svůj systém nebo spusťte 'zsh' pro aktivaci Zsh a 'nvim' pro spuštění NeoVim."
