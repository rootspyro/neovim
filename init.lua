vim.loader.enable()

require("config.options").setup()
require("config.lazy")
require("config.keymaps").setup()
require("config.autocmds").setup()
