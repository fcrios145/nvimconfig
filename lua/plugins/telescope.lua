return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})


        --maps for lsp angular/typescript
        vim.keymap.set("n", "<leader>h", function()
            vim.lsp.buf.hover()
        end)


        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format()
        end)

        vim.keymap.set("n", "<leader>fr", function()
            builtin.lsp_references()
        end)

        vim.keymap.set("n", "<leader>au", function()
            vim.lsp.buf.code_action()
        end)

        vim.keymap.set("n", "<leader>p", function()
            OrganizeImports()
        end)

        vim.keymap.set("n", "<leader>an", function()
            require('lspconfig').angularls.setup {
                filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' }
            }
        end)

    end
}
