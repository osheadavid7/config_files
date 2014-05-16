config_files
============
config files used for various programs I use on various linux distros
Currently: tmux, bash, emacs
Aim: Keep config files up to date as I add aliases and other shortcuts to my config files in a controlled way.

check_db.py
python script that checks a Dropbox directory for newly synced files (as a cron job).
Moves files and folders from ./Dropbox/Some_folder Some/other/folder outside of dropbox.
Requires dropbox.py from dropbox and settings.py with the paths you desire as
DIR='desired/working/directory' ie path to above Dropbox
REMOTE_DIR='Dropbox/Some_folder'

Notice the absence of the trailing '/' in the directories!

dropbox.py
This is provided from dropbox, operates as is except that filestatus modified slightly. Recent upgrade to dropbox changed return status.
