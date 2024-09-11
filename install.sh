#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# GitHub Personal Access Token untuk repositori private
GITHUB_TOKEN="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"

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+]                AUTO INSTALLER THEME            [+]${NC}"
  echo -e "${BLUE}[+]                  © FOXSTORE OFFC                [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "Script ini dibuat untuk mempermudah penginstalasian tema Pterodactyl,"
  echo -e "dilarang keras untuk memperjualbelikannya."
  echo -e ""
  echo -e "𝗪𝗛𝗔𝗧𝗦𝗔𝗣𝗣 :"
  echo -e "0853-7227-7748"
  echo -e "𝗬𝗢𝗨𝗧𝗨𝗕𝗘 :"
  echo -e "@foxstore_id"
  echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :"
  echo -e "@Chiwa"
  sleep 4
  clear
}

# Check license token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               LICENSE FOXSTORE OFFC             [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  
  echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
  echo -e "Akses token ada di bot Telegram: t.me/Ceaserfox_bot"
  read -r USER_TOKEN

  # URL dari API verify-token
  API_URL="http://143.198.193..90:2101/verify-token/$USER_TOKEN"

  # Memeriksa token menggunakan curl
  RESPONSE=$(curl -s "$API_URL")
  
  # Menyaring hasil JSON untuk validasi
  VALID=$(echo "$RESPONSE" | grep -o '"valid": true' | wc -l)
  MESSAGE=$(echo "$RESPONSE" | grep -o '"message": "[^"]*"' | sed 's/"message": "\(.*\)"/\1/')

  if [ "$VALID" -eq 1 ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}"
  else
    echo -e "${RED}AKSES GAGAL: $MESSAGE${NC}"
    exit 1
  fi
  clear
}


# Install theme
install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                   SELECT THEME                  [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "x. kembali"
    echo -e "masukan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL="https://github.com/Foxstoree/zip/raw/main/stellar.zip"
        ;;
      2)
        THEME_URL="https://github.com/Foxstoree/zip/raw/main/billing.zip"
        ;;
      3)
        THEME_URL="https://github.com/Foxstoree/zip/raw/main/enigma.zip"
        ;;
      x)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        continue
        ;;
    esac
    break
  done

  # Memastikan direktori /root/pterodactyl tidak ada
  if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi

  # Mengunduh tema dari repositori private menggunakan token GitHub
  curl -s -H "Authorization: token $GITHUB_TOKEN" -L "$THEME_URL" -o "$(basename "$THEME_URL")"

  # Mengecek apakah pengunduhan berhasil
  if [ $? -ne 0 ]; then
    echo -e "${RED}Gagal mengunduh tema.${NC}"
    exit 1
  fi

  # Mengekstrak file ZIP yang sudah diunduh
  sudo unzip -o "$(basename "$THEME_URL")" -d /root/pterodactyl

  # Melakukan instalasi sesuai dengan pilihan tema
  case "$SELECT_THEME" in
    1)
      echo -e "${BLUE}Memulai instalasi tema Stellar...${NC}"
      sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
      curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
      sudo apt install -y nodejs
      sudo npm i -g yarn
      cd /var/www/pterodactyl
      yarn add react-feather
      php artisan migrate
      yarn build:production
      php artisan view:clear
      ;;
    2)
      echo -e "${BLUE}Memulai instalasi tema Billing...${NC}"
      sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
      curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
      sudo apt install -y nodejs
      sudo npm i -g yarn
      cd /var/www/pterodactyl
      yarn add react-feather
      php artisan billing:install stable
      php artisan migrate
      yarn build:production
      php artisan view:clear
      ;;
    3)
      echo -e "${BLUE}Memulai instalasi tema Enigma...${NC}"
      
      # Menanyakan informasi kepada pengguna untuk tema Enigma
      echo -e "${YELLOW}Masukkan link WhatsApp (https://wa.me...) : ${NC}"
      read LINK_WA
      echo -e "${YELLOW}Masukkan link group (https://.....) : ${NC}"
      read LINK_GROUP
      echo -e "${YELLOW}Masukkan link channel (https://...) : ${NC}"
      read LINK_CHNL

      # Mengganti placeholder dengan nilai dari pengguna
      sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      
      sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
      curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
      sudo apt install -y nodejs
      sudo npm i -g yarn
      cd /var/www/pterodactyl
      yarn add react-feather
      php artisan migrate
      yarn build:production
      php artisan view:clear
      ;;
    *)
      echo -e "${RED}Pilihan tidak valid.${NC}"
      exit 1
      ;;
  esac

  # Menghapus file ZIP yang sudah diunduh
  sudo rm "$(basename "$THEME_URL")"
  sudo rm -rf /root/pterodactyl

  echo -e "${GREEN}[+] Instalasi tema berhasil!${NC}"
  sleep 2
  clear
}

# Uninstall theme
uninstall_theme() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                    DELETE THEME                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  bash <(curl -s https://raw.githubusercontent.com/Foxstoree/pterodactyl-auto-installer/main/repair.sh)
  echo -e "                                                       "
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "${GREEN}[+]                 DELETE THEME SUCCESS            [+]${NC}"
  echo -e "${GREEN}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sleep 2
  clear
}

# Main script
display_welcome
#install_jq
check_token

while true; do
  clear
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                   SELECT OPTION                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "SELECT OPTION :"
  echo "1. Install theme"
  echo "2. Uninstall theme"
  echo "x. Exit"
  echo -e "Masukkan pilihan (1/2/x):"
  read -r MENU_CHOICE
  clear

  case "$MENU_CHOICE" in
    1)
      install_theme
      ;;
    2)
      uninstall_theme
      ;;
    x)
      echo "Keluar dari skrip."
      exit 0
      ;;
    *)
      echo "Pilihan tidak valid, silahkan coba lagi."
      ;;
  esac
done
