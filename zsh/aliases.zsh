# == General ===================================================================

alias st="open -a SourceTree"
alias safe="mkdir .git/safe"
alias vim="nvim"
alias ssh="TERM=xterm-256color ssh"
alias heroku="TERM=xterm-256color heroku"
alias sz="source ~/.zshrc"
alias df="cd ~/dotfiles"
alias vd="vim ~/dotfiles"
alias ng="ngrok http 3000"
alias ip="curl ifconfig.me"

# == Unix ======================================================================

alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"
alias path='print -l $PATH' # Pretty print the path
function findGem() { find . -type f -name "Gemfile" -exec grep -q -e '$1' {} \; -print}
alias sizeofdir="du -h -d 1" # supply dir after
alias backmeup="~/dev/backmeup/backmeup"

# alias "c {x}" to do "cd ~/dev/{x}"
# tab completion set up in zsh/completion/_c
function c() { cd ~/dev/$1; }

# == Git =======================================================================

alias g-="git checkout -"
alias ga="git add ."
alias gac="git add . && git commit"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gam="git commit --amend --no-edit"
alias gamm="git commit --amend"
alias gb="git branch --sort=-committerdate --color --format='%(color:bold cyan)%(HEAD)%(color:reset) %(if)%(HEAD)%(then)%(color:bold cyan)%(end)%(refname:short)%(color:reset) %(color:red)%(committerdate:relative)%(color:reset)' | head"
alias gdbak="git branch -D bak &>/dev/null"
alias gbak="gdbak; git branch bak"
alias gbg="git branch --all --color --sort=-committerdate | grep -i"
alias gc="git commit"
alias gcf="git commit --fixup"
alias gempty="git commit --allow-empty"
alias gf="git fetch"
alias gwip="git commit -m \"WIP\""
alias gcm="git checkout main"
alias gcd="git checkout development"
alias gd="git diff"
alias gds="git diff --cached"
alias gdd="git branch -d"
alias gDD="git branch -D"
alias gl="git log -n 10"
alias glg="git log -n 50 --grep"
alias go="git checkout"
alias gpr="git pull --rebase"
alias grom="git fetch && git rebase origin/main"
alias gr="git rebase"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias grh="git reset --hard"
alias gs="git status"
alias gsa="git stash apply"
alias gsl="git stash list | HEAD"
alias gsu="gwip && git stash -u && guncommit" # git stash untracked
alias guncommit="git reset --soft HEAD^"
alias gunc="guncommit"
alias gcomp="gh pr create --web"
alias gpulls="hub browse -- pulls"
alias gmv="git branch -m"
alias gcurrent="git rev-parse --abbrev-ref HEAD"
alias gup='git branch --set-upstream-to=origin/$(gcurrent) $(gcurrent)'

# usage:
#   grho (reset to upstream of same branch)
#   grho my-branch (reset to origin/my-branch)
function grho() {
  local branch="${1:-$(gcurrent)}"
  git fetch origin && git reset --hard origin/$branch
}

# usage:
#   gmo (fetch and merge origin/main)
#   gmo my-branch (fetch and merge origin/my-branch)
function gmo() {
  local branch="${1:-main}"
  git fetch origin && git merge origin/$branch
}

# Usage, rebase last X commits of current branch onto other branch
# git rebase --onto main HEAD~3 current-branch (rebase last 3 commits on main)
# gronto main HEAD~3 (rebase last 3 commits onto main)
# gro main 3 (same as above)
# groonto main HEAD~3 (rebase last 3 commits onto origin/main)
# groo main 3 (same as above)
function gronto() { git fetch origin && git rebase --onto $1 $2 $(gcurrent) }
function groonto() { gronto origin/$1 $2 }
function gro() { gronto $1 HEAD~$2 $(gcurrent) }
function groo() { gro origin/$1 $2 }

# == GitHub ====================================================================
alias ghpr="gh pr view --web"
alias ghs="gh pr status"
alias ghco="gh pr checkout"

# == Heroku ====================================================================

alias hconf="heroku config --remote"
alias hc="heroku run rails c --remote"
alias hm="heroku run rake db:migrate --remote"
alias hl="heroku logs -t --remote"

# == Node ======================================================================

alias y="yarn"
alias ys="yarn start"
alias yys="yarn && yarn start"
alias ya="yarn add"
alias yad="yarn add --dev"
alias nunfuck="rm -rf node_modules && npm install"
alias yunfuck="rm -rf node_modules && yarn install"
alias yt="yarn test"
alias ytp="yarn test --testPathPattern"
alias ysf="yarn standard --fix"

# == React / React Native ======================================================

alias rn="react-native"
alias rni="react-native run-ios"
alias rna="react-native run-android"

# == Postgres ==================================================================

alias pglog="tail -f $HOMEBREW_ROOT/var/postgres/server.log"
alias pgstart="postgres -D $HOMEBREW_ROOT/var/postgres"

# run this if getting an error starting postgres after os x crash
alias pgdeletepid="rm $HOMEBREW_ROOT/var/postgres/postmaster.pid"

# To dump DB:
# pg_dump my_db > my_dump_db

# To restore from a dump, drop and recreate the DB, then:
# psql -d my_db -f my_dump_db

# == Rails =====================================================================

alias rc="rails c"
alias ms="make start"
alias routes="rails routes"
alias routesg="routes | grep"
alias rr="routes | grep"
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
