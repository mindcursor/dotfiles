-- General configuration.

-- Tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=0")
vim.cmd("set shiftwidth=4 smarttab")

vim.opt.list = false

-- Borders
vim.o.winborder = "rounded"

-- Line numbers & gutter
vim.opt.number = true
vim.cmd("set relativenumber")
vim.opt.numberwidth = 4 -- Custom gutter width

-- HTML autocomplete
vim.lsp.enable("html")

-- Cursor style
vim.opt.guicursor = "n-v-c-i:block"

-- Add end of line indicator
vim.opt.colorcolumn = "100"

-- Avoid swapfiles
vim.opt.swapfile = false

-- Turn on diagnostics
vim.diagnostic.config({ virtual_text = true })

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Navigate vim/tmux panes better
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

-- Navigate by visual lines instead.
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Toggle neovim terminal's normal mode
vim.keymap.set("t", "<leader><esc>", "<C-\\><C-n>", { desc = "Terminal to Normal mode." })

-- Toggle zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- Golang snippets
vim.keymap.set("n", "<leader>le", "oif err != nil {<CR>log.Fatal(err)<CR>}<ESC>")
vim.keymap.set("n", "<leader>tp", '"adiwi\tfmt.Printf("[DEBUG] VAL = %+v\\n", <ESC>"apa)<ESC>?VAL<CR>diw"apa <ESC>F]')
vim.keymap.set("v", "<leader>tp", '"adi\tfmt.Printf("[DEBUG] VAL = %+v\\n", <ESC>"apa)<ESC>?VAL<CR>diw"apa <ESC>F]')

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Stolen from kickstart.nvim:
--
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "   ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 15

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {
	desc = "Open diagnostic [Q]uickfix list",
})
