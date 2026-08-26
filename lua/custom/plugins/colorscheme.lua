return {
  {
    'RRethy/base16-nvim',
    priority = 1000,
    config = function()
      require('matugen').setup() -- this line finds lua/matugen.lua regardless of who wrote it
    end,
  },
}
