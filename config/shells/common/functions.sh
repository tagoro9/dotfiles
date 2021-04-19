# Find file under the current directory
ff () { /usr/bin/find . -name "$@" ; }
# Find file whose name starts with a given string
ffs () { /usr/bin/find . -name "$@"'*' ; }
# Find file whose name ends with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }

# Create a ZIP archive of a folder
zipf () { zip -r "$1".zip "$1" ; }

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

# Find the pid of a process the process can be a regex (findPid '/d$/')
findPid () { lsof -t -c "$@" ; }

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

# Add the fuck function
eval "$(thefuck --alias)"

