-- Neovim config with treesitter + LSP

-- Ensure homebrew binaries are in PATH
vim.env.PATH = "/opt/homebrew/bin:" .. vim.env.PATH

-- ----- Basic settings (from your vimrc) -----
vim.opt.termguicolors = true
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.updatetime = 100
vim.opt.hlsearch = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Auto-reload files when changed externally
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})
vim.opt.wildignore:append { "*/tmp/*", "*.so", "*.swp", "*.zip", "*/build/*", "*/target/*" }

-- File navigation (gf)
vim.opt.suffixesadd:append { ".js", ".jsx", ".ts", ".tsx", ".json", ".vue", ".css", ".scss" }
vim.opt.path:append { "src/**" }
vim.opt.includeexpr = "substitute(v:fname,'^@','src','')"

-- Return to last edit position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- ----- Bootstrap lazy.nvim (plugin manager) -----
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ----- Plugins -----
require("lazy").setup({
  -- Treesitter (fast syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    init = function()
      -- Enable treesitter-based highlighting for supported filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact", "lua", "python", "ruby", "json", "yaml", "html", "css", "markdown", "bash" },
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },

  -- LSP (go to definition, autocomplete, etc.)
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- TypeScript
      lspconfig.ts_ls.setup({})
      -- Add more as needed:
      -- lspconfig.ruby_lsp.setup({})
      -- lspconfig.pyright.setup({})
    end,
  },

  -- Catppuccin theme (native neovim version)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        term_colors = true,
        integrations = {
          treesitter = true,
          native_lsp = { enabled = true },
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },

  -- FZF
  { "junegunn/fzf", build = ":call fzf#install()" },
  { "junegunn/fzf.vim" },

  -- NERDTree
  { "preservim/nerdtree" },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
})

-- ----- Keymaps -----
-- FZF
vim.keymap.set('n', '<C-p>', ':Files<CR>', { silent = true })
vim.keymap.set('n', '<C-g>', ':Rg<CR>', { silent = true })
vim.keymap.set('n', '<C-b>', ':Buffers<CR>', { silent = true })

-- NERDTree
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>', { silent = true })

-- LSP
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Find references' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover docs' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

-- ----- FZF/Ripgrep settings -----
vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" --glob "!*.lock" --glob "!coverage/*" --glob "!dist/*" --glob "!build/*"'
vim.g.fzf_layout = { down = '40%' }

-- Custom Rg command with exclusions
vim.cmd([[
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '
  \   . '--glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*" --glob "!*.lock" --glob "!coverage/*" '
  \   . shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview(),
  \   <bang>0)
]])

-- Italic comments
vim.cmd('highlight Comment cterm=italic gui=italic')
