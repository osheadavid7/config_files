#tmux
#bashrc

#move old files
mv ~/.tmux.conf  ~/.tmux.conf_old
mv ~/.bashrc  ~/.tmux.bashrc


#create sym link to synced files
ln -s config_repos/.tmux.conf ~/.tmux.conf 
ln -s config_repos/.bashrc ~/.bashrc   
