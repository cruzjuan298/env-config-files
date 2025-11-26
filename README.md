## My Personal Environment Configuration files

The config files are seperaed into two sections. The installation script handles all most of the work when trying to copy the files in the correct directory. 

## Neovim
The neovim folder is organized within a lua folder. Generally, this makes it much more easier for me to edit and add plugins. It possible to remove all the contents in this 
file and just have all files within the nvim directory but things start to get messy when you have dozen of different config files for different plugins.

## Neovim - Walkthroughh
The first portion of the plugin.lua file sets up lazy.nvim. In that table is where all of my plugins reside. From top to bottom they include:
- colorscheme
- treesitter
- portable package manager
- lsp's
- file explorers (newtr is set by default but oil.nvim is included for easy setup)
- harpoon
- flash
- lazygit
- supermaven

I decided to use mason for my packagae manager (for now). To install lsp's, run the ```:MasonInstall {lsp name}``` or the ```:Mason``` command to see the menu of avilable lsp's.
Lsp's will automatically be configured because of the function in the mason-lsp-config.nvim table. **NOTE** If you aren't able to find the appriopate lsp for your use case,
you can always write you own or find it in the collections of lsp config in nvim-lspconfig.

## Tmux
The tmux folder contains only the necessary tmux config file. Like mentioned before, the installation script handles installing tpm for the tmux plugins in the config file.

## Tmux - Walkthroughh
The first poritons of the file is focused on changing the default tmux key-bindings. Then, the colorscheme follows and lastly the plugins are included. The comments
provide specification as what exactly is in each section.
