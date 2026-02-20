-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- for example
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
--
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- added by BOD
keymap("i", "kj", "<ESC>", opts)

-- Easy colon, shift not needed
keymap("n", ";", ":", opts)
keymap("v", ";", ":", opts)
keymap("n", ":", ";", opts)
keymap("v", ":", ";", opts)

-- Record Macros with 'Q'. Use 'q' for quitting rapidly.
keymap("n", "Q", "<Nop>", opts)
keymap("n", "Q", "q`]", opts)
keymap("n", "q", "<Nop>", opts)
keymap("n", "q", "<C-w>q", opts)
-- keymap("n", "q", ":call SmartQuit()<CR>", opts)
--keymap('n', 'q', 'Q`]', opts)

-- save file
keymap({ "i", "x", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save File" })

-- " Use ctrl-[hjkl] to select the active split!
--set splitbelow splitright
keymap({ "i", "x", "n" }, "<C-u>", "<C-W>k", opts)
keymap({ "i", "x", "n" }, "<C-n>", "<C-W>j", opts)
keymap({ "i", "x", "n" }, "<C-h>", "<C-W>h", opts)
keymap({ "i", "x", "n" }, "<C-l>", "<C-W>l", opts)
keymap({ "i", "x", "n" }, "<leader>h", "<C-W>h", opts)
keymap({ "i", "x", "n" }, "<leader>l", "<C-W>l", opts)

-- Markdown Preview keybindings
-- keymap("n", "tm", "<cmd>MarkdownPreview<CR>", opts)
-- keymap("n", "tg", "<Plug>MarkdownPreviewToggle", opts)

-- autoscroll plugin
-- keymap("n", "ts", "<cmd>ScrollDown<CR>", opts)
-- keymap("n", "tu", "<cmd>ScrollUp<CR>", opts)
-- keymap("n", "te", "<cmd>StopScrolling<CR>", opts)

-- Navigating word wrap
-- keymap("n", "j", "gj", opts)
-- keymap("n", "k", "gk", opts)

-- here be errors
-- keymap("n", "<F5>", "=strftime("\%c")<CR>P", opts)
-- keymap("i", "<F5>", "<C-R>=strftime("\%c")<CR>", opts)

-- other keymappings
-- @s @s @s @s <F7><F7><F7><F7>
vim.cmd([[
" paste on cursor
" nnoremap gP i<CR><Esc>PkJxJx
" nnoremap gp a<CR><Esc>PkJxJx
" delete without yanking
"nnoremap <leader>d "_d
"vnoremap <leader>d "_d
nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>
" Save with sudo
cmap W!! w !sudo tee % >/dev/null
" Start an external command with a single she-bang
nnoremap ! :!
" Move to beginning or end of line
nnoremap B ^
nnoremap E $
" so x doesn't clobber paste buffer"
nnoremap x "_x
" Change next match in a repeatable manner
" nnoremap cn *``cgn
" nnoremap cN *``cgN
" vnoremap <expr> cn "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgn"
" vnoremap <expr> cN "y/\\V\<C-r>=escape(@\", '/')\<CR>\<CR>" . "``cgN"
"nnoremap <leader>a =ip    " Indent a paragraph
" Center highlighted search
"nnoremap n nzz
"nnoremap N Nzz
" Move to end of yanked text after yank
vnoremap y y`]
" Move to end of text after paste
nnoremap p p`]
vnoremap p p`]
" Replace current work with last yanked selection
"nnoremap <Leader>. viw"0p
" nnoremap cp yap<S-}>p
" Quick substitute within a selected area
"xnoremap s :s//g<Left><Left>
" Select last paste. Except interferes with vimdiff!!
"nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'
" paste line(s) at the bottom of the file
" nnoremap tb :mark '<cr>:$put<cr>`'
let g:AutoScrollSpeed = 800
" Vimwiki 
function! OpenNoteWiki()
  call vimwiki#base#goto_index(2)
"  execute ':Calendar'
endfunction
nnoremap t2 :call OpenNoteWiki()<cr>
function! OpenThisWiki()
  call vimwiki#base#goto_index(3)
endfunction
nnoremap 3 :call OpenThisWiki()<cr>
function! OpenTechWiki()
  call vimwiki#base#goto_index(4)
endfunction
nnoremap 4 :call OpenTechWiki()<cr>

let g:vimwiki_list = [{
          \ 'path': '~/scripts/vimwiki',
          \ 'template_path': '~/scripts/vimwiki/templates/',
          \ 'template_default': 'default',
          \ 'syntax': 'markdown', 
          \ 'ext': '.md',
          \ 'path_html': '~/scripts/vimwiki/site_html/',
          \ 'custom_wiki2html': 'vimwiki_markdown',
          \ 'template_ext': '.tpl'
          \ },
          \ {
              \ 'path': '~/scripts/vimwiki/notewiki',
              \ 'template_path': '~/scripts/vimwiki/templates/',
              \ 'template_default': 'default',
              \ 'syntax': 'markdown',
              \ 'ext': '.md',
              \ 'path_html': '~/scripts/vimwiki/notewiki/site_html/',
              \ 'custom_wiki2html': 'vimwiki_markdown',
              \ 'template_ext': '.tpl'},
              \ {'path': '~/scripts/vimwiki/thiswiki'},
              \ {'path': '~/scripts/vimwiki/techwiki'}
              \]
]])

-- Clear match highlights
-- keymap("n", "<esc>", ":noh<cr>", opts)

-- Reselect visual after indent
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Search selected text
-- Consistent `*` behaviour
-- keymap("n", "*", [[*N]], opts)
-- keymap("v", "*", [[y/\V<c-r>=escape(@",'/\')<cr><cr>N]], opts)

-- Navigating buffers
-- s is used for substitution, maplocalleader to t instead
-- keymap("n", "tj", ":bprevious<CR>", opts)
-- keymap("n", "tk", ":bnext<CR>", opts)
-- keymap("n", "to", ":<C-u>tabnew<CR>", opts)
-- keymap("n", "tn", ":<C-u>tabnew<CR>", opts)
-- " Toggle between last 2 buffers
-- keymap("n", "tt", "<C-^>", opts)

-- keymap("n", "tq", ":call CloseBuffer()<CR>", opts)
-- keymap("n", "tx", ":<C-u>call BufferEmpty()<CR>", opts)

-- keymap("n", "ms", "<cmd>MarkdownPreview<CR>", opts)

-- Y yank until the end of line
-- keymap("n", "Y", "y$", opts)
-- keymap("n", "Y", "y$", opts)
-- Move to end of text after yank or paste
-- keymap('v', 'p', 'p`]', opts)
