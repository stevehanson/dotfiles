# == General ===================================================================

alias st="open -a SourceTree"
alias a="atom ."
alias safe="mkdir .git/safe"
alias vim="nvim"
alias ssh="TERM=xterm-256color ssh"
alias sz="source ~/.zshrc"
alias df="cd ~/dotfiles"
alias vd="vim ~/dotfiles"

# == Unix ======================================================================

alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"
alias path='print -l $PATH' # Pretty print the path

# alias "c {x}" to do "cd ~/dev/{x}"
# tab completion set up in zsh/completion/_c
function c() { cd ~/dev/$1; }

# == Git =======================================================================

alias g-="git checkout -"
alias ga="git add ."
alias gac="git add . && git commit"
alias gp="git push"
alias gamend="git commit --amend --no-edit"
alias gb="git branch --sort=-committerdate --color | head"
alias gbg="git branch --all --color --sort=-committerdate | grep -i"
alias gc="git commit"
alias gcf="git commit --fixup"
alias gwip="git commit -m \"WIP\""
alias gcm="git checkout master"
alias gcd="git checkout development"
alias gd="git diff"
alias gds="git diff --cached"
alias gdd="git branch -d"
alias gDD="git branch -D"
alias gl="git log -n 15"
alias glg="git log -n 20 --grep"
alias go="git checkout"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grh="git reset --hard"
alias gs="git status"
alias gsa="git stash apply"
alias guncommit="git reset --soft HEAD^"
alias gunc="guncommit"

# == Heroku ====================================================================

alias hconfig="heroku config --remote"
alias hc="heroku run rails c --remote"
alias hm="heroku run rake db:migrate --remote"

# == Postgres ==================================================================

alias pglog="tail -f /usr/local/var/postgres/server.log"
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

# run this if getting an error starting postgres after os x crash
alias pgdeletepid="rm /usr/local/var/postgres/postmaster.pid"

# To dump DB:
# pg_dump my_db > my_dump_db

# To restore from a dump, drop and recreate the DB, then:
# psql -d my_db -f my_dump_db

# == Rails =====================================================================

alias r="rails s"
alias rc="rails c"
alias s="rspec"
alias ms="make start"
alias routes="rails routes"
alias routesg="routes | grep"
alias rr="routesg"
alias rdb="rails db:migrate"
alias rdbt="rails db:migrate RAILS_ENV=test"
alias rdbr="rails db:rollback"
alias rdbrt="rails db:rollback RAILS_ENV=test"
alias rdbs="rails db:migrate:status | tail -n 15"
alias be="bundle exec"

# == tmux ======================================================================

alias mux="tmuxinator"
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t"
alias t="mux s"
alias tmk="tmux kill-session -t"
alias tmks="tmux kill-server"
alias tn="tmux new-session -d -s"