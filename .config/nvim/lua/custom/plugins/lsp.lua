return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'hrsh7th/cmp-nvim-lsp' },
    { "lukas-reineke/lsp-format.nvim" },
    { 'folke/neodev.nvim' },
  },
  cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lspconfig = require('lspconfig')
    -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = function(client, bufnr)
      require("lsp-format").on_attach(client, bufnr)
      -- ... custom code ...
      if client.name == 'ruff_lsp' then
        -- Disable hover in favor of Pyright
        client.server_capabilities.hoverProvider = false
      end
    end

    require('neodev').setup()
    -- Lua
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    }

    -- ruff-ls
    lspconfig.ruff_lsp.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      cmd = { 'ruff-lsp' },
      filetypes = { 'python' },
      root_dir = require('lspconfig').util.find_git_ancestor,
      init_options = {
        settings = {
          args = { "--select", "ALL" }
        }
      }
    }

    -- pyright
    lspconfig.pyright.setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        },
      },
    }
    -- matlab_ls
    local matlab_ls_path = os.getenv("MATLAB_LANGUAGE_SERVER_PATH")
    local matlab_root = os.getenv("MATLAB_ROOT")
    lspconfig.matlab_ls.setup {
      cmd = { matlab_ls_path .. "matlab-language-server.cmd", "--stdio" },
      capabilities = capabilities,
      -- on_attach = on_attach,
      settings = {
        matlab = {
          indexWorkspace = false,
          installPath = matlab_root,
          matlabConnectionTiming = "onStart",
          telemetry = false,
        },
      },
      single_file_support = true,
      root_dir = require('lspconfig').util.find_git_ancestor,
    }

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
      end,
    })
  end,
}
