return {
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
},
{
 'mbbill/undotree',
 event = "VeryLazy",
 config = function()
 end,
},
{
 "kylechui/nvim-surround",
 version = "*", -- Use for stability; omit to use `main` branch for the latest features
 event = "VeryLazy",
 config = function()
  require("nvim-surround").setup({
   -- Configuration here, or leave empty to use defaults
  })
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
}
