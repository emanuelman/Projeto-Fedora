
# --> fedora-workstation-repositories
echo "
--------------------------------------------------
instalar o gerenciador de repositório de terceiros
--------------------------------------------------
"
sleep 1s
cd ~
sudo dnf install fedora-workstation-repositories -y
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf repolist | grep rpmfusion
sudo dnf config-manager --set-enabled rpmfusion-free-updates-testing
sudo dnf config-manager --set-enabled rpmfusion-nonfree-updates-testing
dnf repolist | grep rpmfusion

# --> navegadores
echo "
-------------------------------------------------
instalar google, brave, qutebrowser && torbrowser
-------------------------------------------------
"
sleep 1s
cd ~
#google
sudo dnf config-manager --set-enabled google-chrome -y
sudo dnf install google-chrome-stable -y
#brave
sudo dnf install dnf-plugins-core -y
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/ -y
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -y
sudo dnf install brave-browser -y
#qutebrowser
sudo dnf install qutebrowser -y
#torbrowser
sudo dnf install torbrowser-launcher

# --> redes sociais
echo "
--------
telegram
--------
"
sleep 1s
cd ~
sudo dnf install telegram-desktop -y

# --> utilitarios do terminal
echo "
--------------------------------
instalar utilitarios do terminal
--------------------------------
"
sleep 1s
cd ~
sudo dnf install vim -y
sudo dnf install tmux -y
sudo dnf install ranger -y
sudo dnf install htop -y
sudo dnf install acpi -y
sudo dnf install git -y
sudo dnf install weechat -y
sudo dnf install pulseaudio-utils -y
sudo dnf install alsa-utils -y
sudo dnf install nmap -y
sudo dnf install youtube-dl -y

# --> edicao de imagem e video
echo "
------------------------------------------------
instalar gimp, kdenlive, Obs-Studio && FlameShot
------------------------------------------------
"
sleep 1s
cd ~
#gimp
sudo dnf install gimp -y
#kdenlive
flatpak install --from https://flathub.org/repo/appstream/org.kde.kdenlive.flatpakref -y
#obs-studio
sudo dnf install obs-studio -y
#flameshot
sudo dnf install flameshot -y

# --> fonts
echo "
-------------------
instalar nerd-fonts
-------------------
"
cd ~
sudo mkdir /usr/local/share/fonts/
sudo mkdir /usr/local/share/fonts/ms_fonts
mv Projeto-Fedora/nerd-font.zip ~
unzip nerd-font.zip
sudo mv *.ttf /usr/local/share/fonts/ms_fonts
sudo mv *.otf /usr/local/share/fonts/ms_fonts
sudo chown root:chmod777 /usr/local/share/fonts/ms_fonts -R
sudo chmod 644 /usr/local/share/fonts/ms_fonts/* -R
sudo chmod 755 /usr/local/share/fonts/ms_fonts
cd /usr/local/share/fonts/ms_fonts
sudo fc-cache -fv
cd ~

echo "
------
python
------
"
sleep 1s
cd ~
pip install pynvim
pip install pyautogui
pip install pandas
pip install flask
sudo yum install python3-tkinter

# --> lamp
echo "
-------------------------------
instalar mariadb, php && apache
-------------------------------
"
sleep 1s
cd ~
sudo dnf install httpd -y
sudo dnf install php -y
sudo dnf install mariadb mariadb-server -y

# --> terminal
echo "
-----------------------
instalar zsh && ohmyzsh
-----------------------
"
sleep 1s
cd ~
sudo dnf install util-linux-user -y
sudo dnf install zsh -y
echo "Congigure o zsh..."
zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

# --> neovim && vim
echo "
------------------------
instalar o neovim && vim
------------------------
"
sleep 1s
cd ~
#dependencias
sudo dnf install python3-pip -y
pip install pynvim -y
sudo dnf install neovim nodejs git -y
#neovim
cd ~
#instalar o plug para o neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#configurar
mkdir .config/nvim/
cd ~/Projeto-Fedora/
mv init.vim ~/.config/nvim
cp coc-settings.json ~/.config/nvim
#lembre-se de etrar no arquivo init.vim e dar o comando :PlugInstall
#vim
cd ~
#instalar o plug para o vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#configurar
rm -f .vimrc
mv ~/Projeto-Fedora/.vimrc ~
mv ~/Projeto-Fedora/coc-settings.json ~
cd ~
#lembre-se de etrar no arquivo vimrc e dar o comando :PlugInstall

echo "
-----------------------
organizar os diretorios
-----------------------
"
sleep 1s
cd ~
mkdir ~/Desktop/Personal
mkdir ~/Documents/Utilitarios_Terminal
ln -s ~/Desktop/Personal/Calistenia calistenia
ln -s ~/Desktop/Personal/Estudos estudos
ln -s /var/www/html localhost

echo "
--------------------------------------
instalar e configurar o bspwm && sxhkd
--------------------------------------
"
# --> bspwm
sleep 1s
sudo dnf install -y git inxi && cd /tmp && git clone https://github.com/thespation/dpux_bspwm && chmod 755 dpux_bspwm/* -R && cd dpux_bspwm/ && ./instalar.sh
