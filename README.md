# NeoVim Installation
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

# NeoVim Configfiguration

Once NeoVim is opened, run Lazy

# Repository Folders
```
.
├── init.lua                -- Lua initialization configuration
└── lua
    ├── base                -- Base folder for initialization
    │   ├── init.lua        -- Main configurations
    │   └── plugins
    │       ├── init.lua    
    │       └── lazy.lua
    └── configs             -- Configuration files
        ├── formating.lua
        ├── gitsigns.lua
        ├── lazy.lua
        ├── lspconfig.lua
        ├── lualine.lua
        ├── mason.lua
        ├── neoscroll.lua
        ├── nvim-cmp.lua
        ├── nvimtree.lua
        └── telescope.lua
```
