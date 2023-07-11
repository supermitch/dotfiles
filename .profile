# Add my uersonal bins
export PATH="$HOME/code/bin:$PATH"
# Add NPM
export PATH="$HOME/.npm/bin:$PATH"
# Homebrew? sbin?
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Apps
# export PATH="$HOME/Library/Haskell/bin:$PATH"
# export PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# Scala
# export SCALA_HOME="/usr/local/share/scala"
# export PATH="$SCALA_HOME/bin:$PATH"
# export PATH="/usr/local/activator-dist-1.3.5:$PATH"

export EDITOR=vim
export LESS=eFRX  # Super less mode

# Bash aliases
alias ls="ls -FG"
alias la="ls -aFG"
alias ll="ls -aFGhl"

# Nav aliases
alias ..="cd .."
alias ...="cd ../.."

# Git aliases
alias gaa="git add -A; git status"
alias gap="git add --patch"  # Interactively add hunks
alias grp="git restore --patch"  # Interactively restore hunks

alias gb="git branch -v --color"
alias gba="git branch -va --color"  # All
alias gbd="git branch -d "

alias gc="git commit "
alias gcan="git commit --amend --no-edit"
alias gco="git checkout "

alias gd="git diff "
alias gdc="git diff --cached"  # Diff staged files
alias gdn="git --no-pager diff "

alias gllg='git log --color --all --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit'
alias glog="git log --graph --decorate --all"

alias gmm='GIT_MERGE_AUTOEDIT=no git merge master'
alias gp='git push'
alias gpo='git push --set-upstream origin "$(git symbolic-ref --short HEAD)"'

alias gs="git status -b"  # Add -s for short form

alias gsl="git stash list"
alias gsp="git stash pop"
alias gst="git stash"

alias prune="git remote prune origin"

# Vim aliases
alias m="mvim "
alias v="vi "

# ctags build alias
# alias btags="ctags -R --exclude=@$HOME/.ctagsignore --links=no ."

# Simplified virtual env activator
alias svba="source venv/bin/activate"

# Silver Searcher aliases
alias ag="ag --color --context --smart-case --literal"
agq () { ag "$@" | less -SRi; }
agm () { ag "<<<<<<<" | less -SRi; } # Forgotten merge conflicts

# Create a folder and then move into it
mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

eval "$(rbenv init -)"
