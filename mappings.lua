-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
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
    ["gh"] = {"0" ,desc = "go head" },
    ["gl"] = {"$" ,desc = "go end" },
    ["<A-j>"]={":m .+1<CR>=="},
    ["<A-k>"]={":m .-2<CR>=="},
    ["<A-Enter>"]={":WindowsMaximize<CR>",desc="windowMaxSize"},
    ["<leader><leader>"]={":WindowsEqualize<CR>",desc="windowEqualize"},
    ["<leader>ud"]={":UndotreeToggle<CR>",desc="show undotree"},
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  v ={
    ["<A-k>"]= {":m '<-2<CR>gv=gv"},
    ["<A-j>"]= {":m '>+1<CR>gv=gv"},
    ["<leader>ge"]={
      function()
        local chatgpt=require("chatgpt")
        chatgpt.edit_with_instructions()
      end,
      desc="Edit with ChatGPT instructions"},
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
