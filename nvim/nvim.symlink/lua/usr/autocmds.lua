-- Create some helpers
local agrp = vim.api.nvim_create_augroup
local acmd = vim.api.nvim_create_autocmd

acmd({ "FileType" },
      { pattern = "php",
        command = "setlocal commentstring=//%s"
      })
