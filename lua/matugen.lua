 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#291614',
    base01 = '#452521',
    base02 = '#3e211e',
    base03 = '#716361',
    base04 = '#b6afaf',
    base05 = '#f3f2f2',
    base06 = '#f3f2f2',
    base07 = '#f3f2f2',
    base08 = '#b12d1e',
    base09 = '#d3e151',
    base0A = '#e1a851',
    base0B = '#e57366',
    base0C = '#e3ec92',
    base0D = '#ec9b92',
    base0E = '#ecc992',
    base0F = '#430f09',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f3f2f2',          bg = '#291614' })
  hi('TelescopeBorder',         { fg = '#716361',             bg = '#291614' })
  hi('TelescopePromptNormal',   { fg = '#f3f2f2',          bg = '#291614' })
  hi('TelescopePromptBorder',   { fg = '#716361',             bg = '#291614' })
  hi('TelescopePromptPrefix',   { fg = '#e57366',             bg = '#291614' })
  hi('TelescopePromptCounter',  { fg = '#b6afaf',  bg = '#291614' })
  hi('TelescopePromptTitle',    { fg = '#291614',             bg = '#e57366' })
  hi('TelescopePreviewTitle',   { fg = '#291614',             bg = '#e1a851' })
  hi('TelescopeResultsTitle',   { fg = '#291614',             bg = '#d3e151' })
  hi('TelescopeSelection',      { fg = '#f3f2f2',          bg = '#3e211e' })
  hi('TelescopeSelectionCaret', { fg = '#e57366',             bg = '#3e211e' })
  hi('TelescopeMatching',       { fg = '#e57366',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
