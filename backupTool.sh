#!/bin/bash

## add more folders here -u== no overwrite duplicates ##

     # mouts the hhd
sudo mount /dev/sdc1 /media/2tb
sleep 2

destination=/media/2tb/backup

case $1 in
    #old script
    -o) 

  #the folders to backup 
cp -r -u /media/toxic/calendar2022_generated.jpg /media/2tb/backup
cp -r -u /media/toxic/camaro\ payments /media/2tb/backup
cp -r -u /media/toxic/el\ tatoo /media/2tb/backup
cp -r -u /media/toxic/Firmware\ 14.0.0.zip /media/2tb/backup
cp -r -u /media/toxic/fitness /media/2tb/backup
cp -r -u /media/toxic/Games /media/2tb/backup
cp -r -u /media/toxic/important\ documents /media/2tb/backup
cp -r -u /media/toxic/linuxbackup /media/2tb/backup
cp -r -u /media/toxic/manuals /media/2tb/backup
cp -r -u /media/toxic/Monero\ Wallet /media/2tb/backup
cp -r -u /media/toxic/Notes /media/2tb/backup
cp -r -u /media/toxic/orders /media/2tb/backup
cp -r -u /media/toxic/programs /media/2tb/backup
cp -r -u /media/toxic/video\ projects /media/2tb/backup
cp -r -u /media/toxic/photos /media/2tb/backup

# Home backups
cp -r -u ~/scripts $destination
cp -r -u linux-comands.txt $destination
cp -r -u ~/PycharmProjects $destination

;;
    
    -s)
        sudo rsync --info=progress2 -aA --delete --exclude 'ISO' /media/toxic $destination
        sudo rsync --info=progress2 -aA --delete ~/Nextcloud $destination 
        sudo rsync --info=progress2 -aA --delete ~/python $destination 
        sudo rsync --info=progress2 -aA --delete ~/scripts $destination 
        sudo rsync --info=progress2 -aA --delete ~/stuff $destination 
        sudo rsync --info=progress2 -aA --delete ~/programs $destination 
        sudo rsync --info=progress2 -aA --delete ~/linux-comands.txt $destination 


        ;;
        
    *)
        echo "No option selected -s (sync) or -o (old)"
        ;;  
 esac


 # -l will unmount the hhd when not bussy 
sudo umount -l /media/2tb
echo "All Done"
