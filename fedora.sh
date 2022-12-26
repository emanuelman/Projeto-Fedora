#!/usr/bin/env bash

##### COMECO DAS FUNCOES #####
function fedora_workstation_repositories(){
echo "
--------------------------------------------------
instalar o gerenciador de repositório de terceiros
--------------------------------------------------
"
sleep 1s
cd ~
sudo dnf install fedora-workstation-repositories -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf repolist | grep rpmfusion -y
sudo dnf config-manager --set-enabled rpmfusion-free-updates-testing -y
sudo dnf config-manager --set-enabled rpmfusion-nonfree-updates-testing -y
sudo dnf repolist | grep rpmfusion -y
}

function navegadores(){
echo "
-----------------------------------------------------------
instalar google, brave, qutebrowser, torbrowser && telegram
-----------------------------------------------------------
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
    sudo dnf install torbrowser-launcher -y
#telegram
    sudo dnf install telegram-desktop -y
}

function utilitarios_terminal(){
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
}

function edicao_de_imagem_e_video(){
echo "
----------------------------------------------
instalar gimp, Piviti, Obs-Studio && FlameShot
----------------------------------------------
"
sleep 1s
cd ~
#gimp
    sudo dnf install gimp -y
#piviti
    #enable:
        flatpak remote-modify --enable flathub
    #install:
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        flatpak install flathub org.pitivi.Pitivi
    #updating:
        #flatpak update org.pitivi.Pitivi
    #unistalling:
        #flatpak uninstall org.pitivi.Pitivi
#obs-studio
    sudo dnf install obs-studio -y
#flameshot
    sudo dnf install flameshot -y
}

function instalar_fonts(){
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
}

function bibliotecas_python(){
echo "
------
python
------
"
sleep 1s
cd ~
sudo dnf install python3-pip -y
sudo yum install python3-tkinter -y
pip install pynvim -y
pip install pyautogui -y
pip install pandas -y
pip install flask -y
}

function lamp(){
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
}

function terminal(){
echo "
-----------------------
instalar zsh && ohmyzsh
-----------------------
"
sleep 1s
cd ~
sudo dnf install util-linux-user -y
sudo dnf install zsh -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
}

function neovim_and_vim(){

echo "
------------------------
instalar o neovim && vim
------------------------
"
sleep 1s
cd ~
#dependencias
    sudo dnf install neovim nodejs git -y
#neovim
    cd ~
    #instalar o plug para o neovim
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    #configurar
        mkdir .config/nvim/
        mv ~/Projeto-Fedora/init.vim ~/.config/nvim
        mv ~/Projeto-Fedora/coc-settings.json ~/.config/nvim
    #lembre-se de etrar no arquivo init.vim e dar o comando :PlugInstall
#vim
    cd ~
    #instalar o plug para o vim
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    #configurar
        rm -f .vimrc
        mv ~/Projeto-Fedora/.vimrc ~
        mv ~/Projeto-Fedora/coc-settings.json ~
        cd ~
    #lembre-se de etrar no arquivo vimrc e dar o comando :PlugInstall
}

function organizar_diretorios(){
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
ln -s Desktop/Personal/Projetos projetos
ln -s ~/Desktop/Personal/Estudos estudos
ln -s /var/www/html localhost
}

function bspwm(){
echo "
--------------------------------------
instalar e configurar o bspwm && sxhkd
--------------------------------------
"
# --> bspwm
sleep 1s
sudo dnf install -y git inxi && cd /tmp && git clone https://github.com/thespation/dpux_bspwm && chmod 755 dpux_bspwm/* -R && cd dpux_bspwm/ && ./instalar.sh -y
}

function verificar(){
exitStatus=$?
if [ $exitStatus -eq 0 ]; then
    echo ""
elif [ $exitStatus -ne 0 ]; then
    echo "ERRO!"
    echo "status de saida: $exitStatus?"
    exit
fi
}

function executar(){
fedora_workstation_repositories
verificar

navegadores
verificar

utilitarios_terminal
verificar

edicao_de_imagem_e_video
verificar

instalar_fonts
verificar

bibliotecas_python
verificar

lamp
verificar

terminal
verificar

neovim_and_vim
verificar

organizar_diretorios
verificar
}
#####FINAL DAS FUNCOES#####

executar
#OBS: Não vou ferificar a "função bspwm"
bspwm
