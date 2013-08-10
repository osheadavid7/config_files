#tmux
#bashrc

#move old files
mv ~/.tmux.conf  ~/.tmux.conf_old
mv ~/.bashrc  ~/.bashrc_old


#create sym link to synced files
#ln -s ~/config_repos/.tmux.conf ~/.tmux.conf 
#ln -s ~/config_repos/.bashrc ~/.bashrc   #
ln -s ./.bashrc ~/.bashrc -f
ln -s ./.tmux.conf ~/.tmux.conf -f
