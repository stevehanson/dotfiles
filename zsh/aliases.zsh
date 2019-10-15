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
alias fontnames="for file in "$arg"*.{ttf,otf}; do fc-scan --format "%{postscriptname}\n" $file; done"

# alias "c {x}" to do "cd ~/dev/{x}"
# tab completion set up in zsh/completion/_c
function c() { cd ~/dev/$1; }

# == Git =======================================================================

alias g-="git checkout -"
alias ga="git add ."
alias gac="git add . && git commit"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gamend="git commit --amend --no-edit"
alias gam="gamend"
alias gaam="git add . && gamend"
alias gb="git branch --sort=-committerdate --color | head"
alias gdbak="git branch -D bak &>/dev/null"
alias gbak="gdbak; git branch bak"
alias gb20="gb -n 20"
alias gbg="git branch --all --color --sort=-committerdate | grep -i"
alias gc="git commit"
alias gcf="git commit --fixup"
alias gempty="git commit --allow-empty"
alias gwip="git commit -m \"WIP\""
alias gcm="git checkout master"
alias gcd="git checkout development"
alias gd="git diff"
alias gds="git diff --cached"
alias gdd="git branch -d"
alias gDD="git branch -D"
alias gl="git log -n 10"
alias glg="git log -n 20 --grep"
alias go="git checkout"
alias gpr="git pull --rebase"
alias grom="git rebase origin/master"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grh="git reset --hard"
alias gs="git status"
alias gsa="git stash apply"
alias guncommit="git reset --soft HEAD^"
alias gunc="guncommit"
alias gcomp="hub compare"
alias gcompd="hub compare -b development"
alias gpulls="hub browse -- pulls"
alias gmv="git branch -m"
alias gcurrent="git rev-parse --abbrev-ref HEAD"
alias gup='git branch --set-upstream-to=origin/$(gcurrent) $(gcurrent)'
function co-pr() { git fetch origin pull/$1/head:pr/$1 && git checkout pr/$1; }

# Usage, to rebase current branch off of other branch when other branch has
# diverged: `gro other-branch last-stale-sha-or-branch-before-current-branch-changes`
# Applies commits after the stale sha on top of `other-branch`
function gro() { git rebase --onto $1 $2 $(gcurrent) }

# == Heroku ====================================================================

alias hconfig="heroku config --remote"
alias hc="heroku run rails c --remote"
alias hm="heroku run rake db:migrate --remote"

# == Node ======================================================================

alias ys="yarn start"
alias yys="yarn && yarn start"
alias ya="yarn add"
alias yad="yarn add --dev"
alias nunfuck="rm -rf node_modules && npm install"
alias yunfuck="rm -rf node_modules && yarn install"
alias yt="yarn test"
alias ytp="yarn test --testPathPattern"

# == React / React Native ======================================================

alias rn="react-native"
alias rni="react-native run-ios"
alias rna="react-native run-android"

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
alias rubo="git fetch && git diff-tree -r --no-commit-id --name-only master@\{u\} head | xargs ls -1 2>/dev/null | grep '\.rb$' | xargs rubocop"

# == tmux ======================================================================

alias mux="tmuxinator"
alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t"
alias t="mux s"
alias tmk="tmux kill-session -t"
alias tmks="tmux kill-server"
alias tn="tmux new-session -d -s"

# == vim =======================================================================

alias retag='ctags -R --exclude=.gitignore --exclude=.git --exclude=log --exclude=tmp --exclude=node_modules *'
