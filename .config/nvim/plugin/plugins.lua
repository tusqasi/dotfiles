return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Bling
    use "itchyny/lightline.vim"
    use "gruvbox-community/gruvbox"
    use "dracula/vim"
    use "kyazdani42/nvim-web-devicons"
    use "norcalli/nvim-colorizer.lua"

    -- utils
    use "vifm/vifm.vim"
    use "itchyny/vim-gitbranch"
    use "dag/vim-fish"
    use "junegunn/fzf"
    use "junegunn/fzf.vim"
    use "mattn/emmet-vim"
    use "christoomey/vim-tmux-navigator"
    use "tpope/vim-surround"
    use "mhartington/formatter.nvim"

    -- use "tpope/vim-commentary"
    use "b3nj5m1n/kommentary"
    use "easymotion/vim-easymotion"
    use "wellle/targets.vim"
    use "tpope/vim-repeat"
    
    -- neovim 0.5+
    -- Lsp
    use "L3MON4D3/LuaSnip"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    -- use "mfussenegger/nvim-jdtls"

    -- treesitter
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-treesitter/nvim-treesitter-textobjects"

    -- telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    -- Dart/Flutter
    --[[ use "dart-lang/dart-vim-plugin"
	use "thosakwe/vim-flutter"
	use "natebosch/vim-lsc"
	use "natebosch/vim-lsc-dart" ]]
  end
)
