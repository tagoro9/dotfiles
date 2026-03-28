-- git.yazi: show git status indicators in file list
require("git"):setup { order = 1500 }

-- relative-motions.yazi: vim-style relative jumps (3j, 5k, etc.)
require("relative-motions"):setup { show_numbers = "relative", show_motion = true }


-- mactag.yazi: macOS native file tags
require("mactag"):setup {
  keys = {
    r = "Red",
    o = "Orange",
    y = "Yellow",
    g = "Green",
    b = "Blue",
    p = "Purple",
  },
  colors = {
    Red = "#F38BA8",
    Orange = "#FAB387",
    Yellow = "#F9E2AF",
    Green = "#A6E3A1",
    Blue = "#89B4FA",
    Purple = "#CBA6F7",
  },
  order = 500,
}
