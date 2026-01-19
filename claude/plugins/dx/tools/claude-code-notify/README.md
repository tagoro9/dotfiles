# claude-code-notify

macOS notification helper invoked by Claude Code hook events. It reads the hook
payload JSON from stdin and uses `terminal-notifier` to send rich notifications.

## How it is wired

The DX plugin registers hook commands in
`claude/plugins/dx/hooks/hooks.json`, which invoke this tool via
`${CLAUDE_PLUGIN_ROOT}/tools/claude-code-notify/index.ts <EventName>`.

## Requirements

- macOS with `terminal-notifier` available in PATH
- Bun runtime (this tool is a Bun script)
- VS Code at `/usr/local/bin/code` for the click action (optional)

## Manual usage

```bash
cat <<'JSON' | bun run index.ts Stop
{
  "session_id": "demo-session",
  "hook_event_name": "Stop",
  "cwd": "/Users/example/project"
}
JSON
```

```bash
cat <<'JSON' | bun run index.ts Notification
{
  "session_id": "demo-session",
  "hook_event_name": "Notification",
  "message": "waiting for your input",
  "cwd": "/Users/example/project"
}
JSON
```

## Testing

```bash
bun test
```

## References

- Claude Code hooks: https://code.claude.com/docs/en/hooks
- Claude Code plugins: https://code.claude.com/docs/en/plugins
