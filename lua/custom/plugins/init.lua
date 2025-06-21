return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        window = {
          position = 'left',
          width = 30,
          --[[ mappings = {
            ['<space>'] = 'toggle_node',
            ['<cr>'] = 'open',
            ['S'] = 'open_split',
            ['s'] = 'open_vsplit',
            ['t'] = 'open_tabnew',
            ['C'] = 'close_node',
            ['z'] = 'close_all_nodes',
            ['R'] = 'refresh',
            ['a'] = { 'add', config = { show_path = 'relative' } },
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['c'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
          }, ]]
        },
        filesystem = {
          follow_current_file = { enabled = true },
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
          },
        },
      }
    end,
    opts = {
      -- fill any relevant options here
    },
    keys = {
      { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'NeoTree Toggle' },
      { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'NeoTree Focus' },
    },
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    keys = {
      { 'gc', mode = { 'n', 'v' }, desc = 'Toggle comment' },
      { 'gcc', mode = 'n', desc = 'Toggle line comment' },
      { 'gb', mode = { 'n', 'v' }, desc = 'Toggle block comment' },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = { theme = 'gruvbox' },
  },
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<C-\>]],
        direction = 'horizontal', -- 或 "float", "vertical"
        start_in_insert = true,
        size = 20,
      }

      -- Terminal 模式下的窗口切换
      local opts = { noremap = true, silent = true }

      vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>h]], opts)
      vim.keymap.set('t', '<C-j>', [[<C-\><C-n><C-w>j]], opts)
      vim.keymap.set('t', '<C-k>', [[<C-\><C-n><C-w>k]], opts)
      vim.keymap.set('t', '<C-l>', [[<C-\><C-n><C-w>l]], opts)

      -- TermOpen 自动进入插入模式（可选）
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = 'term://*',
        command = 'startinsert',
      })
    end,
    keys = {
      { '<C-\\>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
    },
  },
}
