-- By adding to the which-key config and using our helper function you can add more which-key registered bindings
return {
  "folke/which-key.nvim",
  config = function(plugin, opts)
    require "plugins.configs.which-key"(plugin, opts) -- include the default astronvim config that calls the setup call
    -- Add bindings which show up as group name
    local wk = require "which-key"
    wk.register({
      ["<leader>a"] = {
        name = "ChatGPT",
        c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
        e = { "<cmd>ChatGPTEditWithInstruction<CR>", "ChatGPT Edit with instruction", mode = { "n", "v" } },
        g = { "<cmd>ChatGPTRun grammar_correction<CR>", "ChatGPT Grammar Correction", mode = { "n", "v" } },
        tz = { "<cmd>ChatGPTRun translate chiness<CR>", "ChatGPT Translate", mode = { "n", "v" } },
        te = { "<cmd>ChatGPTRun translate english<CR>", "ChatGPT Translate", mode = { "n", "v" } },
        k = { "<cmd>ChatGPTRun keywords<CR>", "ChatGPT Keywords", mode = { "n", "v" } },
        d = { "<cmd>ChatGPTRun docstring<CR>", "ChatGPT Docstring", mode = { "n", "v" } },
        a = { "<cmd>ChatGPTRun add_tests<CR>", "ChatGPT Add Tests", mode = { "n", "v" } },
        o = { "<cmd>ChatGPTRun optimize_code<CR>", "ChatGPT Optimize Code", mode = { "n", "v" } },
        s = { "<cmd>ChatGPTRun summarize<CR>", "ChatGPT Summarize", mode = { "n", "v" } },
        f = { "<cmd>ChatGPTRun fix_bugs<CR>", "ChatGPT Fix Bugs", mode = { "n", "v" } },
        x = { "<cmd>ChatGPTRun explain_code<CR>", "ChatGPT Explain Code", mode = { "n", "v" } },
        r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "ChatGPT Roxygen Edit", mode = { "n", "v" } },
        l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "ChatGPT Code Readability Analysis", mode = { "n", "v" } },
      },
    })
  end,
}

