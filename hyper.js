module.exports = {
  config: {
    fontSize: 14,
    fontFamily:
      'Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    cursorColor: "rgba(248,28,229,0.8)",
    cursorShape: "BLOCK",
    borderColor: "#333",
    padding: "12px 14px",
    shell: "/bin/zsh",
    shellArgs: ["--login"],
    env: {},
    bell: false,
    copyOnSelect: true,
    summon: {
      hotkey: "F12"
    }
  },
  plugins: [
    "hyperterm-summon",
    "hypercwd",
    "hyperlinks",
    "hyper-nord",
    "hyper-statusline",
    "hyper-search"
  ],
  localPlugins: []
};
