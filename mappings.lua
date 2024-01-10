-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

-- function restHttp()
--   local wk = require("which-key")
--   wk.register({
--     ["<leader>r"] = {
--       name="run some command",
--       h={":Http<CR>","run rest http"}
--     },
--   })
-- end
--
--
vim.cmd('autocmd FileType * lua setKeybinds()')
function setKeybinds()
    local fileTy = vim.api.nvim_buf_get_option(0, "filetype")
    local opts = { prefix = '<localleader>', buffer = 0 }
    require "plugins.configs.which-key"(plugin, opts) 
    -- include the default astronvim config that calls the setup call
    -- Add bindings which show up as group name
    local wk = require "which-key"

    if fileTy == 'markdown' then
        wk.register({
            ['<leader>m'] = {
              name="markdown",
              p={":MarkdownPreview<CR>","markdown preview",mode={"n"}}
            },
        })
    elseif fileTy == 'sh' then
    end
end



return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>cd"] ={":silent  cd %:h<CR>",desc="cd %:h"},
    ["<A-j>"]={":m .+1<CR>=="},
    ["<A-k>"]={":m .-2<CR>=="},
    ["<A-Enter>"]={":WindowsMaximize<CR>",desc="windowMaxSize"},
    ["<leader><leader>"]={":WindowsEqualize<CR>",desc="windowEqualize"},
    ["<leader>ud"]={":UndotreeToggle<CR>",desc="show undotree"},
    ["<leader>tr"]={
      ":Pantran<CR>",
      desc="translate"},

    ["<leader>r"] = { name = "rest http client" },
    ["<leader>rh"]={
      "<Plug>RestNvim",
      desc="run rest http clent"
    },
    ["<leader>rc"]={
      "<Plug>RestNvimPreview",
      desc="show rest curl"
    },
    ["<leader>gw"]={
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc="telescope-live-grep-args"
    },
    ["<leader>td"]={
      ":Telescope todo-comments<CR>",
      desc="telescope todo-comments"
    },
    -- trouble
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", noremap = true, silent = true },
    

    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  v ={
     --  mapmode-v 仅在视觉和选择模式下激活
    ["<A-k>"]= {":m '<-2<CR>gv=gv"},
    ["<A-j>"]= {":m '>+1<CR>gv=gv"},
  },
  s={
     --  mapmode-x 仅在选择模式下激活
  },
  x={
     --  mapmode-x 仅在视觉模式下激活
    ["<leader>tr"]={
      ":Pantran<CR>",
      desc="translate"
    },
  },
  i={
    ["<A-j>"]={"<Esc>ja"},
    ["<A-k>"]={"<Esc>ka"},
    ["<A-h>"]={"<Esc>i"},
    ["<A-l>"]={"<Esc>la"},
  },
  c={
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
