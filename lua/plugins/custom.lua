return {
  -- add telescope
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did not have a release in a long time
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add oil
  {
    "stevearc/oil.nvim",
    opts = {
      default_file_explorer = true,
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- add cellular-automaton
  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },

  -- add harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
  },

  -- disable ghost text in blink.cmp
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
      },
    },
  },

  -- disable ghost text in nvim-cmp (if it's being used)
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.experimental = opts.experimental or {}
      opts.experimental.ghost_text = false
    end,
  },
}
