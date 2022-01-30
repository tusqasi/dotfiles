return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Bling
    use "gruvbox-community/gruvbox"
    use "dracula/vim"
    use "kyazdani42/nvim-web-devicons"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "norcalli/nvim-colorizer.lua"

    -- utils
    use "vifm/vifm.vim"
    use "dag/vim-fish"
    use "mattn/emmet-vim"
    use "christoomey/vim-tmux-navigator"
    use "tpope/vim-surround"
    use {
        "lewis6991/gitsigns.nvim",
        requires = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            require("gitsigns").setup()
        end
    }
    use "nathom/filetype.nvim"
    use "prettier/vim-prettier"
    use {
        "stevearc/aerial.nvim",
        cmd = "AerialToggle",
        config = function()
            require("aerial").setup(
                {
                    filter_kind = false
                }
            )
        end
    }
    use "rhysd/committia.vim"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end
    }
    use "easymotion/vim-easymotion"
    use "wellle/targets.vim"
    use "tpope/vim-repeat"

    -- use 'tpope/vim-commentary'
    use "easymotion/vim-easymotion"
    use "wellle/targets.vim"
    use "tpope/vim-repeat"

    -- Lsp/treesitternvim.5+
    -- cmp
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-cmdline"

    -- lsp
    use "L3MON4D3/LuaSnip"
    use "mfussenegger/nvim-jdtls"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    -- treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "nvim-treesitter/playground"

    -- telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    -- Dart/Flutter
    --[[ use 'dart-lang/dart-vim-plugin'
	use 'thosakwe/vim-flutter'
	use 'natebosch/vim-lsc'
	use 'natebosch/vim-lsc-dart' ]]
  end
)
