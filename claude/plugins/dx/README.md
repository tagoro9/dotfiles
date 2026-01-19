# Claude Code Plugin: DX

Developer Experience (DX) utilities and automation hooks for [Claude Code](https://code.claude.com/).

## Features

### Lifecycle Hooks

The plugin registers several hooks to automate tasks during your Claude Code session:

- **UserPromptSubmit**: Triggered when a prompt is submitted.
- **Stop**: Triggered when a session ends or is interrupted.
- **Notification**: Triggered when Claude Code sends a notification.

### Tools

- **[claude-code-notify](./tools/claude-code-notify)**: A Bun-based tool that sends rich macOS notifications for Claude Code events using `terminal-notifier`.

## References

- [Claude Code Hooks Documentation](https://code.claude.com/docs/en/hooks)
- [Claude Code Plugins Documentation](https://code.claude.com/docs/en/plugins)
