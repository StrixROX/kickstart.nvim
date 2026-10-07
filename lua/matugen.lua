 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#122b20',
    base01 = '#1e4835',
    base02 = '#1b4130',
    base03 = '#63736b',
    base04 = '#afb6b3',
    base05 = '#f2f3f2',
    base06 = '#f2f3f2',
    base07 = '#f2f3f2',
    base08 = '#fd4663',
    base09 = '#6694cc',
    base0A = '#5cb5d6',
    base0B = '#67e4ac',
    base0C = '#96bbe9',
    base0D = '#93ecc4',
    base0E = '#96d2e9',
    base0F = '#bee5f4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#f2f3f2',          bg = '#122b20' })
  hi('TelescopeBorder',         { fg = '#63736b',             bg = '#122b20' })
  hi('TelescopePromptNormal',   { fg = '#f2f3f2',          bg = '#122b20' })
  hi('TelescopePromptBorder',   { fg = '#63736b',             bg = '#122b20' })
  hi('TelescopePromptPrefix',   { fg = '#67e4ac',             bg = '#122b20' })
  hi('TelescopePromptCounter',  { fg = '#afb6b3',  bg = '#122b20' })
  hi('TelescopePromptTitle',    { fg = '#122b20',             bg = '#67e4ac' })
  hi('TelescopePreviewTitle',   { fg = '#122b20',             bg = '#5cb5d6' })
  hi('TelescopeResultsTitle',   { fg = '#122b20',             bg = '#6694cc' })
  hi('TelescopeSelection',      { fg = '#f2f3f2',          bg = '#1b4130' })
  hi('TelescopeSelectionCaret', { fg = '#67e4ac',             bg = '#1b4130' })
  hi('TelescopeMatching',       { fg = '#67e4ac',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#f2f3f2',          bg = '#122b20' })
  hi('MiniPickBorder',         { fg = '#63736b',             bg = '#122b20' })
  hi('MiniPickPrompt',   { fg = '#f2f3f2',          bg = '#122b20' })
  hi('MiniPickPromptPrefix',   { fg = '#67e4ac',             bg = '#122b20' })
  hi('MiniPickBorderText',    { fg = '#122b20',             bg = '#67e4ac' })
  hi('MiniPickMatchCurrent',      { fg = '#f2f3f2',          bg = '#1b4130' })
  hi('MiniPickPromptCaret', { fg = '#67e4ac',             bg = '#1b4130' })
  hi('MiniPickMatchRanges',       { fg = '#67e4ac',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
