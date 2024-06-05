#!/bin/bash

# Warna
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "                                                       "
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                                                 [+]${NC}"
echo -e "${BLUE}[+]            WELCOME TO AUTO INSTALLER            [+]${NC}"
echo -e "${BLUE}[+]               OPYRIGHT BY FOXSTORE              [+]${NC}"
echo -e "${BLUE}[+]               inspiration by chiwa              [+]${NC}"
echo -e "${BLUE}[+]                                                 [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
echo -e "𝗔𝗧𝗧𝗘𝗡𝗧𝗜𝗢𝗡 :                                            "
echo -e "script ini di buat untuk mempermudah penginstalasian   "
echo -e "terkait pterodactyle, gunakan script sebaik baiknya.   "
echo -e "                                                       "
echo -e "𝗔𝗨𝗧𝗛𝗢𝗥 :                                              "
echo -e "Foxstore                                               "
echo -e "𝗪𝗛𝗔𝗧𝗦𝗔𝗣𝗣 :                                            "
echo -e "0853 7227 7748                                         "
echo -e "𝗬𝗢𝗨𝗧𝗨𝗕𝗘 :                                             "
echo -e "@foxstore                                              "
echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :                                              "
echo -e "Chiwa                                                  "
sleep 4
clear

echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]             UPDATE & INSTALL JQUERY             [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
sudo apt update
sudo apt install -y jq
echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]              INSTALL JQUERY BERHASIL            [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "                                                       "
sleep 1
clear
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                 LICENSY FOXSTORE                [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
fox=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x65\x74\x70\x61\x6E\x74\x72\x79\x2E\x63\x6C\x6F\x75\x64\x2F\x61\x70\x69\x76\x31\x2F\x70\x61\x6E\x74\x72\x79\x2F\x31\x31\x64\x34\x65\x33\x34\x64\x2D\x30\x39\x33\x34\x2D\x34\x39\x35\x38\x2D\x39\x64\x30\x36\x2D\x35\x32\x34\x31\x39\x65\x66\x38\x30\x61\x65\x61\x2F\x62\x61\x73\x6B\x65\x74\x2F\x54\x68\x65\x6D\x61\x61\x63\x63\x65\x73\x73
")
foxx=$(curl -s "$fox" | jq -r .token)

echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
read USER_TOKEN

if [ "$USER_TOKEN" != "$foxx" ]; then
  echo -e "${RED}TOKEN SALAH,KELUAR DARI SCRIPT.${NC}"
  exit 1
else
  echo -e "${GREEN}AKSES BERHASIL${NC}"
fi
clear
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                   SELECT OPTION                 [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
echo -e "SELECT OPTION :"
echo "1. Install panel"
echo "2. Install tema"
echo "3. Uninstall tema"
echo -e "Masukkan pilihan (1/2/3):"
read MENU_CHOICE
clear
# Install Jquery
install_panel() {
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                   INSTALL PANEL                 [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
    if [ -d /var/www/pterodactyl ]; then
        echo -e "${GREEN}PANEL SUDAH DI INSTALL.${NC}"
    else    
  bash <(curl -s https://pterodactyl-installer.se)
echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]                INSTALL PANEL SUCCCESS           [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "                                                       "
fi
}
install_tema() {
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                   SELECT THEME                  [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
echo -e "PILIH THEMA YANG INGIN DI INSTALL"
echo "1. stellar"
echo "2. billing"
echo "x. kembali"
echo -e "masukan pilihan (1/2) :"
read SELECT_THEME
case "$SELECT_THEME" in
1)
THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x32\x2E\x7A\x69\x70
")
;;
2)
THEME_URL=$(echo -e "\x68\x74\x74\x70\x73\x3A\x2F\x2F\x67\x69\x74\x68\x75\x62\x2E\x63\x6F\x6D\x2F\x44\x49\x54\x5A\x5A\x31\x31\x32\x2F\x66\x6F\x78\x78\x68\x6F\x73\x74\x74\x2F\x72\x61\x77\x2F\x6D\x61\x69\x6E\x2F\x43\x31\x2E\x7A\x69\x70
")
;;
*)
echo -e "Pilihan tidak ada,proses keluar dari script"
exit 1
;;
esac
  # Memastikan tidak ada file atau direktori bernama pterodactyl sebelum mengekstrak
  if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL"
  sudo unzip -o "$(basename "$THEME_URL")"
  
  if [ "$SELECT_THEME" -eq 1 ]; then
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                                   "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  sudo npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C2.zip
  sudo rm -rf /root/pterodactyl

echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e ""
  exit 0
  
  elif [ "$SELECT_THEME" -eq 2 ]; then
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
  sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
  curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
  sudo apt install -y nodejs
  npm i -g yarn
  cd /var/www/pterodactyl
  yarn add react-feather
  php artisan billing:install stable
  php artisan migrate
  yarn build:production
  php artisan view:clear
  sudo rm /root/C1.zip
  sudo rm -rf /root/pterodactyl

echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "                                                       "
  exit 0
  else
    echo "Pilihan tidak valid. silahkan pilih 1/2/3."
fi
}
uninstall_tema() {
echo -e "                                                       "
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "${BLUE}[+]                    DELETE THEME                 [+]${NC}"
echo -e "${BLUE}[+] =============================================== [+]${NC}"
echo -e "                                                       "
    bash <(curl https://raw.githubusercontent.com/Foxstoree/pterodactyl-auto-installer/main/repair.sh)
echo -e "                                                       "
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "${GREEN}[+]                 DELETE THEME SUCCES             [+]${NC}"
echo -e "${GREEN}[+] =============================================== [+]${NC}"
echo -e "                                                       "
}
case "$MENU_CHOICE" in
  1)
    install_panel
    ;;
  2)
    install_tema
    ;;
  3)
    uninstall_tema
    ;;
  *)
    echo "Pilihan tidak valid, keluar dari skrip."
    exit 1
    ;;
esac
