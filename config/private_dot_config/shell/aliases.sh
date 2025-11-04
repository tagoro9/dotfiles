# Some better aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias less='less -FSRXc'

# Use nvim
alias vim='nvim'
alias vi='nvim'

# Use bat for cat
alias cat='bat'

# Use eza for ls
alias ls='eza --icons -F -H --group-directories-first --git -1'
alias l='ls -lh --group-directories-first --color=auto --git --icons --no-permissions --no-user'
alias ll='ls -lahF --group-directories-first --color=auto --git --icons'
# Full recursive directory listing
alias lr='eza -T'

# Use zoxide for cd
alias cd='z'

# Navigation aliases
alias cdr='cd $(git rev-parse --show-toplevel)'

# Better path output
alias path='echo -e ${PATH//:/\\n}'
# Yarn aliases

alias yi='yarn'
alias yl='yarn lint'
alias yt='yarn test'
alias ys='yarn start'

# Terraform aliases
alias ti='terraform init'
alias tp='terraform plan'

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

# Fotingo aliases
alias f='fotingo'
alias fb='fotin-go open branch'
alias fr='fotin-go open repo'
alias fpr='fotin-go open pr'
alias fis='fotin-go open issue'

# Misc

alias pwmetrics='CHROME_PATH="/Applications/Google Chrome Canary.app/Contents/MacOS/Google Chrome Canary" pwmetrics'

# Alias for ant with debugging enabled
alias dant='ANT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005 -Xms768m -Xmx1024m -XX:PermSize=256m -XX:MaxPermSize=256m" ant'
alias weather='curl wttr.in\?1F'

# Load any local shell aliases

if [ -f "$HOME/.local_shell_aliases" ]; then
    source "$HOME/.local_shell_aliases"
fi
