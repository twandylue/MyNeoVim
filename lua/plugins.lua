local status, lazy = pcall(require, "lazy")
if not status then
  print("lazy is not installed")
  return
end

local plugins = {
  -- gruber
  {
    "blazkowolf/gruber-darker.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruber-darker")
      vim.api.nvim_command("highlight Cursor guibg=red")
      -- vim.api.nvim_command("hi! LineNr guibg=#2e2d2d ctermbg=none")
    end,
    enabled = true,
  },

  -- colorscheme: gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.gruvbox")
    end,
    enabled = false,
  },

  -- colorscheme: gruvbox-baby
  "luisiacc/gruvbox-baby",

  -- colorscheme: catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.catppuccin")
    end,
    enabled = false,
  },

  -- colorscheme: tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.tokyonight")
      vim.api.nvim_command("colorscheme tokyonight")
    end,
    enabled = false,
  },

  -- colorscheme: github
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.github-theme")
    end,
    enabled = false,
  },

  -- colorscheme: kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.kanagawa")
    end,
    enabled = false,
  },

  -- colorscheme: nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("colorschemes.nightfox")
    end,
    enabled = false,
  },

  -- colorscheme: base16
  "RRethy/nvim-base16",

  "tpope/vim-vinegar",

  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugin-config.nvim-tree")
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    enabled = false,
  },

  {
    "stevearc/oil.nvim",
    config = function()
      require("plugin-config.nvim-oil")
    end,
  },

  -- nvim-telescope
  -- notice dependencies before installation (https://github.com/nvim-telescope/telescope.nvim#getting-started)
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.1",
    config = function()
      require("plugin-config.nvim-telescope")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- nvim-telescope extensions
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
  },
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugin-config.nvim-gitsigns")
    end,
  },

  {
    "TimUntersberger/neogit",
    config = function()
      require("plugin-config.nvim-neogit")
    end,
    dependencies = "nvim-lua/plenary.nvim",
    enabled = false,
  },

  -- git-fugitive
  "tpope/vim-fugitive",

  -- git-diffview
  { "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

  {
    "feline-nvim/feline.nvim",
    config = function()
      require("plugin-config.nvim-feline")
    end,
    enabled = false,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugin-config.nvim-lualine")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons", opt = lazy },
  },

  -- lualine-lsp-progress
  "arkav/lualine-lsp-progress",

  "easymotion/vim-easymotion",

  {
    "ggandor/leap.nvim",
    config = function()
      require("plugin-config.nvim-leap")
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugin-config.nvim-comment")
    end,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("plugin-config.nvim-todo-comments")
    end,
    dependencies = "nvim-lua/plenary.nvim",
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugin-config.nvim-autopairs")
    end,
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require("plugin-config.nvim-illuminate")
    end,
  },

  { "lukas-reineke/indent-blankline.nvim", enabled = false },

  {
    "kylechui/nvim-surround",
    config = function()
      require("plugin-config.nvim-surround")
    end,
  },

  -- exchange text object ( NOTE: `cxc` to cancel)
  "gbprod/substitute.nvim",

  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    config = function()
      require("plugin-config.nvim-bufferline")
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
    enabled = false,
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("plugin-config.nvim-colorizer")
    end,
  },

  "dstein64/nvim-scrollview",

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  "dhruvasagar/vim-table-mode",

  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugin-config.nvim-treesitter")
    end,
  },

  "nvim-treesitter/playground",

  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("plugin-config.nvim-treesitter-context")
    end,
  },

  -- vim-autotag(work with treesitter) TODO: set dependencies?
  "windwp/nvim-ts-autotag",

  "mg979/vim-visual-multi",

  "junegunn/vim-easy-align",

  {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require("plugin-config.nvim-dashboard")
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugin-config.nvim-zen-mode")
    end,
  },

  -- true-zen (like zen-mode and goyo-vim)
  {
    "Pocco81/true-zen.nvim",
    config = function()
      require("plugin-config.nvim-true-zen")
    end,
  },

  -- twilight (like limelight)
  {
    "folke/twilight.nvim",
    config = function()
      require("plugin-config.nvim-twilight")
    end,
  },

  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugin-config.nvim-notify")
    end,
  },

  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require("plugin-config.nvim-smooth-cursor")
    end,
  },

  {
    "chentoast/marks.nvim",
    config = function()
      require("plugin-config.nvim-marks")
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("plugin-config.nvim-toggleterm")
    end,
  },

  -- vscode-like pictograms
  "onsails/lspkind-nvim",

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      require("plugin-config.nvim-cmp")
    end,
  },

  -- Configurations for Nvim LSP
  "neovim/nvim-lspconfig",

  -- LSP UIs
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugin-config.nvim-lspsaga")
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "SmiteshP/nvim-navbuddy",
    config = function()
      require("plugin-config.nvim-navbuddy")
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("plugin-config.lsp.lsp-signature")
    end,
  },

  {
    "folke/trouble.nvim",
    config = function()
      require("plugin-config.nvim-trouble")
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  {
    "simrat39/inlay-hints.nvim",
    config = function()
      require("plugin-config.nvim-lsp-inlay-hints")
    end,
  },

  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("plugin-config.nvim-rust-tool")
    end,
  },

  "rust-lang/rust.vim",

  -- Debugging(TODO: studying...)
  "nvim-lua/plenary.nvim",

  "mfussenegger/nvim-dap",

  -- Mason lsp server installer and manager
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason.lspconfig.nvim",
    config = function()
      require("plugin-config.nvim-mason")
    end,
  },

  -- Mason null-ls installer and manager
  "jay-babu/mason-null-ls.nvim",

  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugin-config.nvim-luasnip")
    end,
  },

  -- File icons
  "nvim-tree/nvim-web-devicons",

  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("plugin-config.nvim-transparent")
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("plugin-config.nvim-outline")
    end,
    enabled = false,
  },

  "tommcdo/vim-exchange",

  {
    "nvim-neorg/neorg",
    config = function()
      require("plugin-config.nvim-neorg")
    end,
    -- important: export the CC(support for c++14, variable in general: export CC=/path/to/newer/compiler
    -- ref: https://github.com/nvim-neorg/neorg
    build = ":Neorg sync-parsers", -- This is the important bit!
    dependencies = { { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } },
  },

  {
    "b0o/incline.nvim",
    config = function()
      require("plugin-config.nvim-incline")
    end,
    enabled = false,
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("plugin-config.nvim-colorful-winsep")
    end,
    -- WARN: conflict with lspsaga(outline)
    enabled = false,
  },

  -- neodev for lua in neovim
  "folke/neodev.nvim",

  {
    "stevearc/aerial.nvim",
    config = function()
      require("plugin-config.nvim-aerial")
    end,
    enabled = false,
  },

  -- sqls command, coorperate with nvim_lsp.sqls in lspconfig
  "nanotee/sqls.nvim",

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugin-config.nvim-null-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("plugin-config.nvim-chatGPT")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    enabled = function()
      return jit.os == "OSX"
    end,
  },

  -- fzf in lua
  {
    "ibhagwan/fzf-lua",
    config = function()
      require("plugin-config.nvim-fzf-lua")
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- rest.nvim(http client)
  {
    "rest-nvim/rest.nvim",
    config = function()
      require("plugin-config.nvim-rest")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- vim sugar
  "tpope/vim-eunuch",
  "tpope/vim-unimpaired",

  -- copilot
  {
    "github/copilot.vim",
    config = function()
      require("plugin-config.nvim-copilot")
    end,
  },
}

return plugins
