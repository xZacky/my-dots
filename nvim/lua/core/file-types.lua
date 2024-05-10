vim.api.nvim_command("autocmd BufRead,BufNewFile *.h.inc,*.cpp.inc set filetype=cpp")
vim.api.nvim_command("autocmd BufRead,BufNewFile *.llir set filetype=llvm")
vim.api.nvim_command("autocmd BufRead,BufNewFile *.mlir,*.ttir,*.ttgir set filetype=mlir")
