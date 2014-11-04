# Add bash completion for ssh: it tries to complete the host to which you 
# want to connect from the list of the ones contained in ~/.ssh/known_hosts

__ssh_config() {
    if [[ -f ~/.ssh/config ]]; then
        cut -d " " -f2 ~/.ssh/config
    fi
}

_ssh() {
    local cur config
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    hosts_alias="$(__ssh_config)"
    
    if [[ ! ${cur} == -* ]] ; then
	COMPREPLY=( $(compgen -W "${hosts_alias}" -- ${cur}) )
        return 0
    fi
}

complete -o bashdefault -o default -o nospace -F _ssh ssh 2>/dev/null \
    || complete -o default -o nospace -F _ssh ssh
