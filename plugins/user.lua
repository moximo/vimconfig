require("notify").setup({
    background_colour = "#000000",
})

return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
    --     Old text                    Command         New text
    -- --------------------------------------------------------------------------------
    --     surr*ound_words             ysiw)           (surround_words)
    --     *make strings               ys$"            "make strings"
    --     [delete ar*ound me!]        ds]             delete around me!
    --     remove <b>HTML t*ags</b>    dst             remove HTML tags
    --     'change quot*es'            cs'"            "change quotes"
    --     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    --     delete(functi*on calls)     dsf             function calls
  },
  {
    -- open url with `gx`
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    -- auto expan window with `alt+enter`
    "anuvyklack/windows.nvim",
    event = "VeryLazy",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = true
      require("windows").setup {
        autowidth = { --		       |windows.autowidth|
          enable = false,
        },
      }
    end,
  },
  {
    -- chatgpt suport
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup {
        keymaps = {
          submit = "<C-Enter>",
          yank_last_code = "<C-y>",
        },
        show_line_numbers=true,
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    -- undotree
    "mbbill/undotree",
    event = "VeryLazy",
  },
  {
    -- simple to find word, with `s`
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    ft='http',
    -- event = "VeryLazy",
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {
          ["$date"] = function()
            return os.date('%Y-%m-%d %H:%m:%S')
          end,
        },
        yank_dry_run = true,
      })
    end
  },
  {
    -- translation with `<leader>tr`
    "potamides/pantran.nvim",
    event = "VeryLazy",
    config= function()
      require("pantran").setup{
        -- Default engine to use for translation. To list valid engine names run
        -- `:lua =vim.tbl_keys(require("pantran.engines"))`.
        default_engine = "yandex",
        -- Configuration for individual engines goes here.
        engines = {
          yandex = {
            -- Default languages can be defined on a per engine basis. In this case
            -- `:lua require("pantran.async").jun(function()
            -- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
            -- can be used to list available language identifiers.
            default_source = "auto",
            default_target = "zh",
            fallback={
              default_source = "auto",
              default_target = "zh"
            }
          },
        },
      }
    end
  },
  {
    -- dependency "silicon" command,use with `<,'>:Silicon`
    "segeljakt/vim-silicon",
    event = "VeryLazy",
    config = function()
       vim.g.silicon={
        output="~/Pictures/Screenshots/silicon-{time:%Y-%m-%d-%H%M%S}.png"
      }
    end
  },
  {
    --wiht `:DBUI`
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' ,'sqlite'}, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location="~/.db_ui_sql"
      vim.g.db_ui_winwidth=30
      vim.g.db_ui_win_position='right'
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    'mattn/emmet-vim',
     event = "VeryLazy",
  },
  {
    --依赖vineflower.jar(https://github.com/Vineflower/vineflower)
    "alienman5k/jdecomp.nvim",
    event = "VeryLazy",
    opts = {
      decompiler = 'fernflower', -- cfr, procyon, fernflower
      provider = {
        cfr = {
          -- bin = 'cfr'
          jar = os.getenv('HOME') .. '/Software/cfr-0.152.jar'
        },
        procyon = {
          jar = os.getenv('HOME') .. '/Software/procyon-decompiler-0.6.0.jar'
        },
        fernflower = {
          jar = os.getenv('HOME') .. '/Software/vineflower-1.9.3.jar'
        }
      }
    }
  },
-- {
--   'mrcjkb/rustaceanvim',
--   version = '^4', -- Recommended
--   ft = { 'rust' },
-- },
{
  "m4xshen/smartcolumn.nvim",
  event = { "InsertEnter", "User AstroFile" },
  opts = {
    colorcolumn="120",
    disabled_filetypes = { "alpha", "neo-tree", "starter", "help", "text", "markdown" ,"mason","lazy" },
  },
},
{
    "nvim-neotest/neotest",
    ft = { "go", "rust", "python","java" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-python",
      "rcasia/neotest-java",
      "rouge8/neotest-rust",
      {
        "folke/neodev.nvim",
        opts = function(_, opts)
          opts.library = opts.library or {}
          if opts.library.plugins ~= true then
            opts.library.plugins = require("astronvim.utils").list_insert_unique(opts.library.plugins, "neotest")
          end
          opts.library.types = true
        end,
      },
    },
    opts = function()
      return {
        -- your neotest config here
        adapters = {
          require "neotest-go",
          require "neotest-rust",
          require "neotest-python",
          require "neotest-java",
        },
      }
    end,
    config = function(_, opts)
      -- get neotest namespace (api call creates or returns namespace)
      local neotest_ns = vim.api.nvim_create_namespace "neotest"
      vim.diagnostic.config({
        virtual_text = {
          format = function(diagnostic)
            local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup(opts)
    end,
  },
  {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config=function()
     -- require("telescope").load_extension('harpoon')
      end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
    config=function(plugins,opts)
      opts.layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
          }, {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "right",
        size = 35
      }, {
        elements = { {
            id = "repl",
            size = 0.2
          }, {
            id = "console",
            size = 0.63
          } },
        position = "bottom",
        size = 10
      } }
      require("dapui").setup(opts)
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy", config = function(_,opts)
      return opts
    end
    },
  }
