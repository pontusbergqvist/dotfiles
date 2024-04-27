-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua
-- chadrc.lua

--- @type ChadrcConfig
local M = {}

M.ui = {
  -- nice themes = {
  -- monochrome
  -- }
  theme = "monochrome",
  telescope = {
    style = "bordered",
  },
  statusline = {
    -- theme = "minimal",
    -- separator_style = "default",
  },
  -- transparency = false,
}

return M
