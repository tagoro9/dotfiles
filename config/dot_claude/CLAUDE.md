# Git and VCS rules

- MUST use conventional commits for commit messages
- MUST Create atomical commits that are independent
- MUST Commit frequently, you can rebase code once things are ready and organize commits better
- The commit message body MUST NOT have superfluous content
- The commit message MUST NOT reference any ai tool used or co authors of commits
- Use conventional commits convention when writing commit messages.
- The commit title should not be longer than 100 characters.
- Write bodies that are concise but explain what is happening.

# Working on Issues rules

- If I ask you to create a ticket, you have to gather 4 things if I don't provide them. The project, the task type, title and the description. The description is optional. The task type can be Task, Story or Bug. If I don't provide one, default to Task.Then you use the fotingo command to start working on the ticket: fotingo start -p <project_in_capital_letters> -k <type> -d <description> -t title.
- If I ask you to start working on a ticket and I pass a ticket id of the shape \w+-\s+ (e.g TICKET-123) or a Jira URL (e.g https://myjira.atlassian.net/browse/TICKET-123). Use the fotingo command to start working on an issue. You would call it with the issue ID: fotingo start TICKET-123
- If I ask you to review or create a pull request for something, use the fotingo command to generate pull requests. You can use the --help option to learn how it works. Use options to never open an editor to enter pull request description. But most of the time the command will be `fotingo review -y`. You can add reviewers with the -r option (one -r per reviewer name) if I ask you to tag someone on it. You don't need to git push before running this command.
- If I ask you to open the issue for the current branch, use the fotin-go open issue command

# Github

- If I ask you to open the pull request for the current branch, use the fotin-go open pr command
- If I ask you to open the remote repo for the current repo, use the fotin-go open repo command

# Linters

- Most of repositories use pre-commit, so if you want to validate if changes are working / valid. Just run pre-commit run -a in the repository
- NEVER modify or edit a lint config file if you are facing an error. Don't disable rules or tweak how the script is run.

# Dependencies

- ALWAYS pin dependencies to a specific version.

# When you need to call tools from the shell, use this rubric:

- Find Files: `fd`
- Find Text: `rg` (ripgrep)
- Find Code Structure (TS/TSX): `ast-grep`
  - Default to TypeScript:
    - `.ts` → `ast-grep --lang ts -p '<pattern>'`
    - `.tsx` (React) → `ast-grep --lang tsx -p '<pattern>'`
  - For other languages, set `--lang` appropriately (e.g., `--lang rust`).
- Select among matches: pipe to `fzf`
- JSON: `jq`
- YAML/XML: `yq`

# Languages

- I use `mise` to manage my languages. If a specific language tool is not available, you can run `mise up`. If that doesn't install the language, make sure there is a language version file in the folder (e.g `.node-version`, `.terraform-version`, ...).

## Typescript

- Don't use any.
