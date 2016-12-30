# Author: Kevin Lutzer
# Date: December 29 2016
# Description: Creates file in etc/init.d that will call python script on execute

# install directory to install created file into into
INSTALL_DIR=/etc/init.d/
# current directory that the script with reference
CURRENT_DIR=$(pwd)
# file name of the bash script and python script
FILE_NAME=but-shutdown
# create script that will be called on boot
touch $FILE_NAME
echo "Creating start up script"
# create script file
echo "#!/bin/bash
### BEGIN INIT INFO
# Provides:          but-shutdown
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: shutdown pi with push of button
# Description: calls a script that will shutdown the raspberry pi on a button press
### END INIT INFO

# run the buttone shutdown script as a background process
python $CURRENT_DIR/$FILE_NAME.py
" > $FILE_NAME
# add the correct permisions to the file so that it can be executed
sudo chmod 755 $FILE_NAME
# move the script into the right dirctory
sudo mv $FILE_NAME $INSTALL_DIR$FILE_NAME
echo "Move script into $INSTALL_DIR"
# update the register script
sudo update-rc.d $FILE_NAME defaults
echo "Update start up "
