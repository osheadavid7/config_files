#!/usr/bin/env python
import time
from subprocess import check_call, check_output,call
import subprocess
import logging
from time import gmtime, strftime
def tn(): return "["+strftime("%Y-%m-%d %H:%M:%S", gmtime())+"] "

log=open('mylog.log', 'a')
DIR='Dropbox/Sean n David/For David/'
REMOTE_DIR = 'Unsorted2/'

if check_output(['./dropbox.py', "status"]) == "Idle\n":
    log.write(tn()+'Moving files....\n')
    subprocess.Popen(["mv",DIR,REMOTE_DIR])
    subprocess.Popen(["mkdir",DIR])
else:
    log.write(tn()+'Not synced....\n')

