#!/bin/bash

BASE_DIR="$HOME/student_backup_system"
DATA_DIR="$BASE_DIR/data"
BACKUP_DIR="$BASE_DIR/backups"
LOG_DIR="$BASE_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"

backup_data() {

    # Kiểm tra thư mục backup
    mkdir -p "$BACKUP_DIR"

    TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

    BACKUP_FILE="$BACKUP_DIR/data_backup_$TIMESTAMP.tar.gz"

    tar -czf "$BACKUP_FILE" "$DATA_DIR"

    echo "[$(date)] Backup thành công: $BACKUP_FILE" >> "$LOG_FILE"

    echo "Backup hoàn tất!"
}


list_backups() {

    echo "===== DANH SÁCH BACKUP ====="
    ls -lh "$BACKUP_DIR"
}


view_logs() {

    echo "===== BACKUP LOG ====="
    cat "$LOG_FILE"
}


check_internet() {

    echo "Kiểm tra kết nối Internet..."

    if ping -c 1 google.com &> /dev/null
    then
        echo "Internet: OK"
    else
        echo "Không có Internet"
    fi
}


while true
do

echo " STUDENT BACKUP SYSTEM"
echo "1. Backup dữ liệu"
echo "2. Xem danh sách backup"
echo "3. Xem log"
echo "4. Kiểm tra Internet"
echo "5. Thoát"

read -p "Chọn: " choice

case $choice in

1)
    backup_data
    ;;

2)
    list_backups
    ;;

3)
    view_logs
    ;;

4)
    check_internet
    ;;

5)
    echo "Thoát chương trình..."
    exit
    ;;

*)
    echo "Lựa chọn không hợp lệ!"
    ;;

esac

echo ""

done
