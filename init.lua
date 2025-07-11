vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require('platformio').setup({
    lsp = "clangd" --default: ccls, other option: clangd
                 -- If you pick clangd, it also creates compile_commands.json
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

-- require('code-runner').setup({
--   -- in setup function
--   filetype = {
--     java = { "cd $dir &&", "javac $fileName &&", "java $fileNameWithoutExt" },
--     python = "python3 -u",
--     typescript = "deno run",
--     rust = { "cd $dir &&",
--       "rustc $fileName &&",
--       "$dir/$fileNameWithoutExt"
--     },
-- }})
--
vim.o.autowriteall = true
vim.api.nvim_create_autocmd({ 'InsertLeavePre', 'TextChanged', 'TextChangedP' }, {
    pattern = '*', callback = function()
        vim.cmd('silent! write')
    end
})
require('livepreview.config').set()

vim.schedule(function()
  require "mappings"
end)
