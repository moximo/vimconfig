return {
   -- You can also add new plugins here as well:
   -- Add plugins, the lazy syntax
   -- "andweeb/presence.nvim",
   -- {
   --   "ray-x/lsp_signature.nvim",
   --   event = "BufRead",
   --   config = function()
   --     require("lsp_signature").setup()
   --   end,
   -- },
   {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
     require("chatgpt").setup({
       keymaps = {
        submit = "<C-Enter>",
        yank_last_code = "<C-y>",
      },
     })
    end,
    dependencies = {
     "MunifTanjim/nui.nvim",
     "nvim-lua/plenary.nvim",
     "nvim-telescope/telescope.nvim"
    }
   },
   {
    "anuvyklack/windows.nvim",
    event = "VeryLazy",
    dependencies = {
     "anuvyklack/middleclass",
     "anuvyklack/animation.nvim"
    },
    config = function()
     vim.o.winwidth = 10
     vim.o.winminwidth = 10
     vim.o.equalalways = true
     require('windows').setup({
      autowidth = {			--		       |windows.autowidth|
       enable = false,
      }
     })
    end,
}
 }
