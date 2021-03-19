# Alias for ant with debugging enabled
alias dant='ANT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 -Xms768m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=256m" ant'

# Alias Hub to get a better Github integration
eval "$(hub alias -s)"

# Some better aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='ls -GFh'
alias ll='ls -FGlAhp'
alias less='less -FSRXc'

# Full recursive directory listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# Navigation aliases
alias cd..='cd ../'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias ..='cd ../'
alias ...='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../../'

# Open current directory in finder
alias f='open -a Finder ./'

# Go home
alias ~="cd ~"

#Clear terminal
alias c='clear'

# Better path output
alias path='echo -e ${PATH//:/\\n}'

alias show_options='shopt'

# Open any fime in quicklook preview
ql () { qlmanage -p "$*" >& /dev/null; }

# Yarn aliases

alias y='yarn'
alias yt='yarn test'
alias ys='yarn start'

# File and folder management

# Create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" ; }
# Count of non-hidden files in current dir
alias numFiles='echo $(ls -1 | wc -l)'
# Creates a file of 1mb size (all zeros)
alias make1mb='mkfile 1m ./1MB.dat'
# Creates a file of 5mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'
# Creates a file of 10mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'

# Extract most archives with the same command
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Search

# Search for a file
alias qfind="find . -name "
# Find file under the current directory
ff () { /usr/bin/find . -name "$@" ; }
# Find file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }
# Find file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }

# Process management

# Find the pid of a process the process can be a regex (findPid '/d$/')
findPid () { lsof -t -c "$@" ; }

# Networking

# Get tublic facing IP Address
alias myip='curl checkip.amazonaws.com'
# Show all open TCP/IP sockets
alias netCons='lsof -i'
# Flush out the DNS Cache
alias flushDNS='dscacheutil -flushcache'
# Display open sockets
alias lsock='sudo /usr/sbin/lsof -i -P'
# Display only open UDP sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'
# Display only open TCP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'
# Get info on connections for en0
alias ipInfo0='ipconfig getpacket en0'
# Get info on connections for en1
alias ipInfo1='ipconfig getpacket en1'
# All listening connections
alias openPorts='sudo lsof -i | grep LISTEN'
# All ipfw rules inc/ blocked IPs
alias showBlocked='sudo ipfw list'
# Display useful host related information
ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo -e "\n${RED}Public facing IP Address :$NC " ;myip
  #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
  echo
}

if [ -f ~/.local_shell_aliases ]; then
    source ~/.local_shell_aliases
fi

alias pwmetrics='CHROME_PATH="/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary" pwmetrics'

alias weather='curl wttr.in\?1F'
