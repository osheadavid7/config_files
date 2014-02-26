#tmux
#bashrc

#move old files
mv ~/.tmux.conf  ~/.tmux.conf_old
mv ~/.bashrc  ~/.bashrc_old
mv ~/.emacs.d/init.el  ~/.emacs.d/init.el.old

#create sym link to synced files
ln -s ~/clones/config_files/.tmux.conf ~/.tmux.conf 
ln -s ~/clones/config_files/.bashrc ~/.bashrc
ln -s ~/clones/config_files/.init.el ~/.emacs.d/init.el

#ln -s ./.bashrc ~/.bashrc -f
#ln -s ./.tmux.conf ~/.tmux.conf -f
