return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
{
    "jellydn/quick-code-runner.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      debug = true,
    },
    cmd = { "QuickCodeRunner", "QuickCodePad" },
    keys = {
      {
        "<leader>cr",
        ":QuickCodeRunner<CR>",
        desc = "Quick Code Runner",
        mode = "v",
      },
      {
        "<leader>cp",
        ":QuickCodePad<CR>",
        desc = "Quick Code Pad",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
      require("gitsigns").toggle_signs()
    end,
  },
{ "nvim-neotest/nvim-nio" },
{'Pocco81/auto-save.nvim',
    keys = {
      {
        "<leader>as",
        ":ASToggle<CR>",
      }
    },
    config = function ()
      require("auto-save").setup({
        enabled = true
      })
    end
 },

{
  "CRAG666/betterTerm.nvim",
  opts = {
    position = "bot",
    size = 15,
  },
},
{"CRAG666/code_runner.nvim",
  dependencies = {"CRAG666/betterTerm.nvim"},
  keys = {
      {
        "<leader>r",
        ":RunCode<CR>",
      },
      {
        "<leader>rf",
        ":RunFile<CR>",
      },
    },
  config = function ()
    require('code_runner').setup({
  filetype = {
    java = {
      "cd $dir &&",
      "javac $fileName &&",
      "java $fileNameWithoutExt"
    },
    python = "python3 -u",
    typescript = "deno run",
    rust = {
      "cd $dir &&",
      "rustc $fileName &&",
      "$dir/$fileNameWithoutExt"
    },
    c = function(...)
      local c_base = {
        "cd $dir &&",
        "gcc $fileName -o",
        "/tmp/$fileNameWithoutExt",
      }
      local c_exec = {
        "&& /tmp/$fileNameWithoutExt &&",
        "rm /tmp/$fileNameWithoutExt",
      }
      vim.ui.input({ prompt = "Add more args:" }, function(input)
        c_base[4] = input
        vim.print(vim.tbl_extend("force", c_base, c_exec))
        require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
      end)
    end,
  },
})
  end

},
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  },
},
  {
    "smoka7/hop.nvim",
    opts = {
      multi_windows = true,
      keys = "etovxqpdygfblzhckisuran",
      uppercase_labels = true,
    },
    keys = {
      {
        "<leader>fj",
        function()
          require("hop").hint_words()
        end,
        mode = {"n", "x", "o"}
      }
    }
  },
 {
  'mfussenegger/nvim-dap',
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python"
  },
  keys = {
    {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        mode = {"n", "v"}
    },
    {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        mode = {"n", "v"}
    },
    {
        "<leader>dpr",
        function()
          require("dap-python").test_method()
        end,
        mode = {"n", "v"}
    }
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_python = require("dap-python")
    dap_python.setup("python")
    dap_python.test_runner = 'pytest'
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = {'-m', 'debugpy.adapter'}
      }
    dap.configurations.python = {
      {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
          return '/usr/bin/python'
        end;
      },
    }
   end,
}
-- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
