local configs = {
  'c',
  'css',
  'go',
  'gomod',
  'gotmpl',
  'html',
  'html_tags',
  'javascript',
  'lua',
  'markdown',
  'markdown-inline',
  'python',
  'query',
  'regex',
  'rust',
  'svelte',
  'typescript',
  'vim',
  'vimdoc',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install(configs)

      vim.api.nvim_create_autocmd('FileType', {
        desc = 'Enable treesitter highlight',
        pattern = configs,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
