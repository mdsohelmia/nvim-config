-- basic settings and options
require 'options'
-- load all the plugins
require 'plugins'
-- set up language servers
require("ls")
-- set up treesitter
require("treesitter-settings")

-- configure plugins
require("cmp-settings")
require("luaLine-settings")
require("formatter-settings")
require("telescope-settings")
require("whichkey-settings")
require("lspkind-settings")
require "nvim-tree-settings"
require 'theme-settings'
require "auto-save-settings";
require("matchtag-settings")
require("colorizer-settings")
require("bufferline-settings")
require("spectre-settings")
require("autopairs-settings")
require("Comment-settings")
require("presence-settings")
require("dashboard-settings")
require("undo-tree-settings")
require("gitsigns-settings")
require("hover-settings")
require("nvim-comment-settings")
require("indent-blankline-settings")
require("zen-mode-settings")


-- keymappings
require("keymappings")
