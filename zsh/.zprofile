#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

if [ -f ~/.secrets ]; then
    source ~/.secrets
else
    print "Skipping: ~/.secrets not found"
fi

export TLDR_DEBUG=1
export SSH_MASTER_KEY=/home/dacali/.ssh/master.pem

# Stack
alias si='stack ghci --test'

# Simple HTTP Server
alias webserve='python -m SimpleHTTPServer 2000'

# xdg-open
alias xopen='xdg-open'
alias xopenl='xdg-open "$(ls -1t | head -1)"'

# ping Google DNS
alias ti='ping 8.8.8.8'

# hibernate
alias hibernate='systemctl hibernate'

# tmux
alias tmux-clean='tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t'

#
# 1pass
#
export ONEPASSWORD_KEYCHAIN='/home/dacali/Dropbox/1Password/Main.agilekeychain'


#
# xsel
#
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias shortdate='date "+%Y-%m-%d"'
# Copy YYYY-mm-dd into the clipboard
# 'tr' is used to remove the trailing newline
alias copydate='date "+%Y-%m-%d" | tr -d "\\n" | xclip -selection clipboard -in'

#
# Vagrant
#
export VAGRANT_DEFAULT_PROVIDER='lxc'

#
# JDK (Java)
#
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

alias ec='emacsclient --no-wait --create-frame --alternate-editor=""'
alias eccli='emacsclient --tty --alternate-editor=""'
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
export TERMINAL='terminator'

# Git

alias gitcd='cd $(git rev-parse --show-toplevel)'
alias gitcb='git rev-parse --abbrev-ref HEAD'

# The Unarchiver
alias unar='unar -d'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  bin
  ENV/bin
  /usr/local/{bin,sbin}
  /opt/p4merge/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="$(mktemp -d)"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

export PATH="$HOME/.cargo/bin:$PATH"
