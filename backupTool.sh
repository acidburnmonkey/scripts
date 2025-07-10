#!/bin/bash


destination=mal0@192.168.1.146:/mnt/2tb/backup
getkey="ssh -i .ssh/localserv"
destination2=mal0@192.168.1.146:/mnt/2tb/windows_backup


case $1 in
    --import)
        rsync --info=progress2 -aA mal0@192.168.1.146:/home/mal0/scripts $HOME/server/
        rsync --info=progress2 -aA mal0@192.168.1.146:/home/mal0/startup.sh $HOME/server/
        rsync --info=progress2 -aA mal0@192.168.1.146:/home/mal0/.zshrc $HOME/server/zshrc
        rsync --info=progress2 -aA --delete mal0@192.168.1.146:/mnt/barracuda1/backup/* $HOME/ServerBackups/

        ;;

    -s)
        rsync --info=progress2 -aA --delete  --exclude={'Cemu','iso','video projects'} /media/Toxic $destination2
        rsync --info=progress2 -aA --delete  --exclude={'.*','Desktop','Downloads','Documents','boxshare','repos','tor','test*','ServerBackups','go'} ~/ $destination

         # -e started conpyging private key Dont use anymore
         ;;

     *)
         echo "No option selected -s (sync) or --import (server to client)"
         ;;
 esac


 echo "All Done"
