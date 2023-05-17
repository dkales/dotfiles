local M = {}

-- Your custom mappings
M.abc = {
  x = {
    ["<leader>p"] = { '"_dP', "paste without copying" },
  },
  n = {
    ["<leader>y"] = { '"+y', "yank into system clipboard" },
    ["<leader>Y"] = { '"+Y', "yank into system clipboard" },
    ["<leader>d"] = { '"_d', "delete into void" },
    ["<C-d>"] = { "<C-d>zz", "move down, but center screen" },
    ["<C-u>"] = { "<C-u>zz", "move down, but center screen" },
  },
  v = {
    ["<leader>y"] = { '"+y', "yank into system clipboard" },
    ["<leader>d"] = { '"_d', "delete into void" },
  },
}

return M
