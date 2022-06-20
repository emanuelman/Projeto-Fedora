#fedora-workstation-repositories
echo "
--------------------------------------------------
instalar o gerenciador de repositório de terceiros
--------------------------------------------------
"
sleep 1s
sudo dnf install fedora-workstation-repositories -y

#navegadores
echo "
-------------------------------------
instalar google, brave && qutebrowser
-------------------------------------
"
sleep 1s
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

#utilitarios do terminal
echo "
--------------------------------
instalar utilitarios do terminal
--------------------------------
"
sleep 1s
sudo dnf install vim -y
sudo dnf install tmux -y
sudo dnf install ranger -y
sudo dnf install htop -y
sudo dnf install acpi -y
sudo dnf install git -y
sudo dnf install ffmpeg-free -y
sudo dnf install weechat -y
sudo dnf install pulseaudio-utils -y
sudo dnf install alsa-utils -y
sudo dnf install nmap -y

#fonts
echo "
-------------------
instalar nerd-fonts
-------------------
"
sudo mkdir /usr/local/share/fonts/ms_fonts
unzip Hack-v3.003-ttf.zip
sudo mv ttf/*.ttf /usr/local/share/fonts/ms_fonts
sudo chown root:staff /usr/local/share/fonts/ms_fonts -R
sudo chmod 644 /usr/local/share/fonts/ms_fonts/* -R
sudo chmod 755 /usr/local/share/fonts/ms_fonts
sudo fc-cache -fv

#localhost
echo "
-------------------------------
instalar mariadb, php && apache
-------------------------------
"
sleep 1s
sudo dnf install httpd -y
sudo dnf install php -y
sudo dnf install mariadb mariadb-server -y

#terminal
echo "
----------------------------------------
instalar zsh, powerlevel10key && ohmyzsh
----------------------------------------
"
sleep 1s
sudo dnf install util-linux-user -y
sudo dnf install zsh -y
zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y

#edicao de imagem e video
echo "
-------------------------------------
instalar gimp, kdenlive && Obs-Studio
-------------------------------------
"
#gimp
sudo dnf install gimp -y

#kdenlive
flatpak install --from https://flathub.org/repo/appstream/org.kde.kdenlive.flatpakref -y

#obs-studio
sudo dnf install obs-studio -y

#neovim
echo "
-----------------
instalar o neovim
-----------------
"
sudo dnf install python3-pip -y
pip install pynvim -y
sudo dnf install neovim nodejs git -y
cd .config/
mkdir nvim
cd ~
cd Projeto-Fedora/
mv init.vim ~/.config/nvim
mv coc-setting.jason ~/.config/nvim
#lembre-se de etrar no arquivo init.vim e dar o comando :PlugInstall

#bspwm
sudo dnf install -y git inxi && cd /tmp && git clone https://github.com/thespation/dpux_bspwm && chmod 755 dpux_bspwm/* -R && cd dpux_bspwm/ && ./instalar.sh

