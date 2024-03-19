-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

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
    elseif fileTy == 'java' then
        -- 目前neotest-java 不能支持dap,采用jdtls默认的dap 执行test 
        wk.register({
            ['<leader>ltd'] = {
                require("jdtls.dap").test_nearest_method,"run test dap"
            },
            ['<leader>ltld'] = {
                require("jdtls.dap").test_nearest_method,"run test dap"
            },
        })
    elseif fileTy == "toml" then
        wk.register({
            ["g"]={
              Sf={':lua require("crates").show_features_popup()<cr>',"crates show_features_popup",mode={"n"}},
              Sd={':lua require("crates").show_dependencies_popup()<cr>',"crates show_dependencies_popup",mode={"n"}},
              Xh={':lua require("crates").open_homepage()<cr>',"crates open_homepage",mode={"n"}},
              Xr={':lua require("crates").open_repository()<cr>',"crates open_repository",mode={"n"}},
              Xd={':lua require("crates").open_documentation()<cr>',"crates open_documentation",mode={"n"}},
              Xc={':lua require("crates").open_crates_io()<cr>',"crates open_crates_io",mode={"n"}},
            }
        })
    elseif fileTy == 'sh' then

    end
end

-- 以下操作对目录下的 md 文件进行文本替换并直接写入源文件，查看 diff，然后撤销写入。
-- nvim -u NONE --headless\
--  +"
--   :args *.md
--   :args
--   :silent! argdo %s/a/.../ge | update"\
--  +"
--   :!git diff
--   :silent! argdo undo | update"\
--  +":qa"
--
-- telescope 中tab 选中结果,alt q 选择选择结果,ctrl q 全部结果,发送到quick fix
-- cdo vs ldo：全局操作 vs 局部（当前 buffer）操作
-- cdo vs cfdo：全部操作 vs 对每个文件只操作一次
-- silent! noautocmd cdo ... | update
function toggle_telescope()
    local harpoon = require("harpoon")
    local conf = require("telescope.config").values
    local harpoon_files=harpoon:list()
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end
    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
    }):find()
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

    ["<leader>gw"]={
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      desc="telescope-live-grep-args"
    },
    ["<leader>D"]={
      ":DBUIToggle<CR>",
      desc="open DBUI"
    },
    ["<leader>fd"]={
      ":Telescope todo-comments<CR>",
      desc="telescope todo-comments"
    },
    ["<leader>ap"]={function ()
        local harpoon = require("harpoon")
        harpoon:list():append()
    end,desc="harpoon2 add"
    },
    ["<leader>rp"]={function ()
        require("harpoon"):list():remove()
    end,desc="harpoon2 mark rm"
    },
    ["<leader>fp"]={function() toggle_telescope() end,desc="telescope harpoon2"},
    -- trouble
    ["<leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", noremap = true, silent = true },
    ["gDo"]={":DiffviewOpen ",desc="DiffViewOpen",noremap = true, silent = true },
    ["gDh"]={":DiffviewFileHistory ",desc="DiffviewFileHistory",noremap = true, silent = true },
    ["gDq"]={":DiffviewClose<CR>",desc="DiffviewFileHistory",noremap = true, silent = true },
    ["ga"]={
      "<Plug>(EasyAlign)",
      desc="EasyAlign"
    },
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
    ["ga"]={
      "<Plug>(EasyAlign)",
      desc="EasyAlign"
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
