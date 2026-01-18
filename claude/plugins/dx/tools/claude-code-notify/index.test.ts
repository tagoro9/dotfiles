import { beforeEach, expect, mock, test } from "bun:test";

const spawnSyncMock = mock(() => ({ status: 0 }));

mock.module("child_process", () => ({
  spawnSync: spawnSyncMock,
}));

const { ClaudeNotifier } = await import("./index");

beforeEach(() => {
  spawnSyncMock.mockClear();
});

test("sends a stop notification with project name and execute action", () => {
  const data = {
    session_id: "test-session",
    hook_event_name: "Stop",
    cwd: "/Users/test/project",
  };

  const notifier = new ClaudeNotifier("Stop", data);
  notifier.notify();

  expect(spawnSyncMock).toHaveBeenCalledTimes(1);
  expect(spawnSyncMock.mock.calls[0]).toMatchInlineSnapshot(`
    [
      "terminal-notifier",
      [
        "-sound",
        "default",
        "-title",
        "project - Task Complete",
        "-subtitle",
        "Claude has finished working",
        "-message",
        "January 18, 2026 at 22:14",
        "-execute",
        "/usr/local/bin/code "/Users/test/project"",
      ],
      {
        "stdio": "ignore",
      },
    ]
  `);
});

test("sends a notification with waiting for input messaging", () => {
  const data = {
    session_id: "test-session",
    hook_event_name: "Notification",
    message: "waiting for your input",
    cwd: "/Users/test/project",
  };

  const notifier = new ClaudeNotifier("Notification", data);
  notifier.notify();

  expect(spawnSyncMock).toHaveBeenCalledTimes(1);
  expect(spawnSyncMock.mock.calls[0]).toMatchInlineSnapshot(`
    [
      "terminal-notifier",
      [
        "-sound",
        "default",
        "-title",
        "project - Waiting for Input",
        "-subtitle",
        "Claude needs your response to continue",
        "-message",
        "January 18, 2026 at 22:14",
        "-execute",
        "/usr/local/bin/code "/Users/test/project"",
      ],
      {
        "stdio": "ignore",
      },
    ]
  `);
});

test("rejects invalid event types", () => {
  expect(
    () => new ClaudeNotifier("Unknown", { hook_event_name: "Unknown" }),
  ).toThrow("Invalid hook type");
});
