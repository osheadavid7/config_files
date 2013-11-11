import sys
from subprocess import call
sys.path.append('./')
import os

#set log file
LOGFILE="/home/david/clones/config_files/checkdb.log"


#check wd
dwd='/media/david/4ee8607d-eb37-4373-85f1-97e1d8bd0fbb' 
if os.getcwd()==dwd:
    pass
else:
    #set wd
    os.chdir(dwd)
    

#Set directory to watch
lnk="Dropbox/Sean n David/For David"       
ulk="Unsorted"
#check if dir is up yo date
status=call(["./dropbox.py","filestatus",lnk])
#
if status==0:
    #look for folders
    p,dirs,files=os.walk(lnk).next()
    #if there are subfolders, move them
    if len(dirs)!=0:
        for dr in dirs:
            call(["mv",lnk+'/'+dr,ulk+'/'+dr])
else:
    #Not yet synced
        
