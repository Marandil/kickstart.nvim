-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- nvim-tree strongly suggests disabling netrw to prevent conflicts.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

return {
  -- Additional configuration of netrw file explorer.
  -- { 'prichrd/netrw.nvim', opts = {} },

  -- Alternative to netrw
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local function on_attach(bufnr)
        local api = require 'nvim-tree.api'

        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts 'Open tree')
      end

      require('nvim-tree').setup {
        filters = {
          custom = { '^.git$' },
        },
        on_attach = on_attach,
      }
    end,
  },
}
