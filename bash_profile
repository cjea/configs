echo "Sourcing .bash_profile . . ."
MYSQL=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL:/usr/local/mysql/support-files
export PATH=$PATH:$(yarn global bin)
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PGDATA=/usr/local/pgsql/data
export PATH="$HOME/.rbenv/bin:$PATH"

source ~/.profile
eval "$(rbenv init -)"

alias echopath='echo $PATH | tr ":" "\n"'

alias cp='cp -iv'
alias mkdir='mkdir -pv'

alias cd..='cd ../'
alias ..='cd ../'
alias f='open -a Finder ./'
alias lsl='ls -l'

mkcd () { mkdir -p "$1" && cd "$1"; }

alias qfind="find . -name "
alias prof="vim ~/.bash_profile"
alias mysql_mem="in_memory_mysql.command"
alias r="source ~/.zshrc"

alias connect="cd ~/code/connect/"

alias rc="rails console"
alias rs="bundle exec rails s"

alias prof="vim ~/.bash_profile"

alias nsd="npm start DEV_MODE"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

unsetopt inc_append_history
unsetopt share_history

alias histconnect="deploy_history connect -r -j"
alias c="ssh console"

alias gitplugin="vim ~/.oh-my-zsh/plugins/git/git.plugin.zsh"

dkme () { eval "$(docker-machine env $1)" }

alias refip="refmt --in-place"
alias sr="screen -r"

alias local-rabbit="docker run --rm -d -p 35672:5672 --name rabbitmq-local-test rabbitmq"

colo-prod () (cd ~/code/kparanoid && ./kparanoid start colo-service-prod)

cp-colo-creds () {
	if [ $1 = "staging" ]; then
		scp $(whoami)@rampmaster:/etc/kubernetes/clients/staging.svc-admin.conf ~/tmp/colo-service-staging  && echo "copying staging creds into ~/tmp/colo-service-staging"
	elif [ $1 = "prod" ]; then
		scp $(whoami)@rampmaster:/etc/kubernetes/clients/prod.svc-admin.conf ~/tmp/colo-service-prod && echo "copying prod creds into ~/tmp/colo-service-prod"
	else
		echo "please enter either staging or prod"	
	fi
}
