#!/usr/bin/env python
import time
from subprocess import check_call, check_output,call
import subprocess
import logging
import os

from time import gmtime, strftime
def tn(): return "["+strftime("%Y-%m-%d %H:%M:%S", gmtime())+"] "

import os

log=open('mylog.log', 'a')
DIR='/media/david/4ee8607d-eb37-4373-85f1-97e1d8bd0fbb/Dropbox/Sean n David/For David/' 
REMOTE_DIR = '/media/david/4ee8607d-eb37-4373-85f1-97e1d8bd0fbb/Unsorted2/'

output = check_output(['./dropbox.py', "status"])

if output == "Idle\n" or output == "Up to date\n":
    if os.listdir(DIR)==[]:
        log.write(tn()+'No files to move....\n')
    else:
        log.write(tn()+'Moving files....\n')
        subprocess.Popen(['./move_folders.sh'])
    
else:
    log.write(tn()+'Not synced....\n')

