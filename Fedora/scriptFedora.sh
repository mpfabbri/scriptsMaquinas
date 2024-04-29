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
  echo ""
else
  clear
  echo "Procedimento Cancelado"
  exit
fi

echo "Etapa 1 - Definição de senha do Root"

echo "Desativado para teste"
#sudo passwd root 

echo "Etapa 2 - Atualização de driver"

sudo dnf check-update
sudo dnf upgrade -y

echo "Etapa 3 - Instalando Flatpaks"

sudo install com.microsoft.Edge
sudo install com.termius.Termius
sudo install com.spotify.Client

echo "Etapa 4 - Instalando DNF"

sudo install dnf zsh nvim git make pip npm nodejs cargo ripgrep -y

echo "Processo de Provisionamento do Fedora Terminado"
