# Delegate to ./gradlew so zsh completion can discover tasks
gradlew() {
  if [[ -x ./gradlew ]]; then
    ./gradlew "$@"
  else
    command gradlew "$@"
  fi
}

# cd into a git worktree whose path matches the given pattern
wt() {
  local dir
  dir=$(git worktree list --porcelain | grep '^worktree ' | sed 's/^worktree //' | grep -m 1 "$1")
  if [[ -n "$dir" ]]; then
    cd "$dir"
  else
    echo "No worktree matching '$1'" >&2
    return 1
  fi
}

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
