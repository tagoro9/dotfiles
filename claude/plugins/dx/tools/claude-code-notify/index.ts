#!/usr/bin/env bun

/**
 * Claude Code Notify
 * Sends rich macOS notifications for Claude Code events
 */

import { spawnSync } from "child_process";

interface EventData {
  session_id: string;
  hook_event_name: string;
  cwd?: string;
  prompt?: string;
  message?: string;
}

const validEvents = ["UserPromptSubmit", "Stop", "Notification"];
type EventName = (typeof validEvents)[number];

class ClaudeNotifier {
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
      // Silently fail if terminal-notifier is not available
    }
  }

  handleUserPromptSubmit(data: EventData): void {
    const projectName = this.getProjectName(data.cwd);
    const prompt = data.prompt || "New task";
    const truncatedPrompt =
      prompt.length > 100 ? prompt.slice(0, 97) + "..." : prompt;

    this.sendNotification(
      `${projectName} - Task Started`,
      `Starting: ${truncatedPrompt}`,
      this.formatTime(),
      data.cwd,
    );
  }

  handleStop(data: EventData): void {
    const projectName = this.getProjectName(data.cwd);

    this.sendNotification(
      `${projectName} - Task Complete`,
      "Claude has finished working",
      this.formatTime(),
      data.cwd,
    );
  }

  handleNotification(data: EventData): void {
    const projectName = this.getProjectName(data.cwd);
    const message = data.message || "";
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
      data.cwd,
    );
  }
}

function validateInputData(
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
    if (!(field in data) || data[field] === null || data[field] === undefined) {
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

function validateEventName(
  eventName: string | undefined,
): eventName is EventName {
  return eventName != undefined && validEvents.includes(eventName);
}

async function main() {
  try {
    if (process.argv.length < 3) {
      console.log("ok");
      return;
    }
    const eventName = process.argv[2];
    if (!validateEventName(eventName)) {
      console.error(`Invalid hook type: ${eventName}`);
      process.exit(1);
    }

    const inputData = await Bun.stdin.text();
    if (!inputData.trim()) {
      console.error("No input data received");
      return;
    }

    const data = JSON.parse(inputData);
    validateInputData(data, eventName);

    const notifier = new ClaudeNotifier();

    if (eventName === "UserPromptSubmit") {
      notifier.handleUserPromptSubmit(data);
    } else if (eventName === "Stop") {
      notifier.handleStop(data);
    } else if (eventName === "Notification") {
      notifier.handleNotification(data);
    }
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

main();
