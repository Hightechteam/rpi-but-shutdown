'''
Author: Kevin Lutzer
Date: Dec 29 2016
Description: Script that runs in the background. Shuts down the pi when a GPIO
pin goes low or high
'''

import time
import RPi.GPIO as GPIO
import os

# global vars
TIME_DELAY = 500
BUT_PIN = 21


# setup helper function for event callback
def shutdown(c):
    os.system("sudo shutdown -r now")

# setup gpio and event listener
GPIO.setmode(GPIO.BCM)
GPIO.setup(BUT_PIN, GPIO.IN, pull_up_down = GPIO.PUD_UP)
GPIO.add_event_detect(BUT_PIN, GPIO.FALLING, callback = shutdown, bouncetime = 2000)


while True:
    time.sleep(TIME_DELAY)
