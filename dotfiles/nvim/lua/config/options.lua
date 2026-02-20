-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
local options = {
  backup = false, -- creates a backup file
  -- clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  -- cmdheight = 1,                           -- space under the statusline for displaying messages
  -- completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  -- conceallevel = 0,                        -- so that `` is visible in markdown files
  -- fileencoding = "utf-8",                  -- the encoding written to a file
  -- hlsearch = true,                         -- highlight all matches on previous search pattern
  -- ignorecase = true,                       -- ignore case in search patterns
  -- pumheight = 15,                          -- pop up menu height
  -- showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  -- showtabline = 2,                         -- always show tabs
  -- smartcase = true,                        -- smart case
  -- smartindent = true,                      -- make indenting smarter again
  -- splitbelow = true,                       -- force horizontal splits below current window
  -- splitright = true,                       -- force vertical splits to the right of current window
  swapfile = false, -- creates a swapfile
  -- termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- timeoutlen = 400,                        -- time for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  -- updatetime = 300,                        -- faster completion (4000ms default)
  -- writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- expandtab = true,                        -- convert tabs to spaces
  -- shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  -- tabstop = 2,                             -- insert 2 spaces for a tab
  -- cursorline = false,                       -- highlight the current line
  -- number = true,                           -- set numbered lines
  -- relativenumber = false,                  -- set relative numbered lines
  -- numberwidth = 4,                         -- set number column width to 2 {default 4}
  -- signcolumn = "yes",                      -- always show the sign column. If not. it shifts the text each time
  wrap = true, -- wrap long lines
  linebreak = true, -- break lines, not words
  whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
  -- sidescrolloff = 8,
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
-- vim.opt.shortmess = "ilmnrx"                        -- flags to shorten vim messages, see :help 'shortmess'
vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches and movements
vim.opt.shortmess:append("c") -- don't give |ins-completion-menu| messages
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
vim.filetype.add({ --to get better highlighting for .conf files
  extension = {
    conf = "dosini",
  },
})
