#!/usr/bin/env python
import logging
import sys
from subprocess import call
sys.path.append('./') #for dropbox.py and settings.py
sys.stdout = open('mylog.log', 'a')
from settings import lnk,ulk,dwd
import os
from time import gmtime, strftime

def tn(): return "["+strftime("%Y-%m-%d %H:%M:%S", gmtime())+"] " 
log=open('mylog.log','a')

def check_wd(dwd):
#check wd
    if os.getcwd()==dwd:
        pass
    else:
    #set wd
        os.chdir(dwd)
    
def check_path(lnk,ulk):
    p,dirs,files=os.walk(lnk).next()
    if len(dirs)!=0:
        log.write(tn()+' Found %s folders \n' %len(dirs))
        for dr in dirs:
            status=call(["./dropbox.py","filestatus",dr])
            if status==1:
            #Move synced folders
                log.write(tn()+'Moving %s ... \n' %str(dr))
                call(["mv",lnk+'/'+dr,ulk+'/'+dr])
    else:
        log.write(tn()+' No folders found \n')
    if len(files)!=0:
        log.write(tn()+' Fould %s files' %len(files))
        for f in files:
            status=call(["./dropbox.py","filestatus",f])
            if status==1:
                log.write('Moving %s ...\n' %str(f))
                call(["mv",lnk+'/'+f,ulk+'/'+f])
    else:
        log.write(tn()+' No files found\n')
    log.close()


def do_all(lnk,ulk,dwd):
    check_wd(dwd)
    check_path(lnk,ulk)
    

        
if __name__ =='__main__':
    do_all(lnk,ulk,dwd)
    print tn()+' script has run'
