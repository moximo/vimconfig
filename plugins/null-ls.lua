return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- config.on_attach= function(client, bufnr)
    --     if client.name == "null-ls" then
    --         local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
    --         if fileTy == "java" then
    --           -- .clang-formate:
    --           -- Language: Java
    --           -- BasedOnStyle: Google
    --           -- BreakBeforeBraces: Custom
    --           -- BraceWrapping: Always
    --           -- ColumnLimit: 120 
    --           require("astronvim.utils").notify("停止clang-format 格式化java",vim.log.INFO)
    --           client.server_capabilities.documentFormattingProvider = false -- 0.8 and later
    --         end
    --     end
    --     -- rest of the initialization
    -- end
    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      -- null_ls.builtins.formatting.stylua,
      -- null_ls.builtins.formatting.prettier,
    }
    return config -- return final config table
  end,
}
