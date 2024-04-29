#!/bin/bash
clear

echo -ne '\a'

echo -ne '\v\v'"               __  __ ____  _____ _    ____  ____  ____  ___   ____   ____ ____  ___ ____ _____ ____  
              |  \/  |  _ \|  ___/ \  | __ )| __ )|  _ \|_ _| / ___| / ___|  _ \|_ _|  _ \_   _/ ___| 
              | |\/| | |_) | |_ / _ \ |  _ \|  _ \| |_) || |  \___ \| |   | |_) || || |_) || | \___ \ 
              | |  | |  __/|  _/ ___ \| |_) | |_) |  _ < | |   ___) | |___|  _ < | ||  __/ | |  ___) |
              |_|  |_|_|   |_|/_/   \_\____/|____/|_| \_\___| |____/ \____|_| \_\___|_|    |_| |____/ 
"
echo -ne '\v\v' "                    ##################               
                 ##########################           
               ##############################         
             ##################*=:.   .:=*#####       
           ##################=.          :**#####     
          #################*:           .=***#####    
         #################*.    .-+#####*******####   
        ##################.    .*#########******####  
       ###################     +###########*****##### 
      ###################*     ############*****######
      ###################*     ###########******######
      ###################*     ##########******#######
      #############*=====-     :=====*********########
      ########****=                  .=******#########
      ######******+.                 :+***############
      ####*******###*++++-     +++++##################
      ###******##########*     ###################### 
      ###*****###########*     ###################### 
      ###*****###########*     #####################  
      ###*****###########-    .####################   
      ###******#########-     +###################    
      ####******====+=-.     -###################     
      ######***:           .+##################***    
      ########*:        .-+##################  ***    
      ##########+======*###################           
        ###############################               "

echo -ne '\v\v' "############# SCRIPT PROVISIONAMENTO FEDORA #############"

echo -ne '\v\v' "Deseja continuar? [S/N]"
read continuar

if [[ $continuar == "s" || $continuar == "S" ]]; then
  clear
  echo "Inciando processo!"
else
  clear
  echo "Procedimento Cancelado"
  exit
fi

echo "Etapa 1 - Definição de senha do Root"

#echo "Desativado para teste"
sudo passwd root 

echo "Etapa 2 - Atualização de driver"

sudo dnf check-update
sudo dnf upgrade -y

echo "Etapa 3 - Instalando Flatpaks"

sudo flatpak install flathub com.microsoft.Edge -y
sudo flatpak install flathub com.termius.Termius -y
sudo flatpak install flathub com.spotify.Client -y

echo "Etapa 4 - Instalando DNF"

sudo install dnf zsh nvim git make pip npm nodejs cargo ripgrep -y

echo "Etapa 5 - Instalando e configurando powerlevel10k"
echo "5.1 - Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Digite /bin/zsh"
sudo lchsh $USER
echo "5.2 - Fonts"
wget -P /home/mpfabbri/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P /home/mpfabbri/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P /home/mpfabbri/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P /home/mpfabbri/Downloads https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
mkdir -p ~/.local/share/fonts/
cp ~/Downloads/*ttf ~/.local/share/fonts/
echo "5.3 - Autosugestion"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >>~/.zshrc
echo "5.4 - Powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "Etapa 6 - LunarVim"
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

echo "Processo de Provisionamento do Fedora Terminado"
