local status, mason = pcall(require, 'mason')
if (not status) then
  print("mason is not installed")
  return
end

local status2, lspconfig = pcall(require, 'mason-lspconfig')
if (not status2) then
  print("mason-lspconfig is not installed")
  return
end

mason.setup {}

lspconfig.setup {
  ensure_installed = {
    "cssls",
    "cssmodules_ls",
    "html",
    "jsonls",
    "lua-language-server",
    "tsserver",
    "pyright",
    "yamlls",
    "bashls",
    "csharp-language-server",
    "csharpier",
    "omnisharp",
    "rust_analyzer",
  }
}
