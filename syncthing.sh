#!/bin/bash

daemonize /usr/sbin/syncthing serve --no-browser --home=/home/dragut/.config/syncthing --gui-address=http://127.0.0.1:2103 --logfile=/home/dragut/.config/syncthing/syncthing.log
