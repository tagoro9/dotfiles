# git-commit

Commit all changes with a conventional commit message

## Instructions

Run `git commit -a -m "<message>"` where the message follows conventional commits format (e.g., 'feat:', 'fix:', 'chore:', etc.). The commit message MUST NOT mention Claude as a co-author. If pre-commit hooks fail on the first run, automatically retry the commit without asking the user. Handle pre-commit hook modifications by re-running the commit command once.
