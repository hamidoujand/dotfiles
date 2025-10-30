vim.cmd("let g:netrw_liststyle = 3")


local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one


-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- highlight cursorline
opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift


-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- options.lua
vim.opt.clipboard = "" -- This ensures Neovim doesn't use its default clipboard

-- WSL clipboard configuration
vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = [[powershell.exe -Command "Get-Clipboard" | sed 's/\r$//']],
        ['*'] = [[powershell.exe -Command "Get-Clipboard" | sed 's/\r$//']],
    },
    cache_enabled = 0,
}

-- Remove or don't add this line:
-- vim.opt.clipboard:append("unnamedplus")  -- DELETE THIS

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom
