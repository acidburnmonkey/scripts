#!/bin/bash


destination=mal0@192.168.1.146:/mnt/2tb/backup
getkey="ssh -i .ssh/localserv"
destination2=mal0@192.168.1.146:/mnt/2tb/windows_backup


case $1 in
    #old script
    -o) 

    ## add more folders here -u== no overwrite duplicates ##

        # Home backups
        cp -r -u ~/scripts $destination
        cp -r -u linux-comands.txt $destination
        cp -r -u ~/PycharmProjects $destination

;;
    
    -s)
         rsync --info=progress2 -aA --delete -e $getkey --exclude 'ISO' --exclude 'Cemu' /media/toxic $destination2
         rsync --info=progress2 -aA --delete -e $getkey --exclude={'.*','Desktop','Downloads','Documents'} ~/ $destination 

         # rsync --info=progress2 -aA --delete -e $getkey ~/Nextcloud $destination 
         # rsync --info=progress2 -aA --delete -e $getkey ~/python $destination 
         # rsync --info=progress2 -aA --delete -e $getkey ~/scripts $destination 
         # rsync --info=progress2 -aA --delete -e $getkey ~/stuff $destination 
         # rsync --info=progress2 -aA --delete -e $getkey ~/programs $destination 
         # rsync --info=progress2 -aA --delete -e $getkey ~/linux-comands.txt $destination 


        ;;
        
    *)
        echo "No option selected -s (sync) or -o (old)"
        ;;  
 esac


echo "All Done"
