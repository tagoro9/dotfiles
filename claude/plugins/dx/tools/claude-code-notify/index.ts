#!/usr/bin/env bun

/**
 * Claude Code Notify
 * Sends rich macOS notifications for Claude Code hook events.
 *
 * This tool is invoked by Claude Code hooks with the event name passed
 * as argv[2] and the hook payload JSON provided on stdin.
 *
 * Usage:
 *   bun index.ts <EventName> < input.json
 *
 * Supported events:
 *   - Stop: requires session_id, hook_event_name (cwd optional)
 *   - Notification: requires session_id, hook_event_name, message (cwd optional)
 *
 * Requirements:
 *   - terminal-notifier must be in PATH
 *   - /usr/local/bin/code is used for the notification action when cwd is set
 */

import { spawnSync } from "child_process";

interface EventData {
  session_id: string;
  hook_event_name: string;
  cwd?: string;
  prompt?: string;
  message?: string;
}

const validEvents = ["Stop", "Notification"];
type EventName = (typeof validEvents)[number];

export class ClaudeNotifier {
  private readonly eventName: EventName;
  private readonly data: EventData;

  constructor(eventName: string | undefined, data: unknown) {
    if (!this.isValidEventName(eventName)) {
      throw new Error(`Invalid hook type: ${eventName}`);
    }

    this.validateInputData(data, eventName);

    this.eventName = eventName;
    this.data = data;
  }

  notify(): void {
    if (this.eventName === "Stop") {
      this.handleStop();
    } else if (this.eventName === "Notification") {
      this.handleNotification();
    }
  }

  private getProjectName(cwd?: string): string {
    if (!cwd) return "Claude Code";
    return cwd.split("/").filter(Boolean).pop() || "Claude Code";
  }

  private formatTime(): string {
    const now = new Date();
    return now.toLocaleString("en-US", {
      month: "long",
      day: "numeric",
      year: "numeric",
      hour: "2-digit",
      minute: "2-digit",
      hour12: false,
    });
  }

  private sendNotification(
    title: string,
    subtitle: string,
    message?: string,
    cwd?: string,
  ): void {
    try {
      const args = [
        "-sound",
        "default",
        "-title",
        title,
        "-subtitle",
        subtitle,
      ];

      if (message) {
        args.push("-message", message);
      }

      if (cwd) {
        args.push("-execute", `/usr/local/bin/code "${cwd}"`);
      }

      spawnSync("terminal-notifier", args, {
        stdio: "ignore",
      });
    } catch (err) {
      console.error(err);
      process.exit(1);
    }
  }

  private handleStop(): void {
    const projectName = this.getProjectName(this.data.cwd);

    this.sendNotification(
      `${projectName} - Task Complete`,
      "Claude has finished working",
      this.formatTime(),
      this.data.cwd,
    );
  }

  private handleNotification(): void {
    const projectName = this.getProjectName(this.data.cwd);
    const message = this.data.message || "";
    const messageLower = message.toLowerCase();

    let subtitle: string;
    let notificationMessage: string;

    if (
      messageLower.includes("waiting for your input") ||
      messageLower.includes("waiting for input")
    ) {
      subtitle = "Waiting for Input";
      notificationMessage = "Claude needs your response to continue";
    } else if (messageLower.includes("permission")) {
      subtitle = "Permission Required";
      notificationMessage = message;
    } else if (
      messageLower.includes("approval") ||
      messageLower.includes("choose an option")
    ) {
      subtitle = "Action Required";
      notificationMessage = message;
    } else if (
      messageLower.includes("error") ||
      messageLower.includes("failed")
    ) {
      subtitle = "Error Occurred";
      notificationMessage = message;
    } else {
      subtitle = "Notification";
      notificationMessage = message;
    }

    this.sendNotification(
      `${projectName} - ${subtitle}`,
      notificationMessage,
      this.formatTime(),
      this.data.cwd,
    );
  }
  private validateInputData(
    data: any,
    expectedEventName: EventName,
  ): asserts data is EventData {
    const requiredFields: Record<EventName, string[]> = {
      UserPromptSubmit: ["session_id", "hook_event_name"],
      Stop: ["session_id", "hook_event_name"],
      Notification: ["session_id", "hook_event_name", "message"],
    };

    if (!(expectedEventName in requiredFields)) {
      throw new Error(`Unknown event type: ${expectedEventName}`);
    }

    if (data.hook_event_name !== expectedEventName) {
      throw new Error(
        `Event name mismatch: expected ${expectedEventName}, got ${data.hook_event_name}`,
      );
    }

    const missingFields: string[] = [];
    for (const field of requiredFields[expectedEventName] || []) {
      if (
        !(field in data) ||
        data[field] === null ||
        data[field] === undefined
      ) {
        missingFields.push(field);
      }
    }

    if (missingFields.length > 0) {
      throw new Error(
        `Missing required fields for ${expectedEventName}: ${missingFields.join(
          ", ",
        )}`,
      );
    }
  }

  private isValidEventName(
    eventName: string | undefined,
  ): eventName is EventName {
    return eventName != undefined && validEvents.includes(eventName);
  }
}

export async function main() {
  try {
    if (process.argv.length < 3) {
      console.log("ok");
      return;
    }
    const eventName = process.argv[2];

    const inputData = await Bun.stdin.text();
    if (!inputData.trim()) {
      console.error("No input data received");
      return;
    }

    const data = JSON.parse(inputData);

    const notifier = new ClaudeNotifier(eventName, data);
    notifier.notify();
  } catch (err) {
    if (err instanceof SyntaxError) {
      console.error(`JSON decode error: ${err.message}`);
      process.exit(1);
    } else if (err instanceof Error) {
      console.error(`Error: ${err.message}`);
      process.exit(1);
    } else {
      console.error(`Unexpected error: ${err}`);
      process.exit(1);
    }
  }
}

if (import.meta.main) {
  main();
}
