#!/bin/bash

# URL file biner
URL="https://raw.githubusercontent.com/Foxstoree/pterodactyl-auto-installer/main/installer.sh.x"

# Nama file biner
FILE="installer.sh.x"

# Unduh file biner
echo "Mengunduh $FILE..."
curl -s -O $URL

# Periksa apakah file berhasil diunduh
if [ -f "$FILE" ]; then
    # Berikan hak akses eksekusi
    chmod +x $FILE
    echo "Menjalankan $FILE..."
    # Jalankan file biner
    ./$FILE
else
    echo "Gagal mengunduh file."
fi
