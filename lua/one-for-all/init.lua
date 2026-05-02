local M = {}

M.palette = require("one-for-all.palette")

local function set_terminal(p)
  vim.g.terminal_color_0  = p.eerie_black
  vim.g.terminal_color_1  = p.auburn
  vim.g.terminal_color_2  = p.dartmouth_green
  vim.g.terminal_color_3  = p.ecru
  vim.g.terminal_color_4  = p.marian_blue
  vim.g.terminal_color_5  = p.amaranth
  vim.g.terminal_color_6  = p.light_sea_green
  vim.g.terminal_color_7  = p.seasalt
  vim.g.terminal_color_8  = p.gray
  vim.g.terminal_color_9  = p.amaranth
  vim.g.terminal_color_10 = p.light_sea_green
  vim.g.terminal_color_11 = p.eggshell
  vim.g.terminal_color_12 = p.marian_blue
  vim.g.terminal_color_13 = p.amaranth
  vim.g.terminal_color_14 = p.light_sea_green
  vim.g.terminal_color_15 = p.eggshell
end

function M.load(opts)
  opts = opts or {}

  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "one-for-all"

  local palette = vim.tbl_extend("force", M.palette, opts.palette or {})
  local groups = require("one-for-all.groups").get(palette)

  if opts.overrides then
    if type(opts.overrides) == "function" then
      groups = vim.tbl_extend("force", groups, opts.overrides(palette) or {})
    else
      groups = vim.tbl_extend("force", groups, opts.overrides)
    end
  end

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  set_terminal(palette)
end

function M.setup(opts)
  M._opts = opts or {}
end

return M
