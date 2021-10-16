# Alias Hub to get a better Github integration
eval "$(hub alias -s)"

# Alias vim to our default editor
alias vim='${EDITOR:-vim}'
alias vi='${EDITOR:-vim}'

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

#Clear terminal
alias c='clear'

# Better path output
alias path='echo -e ${PATH//:/\\n}'

alias show_options='shopt'

# Open any file in quicklook preview
ql () { qlmanage -p "$*" >& /dev/null; }

# Yarn aliases

alias y='yarn'
alias yt='yarn test'
alias ys='yarn start'

# Terraform aliases
alias ti='terraform init'
alias tp='terraform plan'

# Search

# Search for a file
alias qfind="find . -name "

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

# Misc

alias pwmetrics='CHROME_PATH="/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary" pwmetrics'

# Alias for ant with debugging enabled
alias dant='ANT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 -Xms768m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=256m" ant'

alias weather='curl wttr.in\?1F'

alias op-login='eval $(op signin my.1password.com)'

# Load any local shell aliases

if [ -f ~/.local_shell_aliases ]; then
    source ~/.local_shell_aliases
fi
