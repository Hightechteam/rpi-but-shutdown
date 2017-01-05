# rpi-but-shutdown
Shuts down the raspberry pi 3 on a button press. 

## Setup #

### Step 1 ###

Connect GPIO 21 to one end of a pushbutton and the other end to ground. No pullup resistor is needed, as an internal pullup is used!

### Step 2 ###

Download the master folder, unzip, and place it in a directory of your choice. Note that once the install is complete you will have to redo the following procedure if you wish to change the directory the master folder is in. I recommend placing it in /opt/. 

So from the directory in which you downloaded the .zip file perform:

```{r, engine='bash', count_lines}
unzip rpi-but-shutdown-master.zip
sudo mv rpi-but-shutdown-master /opt/
```
### Step 3 ###

Run the install script by doing:

```{r, engine='bash', count_lines}
cd /opt/rpi-but-shutdown-master
sudo bash install.sh
```
### Step 4 ### 

That is it, the program should be working. By default the python script in the master directory will be called on start up. Reboot your raspberry pi using: 

```{r, engine='bash', count_lines}
sudo reboot
```
Test it out and make sure it works!! 

### Step 5 (Optional) ### 

If you want to use a different GPIO pin for the button, then change the value of the BUT_PIN variable in the but-shutdown.py file to be whatever you want. Just make sure that is an actually BCM GPIO pin number and not a header pin number.

Reboot the raspberry pi when you are done. 

