--options and keymaps need to load first
require 'core.options'
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        error('Error cloning lazy.nvim:\n' .. out)
    end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
    --file explorer
    require 'plugins.neotree',
    --theme
    require 'plugins.colortheme',
    ---bufferline
    require 'plugins.bufferline',
    -- status line
    require 'plugins.lualine',
    --treesitter
    require 'plugins.treesitter',
    --telescope
    require 'plugins.telescope',
    -- lsp
    require 'plugins.lsp',
    --auto complettion
    require 'plugins.autocompletion',
    --auto formatting
    require 'plugins.autoformatting',
    --gitsigns
    require 'plugins.gitsigns',
    --alpha
    require 'plugins.alpha',
    --indent blankline
    require 'plugins.indent-blankline',
    -- misc
    require 'plugins.misc',
})
