local colorscheme = "aurora"

-- .. is string concatinate
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Lua
require('onedark').setup {
    style = 'cool'
}
require('onedark').load()

