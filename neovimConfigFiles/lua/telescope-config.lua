
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local builtin = require('telescope.builtin')
local map = vim.keymap.set

require("telescope").setup {
  pickers = {
    find_files = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
            n = {
                ["kj"] = "close",
            },
        },
    },

    live_grep = {
        mappings = {
            i = {
            ["<C-s>"] = "select_horizontal",
            },
        },
    },
  },
}

-- key maps
local builtin = require('telescope.builtin')  
map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })  
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })  
map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })  
map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

