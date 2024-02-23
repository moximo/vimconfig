return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.pack.rust" },
  {
    "simrat39/rust-tools.nvim",
    opts ={
      server = {
          settings = {
           ["rust-analyzer"] = {
              -- Add clippy lints for Rust.
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
            },
          },
      }
    }
  },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.java" },
  -- {
  --   "mfussenegger/nvim-jdtls",
  --   opts = function(_, opts)
  --     local root =require("jdtls.setup").find_root({ ".git"})
  --     if root==""  then
  --       require("astronvim.utils").notify("root_dir:pomx.ml",vim.log.INFO)
  --       root = require("jdtls.setup").find_root({ "mvnw", "gradlew", "build.gradle", ".project", ".pom.xml" })
  --     end
  --     local root_dir = root
  --     require("astronvim.utils").notify("root_dir:"..root_dir,vim.log.INFO)
  --     opts.root_dir=root_dir
  --     return opts
  --   end
  -- },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
}
