#tmux
#bashrc

#move old files
mv ~/.tmux.conf  ~/.tmux.conf_old
mv ~/.bashrc  ~/.bashrc_old


#create sym link to synced files
#ln -s ~/config_repos/.tmux.conf ~/.tmux.conf 
#ln -s ~/config_repos/.bashrc ~/.bashrc   #
ln -s ~/config_files/.bashrc ~/.bashrc -f
ln -s ~/config_files/.tmux.conf ~/.tmux.conf -f
