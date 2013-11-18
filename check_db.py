#!/usr/bin/env python
import logging
import sys
from subprocess import call
sys.path.append('./') #for dropbox.py and settings.py
sys.stdout = open('example.log', 'a')
from settings import lnk,ulk,dwd
import os
from time import gmtime, strftime

def tn(): return "["+strftime("%Y-%m-%d %H:%M:%S", gmtime())+"] " 
log=open('mylog.log','a')

#set log file
#logging.basicConfig(format='%(asctime)s %(message)s', datefmt='%m/%d/%Y %I:%M:%S %p',filename='example.log',level=logging.DEBUG)


def check_wd(dwd):
#check wd
    if os.getcwd()==dwd:
        pass
    else:
    #set wd
        os.chdir(dwd)
    

def check_path(lnk,ulk):
    #check if dir is up yo date
    status=call(["./dropbox.py","filestatus",lnk])
    #
    if status==0:
    #look for folders
 #       logging.info('filestatus == %s (synced)',str(status))
        log.write(tn()+' filestatus is %s (synced) \n' %str(status))
        p,dirs,files=os.walk(lnk).next()
    #if there are subfolders, move them
        if len(dirs)!=0:
#            logging.info('Found %s folders',len(dirs))
            log.write(tn()+'Found %s folders \n' %len(dirs))
            for dr in dirs:
#                logging.info('Moving %s ...',str(dr))
                log.write(tn()+'Moving %s ... \n' %str(dr))
                call(["mv",lnk+'/'+dr,ulk+'/'+dr])
        else:
#            logging.info('No folders found')
            log.write(tn()+' No folders found \n')
        if len(files)!=0:
#            logging.info('Found %s files',len(files))
            log.write(tn()+' Fould %s files' %len(files))
            for f in files:
            #    logging.info('Moving %s ...',str(f))
                log.write('Moving %s ...\n' %str(f))
                call(["mv",lnk+'/'+f,ulk+'/'+f])
        else:
            log.write(tn()+' No files found\n')
    else:
    #Not yet synced
        log.write(tn()+' Not yet synced, try again later\n')
    log.close()

def do_all(lnk,ulk,dwd):
    check_wd(dwd)
    check_path(lnk,ulk)
    

        
if __name__ =='__main__':
    do_all(lnk,ulk,dwd)
    print 'script has run'
