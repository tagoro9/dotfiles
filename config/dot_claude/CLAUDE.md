# Git and VCS rules

- MUST use conventional commits for commit messages
- NEVER use git -C. Instead MUST run git commands directly in the project directory. If you are working with multiple git repos at the same time, then cd first and then run git commands.
- MUST Create atomical commits that are independent
- MUST Commit frequently, you can rebase code once things are ready and organize commits better
- The commit message body MUST NOT have superfluous content
- The commit title should not be longer than 100 characters.
- Write bodies that are concise but explain what is happening.
- When referencing issues on the commit footer, use this format: Fixes #ISSUE-123, #ISUE-234, ...

# Fotingo

- ALWAYS use fotingo for creating pull requests, starting to work on issues or talking to Jira unless specified otherwise.
- When using fotingo, always use the fotingo skill.

# Github

- Use fotingo as the preferred tool when I ask you to interact with Github. Fallback to the gh cli when something can't be done with fotingo. Things like opening a PR, creating PRs, ...

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
