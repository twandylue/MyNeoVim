local status, telescope = pcall(require, "telescope")
if not status then
  print("telescope is not installed")
  return
end

telescope.load_extension("file_browser")
local fb_actions = require("telescope").extensions.file_browser.actions
if vim.fn.has("mac") == 1 then
  telescope.load_extension("fzf")
end
telescope.load_extension("project")
telescope.load_extension("notify")
telescope.load_extension("live_grep_args")

local actions = require("telescope.actions")
local icons = require("plugin-config.icons")
-- local trouble = require "trouble.providers.telescope"
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup({
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = {
      ".git/",
      "target/",
      -- "docs/",
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "node_modules/*",
      -- "%.jpg",
      -- "%.jpeg",
      -- "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.webp",
      ".dart_tool/",
      -- ".github/",
      ".gradle/",
      ".idea/",
      ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      -- "env/",
      "gradle/",
      "node_modules/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
      "%.burp",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.epub",
      "%.flac",
      "%.tar.gz",
    },
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<c-d>"] = require("telescope.actions").delete_buffer,

        -- ["<C-u>"] = actions.preview_scrolling_up,
        -- ["<C-d>"] = actions.preview_scrolling_down,

        -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<Tab>"] = actions.close,
        ["<S-Tab>"] = actions.close,
        -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-h>"] = actions.which_key, -- keys from pressing <C-h>
        -- ["<esc>"] = actions.close,
      },
      n = {
        -- ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
        -- ["<C-t>"] = trouble.smart_open_with_trouble,
        ["<C-b>"] = actions.results_scrolling_up,
        ["<C-f>"] = actions.results_scrolling_down,

        -- ["<Tab>"] = actions.close,
        -- ["<S-Tab>"] = actions.close,
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,
        ["q"] = actions.close,
        ["dd"] = require("telescope.actions").delete_buffer,
        ["s"] = actions.select_horizontal,
        ["v"] = actions.select_vertical,
        ["t"] = actions.select_tab,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
    live_grep = {
      theme = "dropdown",
    },
    grep_string = {
      theme = "dropdown",
    },
    find_files = {
      previewe = true,
      theme = "ivy",
    },
    git_files = {
      previewe = true,
      theme = "ivy",
    },
    buffers = {
      theme = "cursor",
      previewer = false,
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    colorscheme = {
      enable_preview = true,
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          -- cheatsheet: https://cheatography.com/njones/cheat-sheets/ripgrep/
          ["<C-q>"] = lga_actions.quote_prompt(),
          -- ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }), -- global but case-i­nse­nsitive
        },
      },
    },
    file_browser = {
      theme = "dropdown",
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function()
            vim.cmd("normal vbd")
          end,
        },
        ["n"] = {
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    },
    project = {
      -- base_dirs = {},
      -- hidden_files = false, -- default: false
      -- theme = "dropdown",
      -- order_by = "asc"
    },
  },
})
