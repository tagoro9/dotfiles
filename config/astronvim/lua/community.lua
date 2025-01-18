-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { "Mofiqul/dracula.nvim" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.typescript" }
  -- import/override with your plugins folder
}
