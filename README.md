# Neovim Configuration

## Introduction

This is a personalized Neovim configuration built upon `kickstart.nvim`, providing a robust and efficient development environment. It focuses on modern Neovim features, including a responsive LSP setup, integrated debugging, and a clean user interface.

## Core Neovim Settings

* **Leader Key:** `<Space>` is set as the global leader key.
* **Line Numbers:** Displays both absolute (`number = true`) and relative (`relativenumber = true`) line numbers.
* **Mouse Support:** Full mouse support enabled (`mouse = 'a'`).
* **Clipboard:** System clipboard integration (`clipboard = 'unnamedplus'`).
* **Undo History:** Persistent undo history across sessions (`undofile = true`).
* **Search Behavior:** Case-insensitive search by default, but becomes case-sensitive if an uppercase letter is used (`ignorecase = true`, `smartcase = true`).
* **Sign Column:** Always displays the sign column (`signcolumn = 'yes'`).
* **Update Time:** Decreased update time for responsiveness (`updatetime = 250`).
* **Split Windows:** New vertical splits open on the right, new horizontal splits open below (`splitright = true`, `splitbelow = true`).
* **Invisible Characters:** Shows tabs as `»`, trailing spaces as `·`, and non-breaking spaces as `␣` (`list = true`).
* **Live Substitution Preview:** Shows live preview of substitutions during `:s` commands (`inccommand = 'split'`).
* **Current Line Highlight:** Highlights the current cursor line (`cursorline = true`).
* **Scroll Offset:** Keeps 10 lines of context above and below the cursor when scrolling (`scrolloff = 10`).
* **Confirm on Exit:** Prompts to save changes when exiting with unsaved modifications (`confirm = true`).
* **Tabs & Indentation:**
  * `tabstop = 4`
  * `shiftwidth = 4`
  * `expandtab = true` (tabs are converted to spaces)
  * `smartindent = true`
* **Colors:** Enables 24-bit true colors (`termguicolors = true`).
* **Nerd Font:** `vim.g.have_nerd_font` is set to `true`, indicating usage of a Nerd Font.

## Plugin Manager

* **[lazy.nvim](https://github.com/folke/lazy.nvim):** A fast and feature-rich plugin manager for Neovim.

## Installed Plugins & Configuration

### User Interface & Experience

* **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim):** Configured with the `tokyonight-night` colorscheme. It disables italics for comments.
* **[nvim-mini/mini.nvim](https://github.com/nvim-mini/mini.nvim):** A collection of various small independent plugins.
  * `mini.ai`: Provides "Around/Inside" text objects for more intuitive selections.
  * `mini.surround`: For adding, deleting, and replacing surroundings like brackets and quotes.
  * `mini.statusline`: A simple and customizable statusline, configured to use Nerd Font icons and display cursor location as `LINE:COLUMN`.
* **[nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim):** A file system browser. Mapped to `` for revealing the file tree.
* **[folke/which-key.nvim](https://github.com/folke/which-key.nvim):** Shows available keybindings based on context, with a `delay = 0` for instant display.
* **[lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim):** Adds indentation guides even on blank lines.
* **[folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim):** Highlights TODO, FIXME, etc. comments in the code. Signs are disabled (`signs = false`).
* **[NMAC427/guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim):** Automatically guesses buffer indentation.

### Editing & Navigation

* **[nvim-autopairs](https://github.com/windwp/nvim-autopairs):** Automatically inserts or deletes paired delimiters.
* **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter):** Provides syntax highlighting, indentation, and navigation based on tree-sitter parsers. Automatically installs and enables parsers for common languages like `bash`, `c`, `diff`, `html`, `lua`, `luadoc`, `markdown`, `markdown_inline`, `query`, `vim`, `vimdoc`.
* **[mbbill/undotree](https://github.com/mbbill/undotree):** Visualizes the undo history as a tree. Mapped to `<leader>u` for toggling.
* **[theprimeagen/harpoon](https://github.com/theprimeagen/harpoon):** Quickly mark and jump between files.
  * `<C-e>`: Toggles the quick menu.
  * `<leader>a`: Adds current file to harpoon list.
  * `<C-1>` to `<C-8>`: Selects files from the harpoon list.
  * `<C-S-p>`, `<C-S-n>`: Navigate previous/next in harpoon list.
* **[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim):** Displays git diffs in the sign column and provides git hunk manipulation.
  * Custom signs for `add`, `change`, `delete`, `topdelete`, `changedelete`.
  * Keymaps for navigating hunks (`]c`, `[c`), staging/resetting hunks (`<leader>hs`, `<leader>hr`), staging/resetting buffer (`<leader>hS`, `<leader>hR`), previewing hunks (`<leader>hp`, `<leader>hi`), blaming lines (`<leader>hb`), diffing (`<leader>hd`, `<leader>hD`), and toggles.

### Fuzzy Finding

* **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim):** A highly extensible fuzzy finder.
  * Uses `telescope-fzf-native.nvim` for performance.
  * Integrated with `telescope-ui-select.nvim`.
  * Keymaps for searching help tags (`<leader>sh`), keymaps (`<leader>sk`), files (`<leader>sf`), builtins (`<leader>ss`), current word (`<leader>sw`), grep (`<leader>sg`), diagnostics (`<leader>sd`), resume last search (`<leader>sr`), old files (`<leader>s.`), commands (`<leader>sc`), and buffers (`<leader><leader>`).
  * LSP-specific Telescope pickers (references, implementations, definitions, document/workspace symbols, type definitions) are enabled on `LspAttach`.
  * `<leader>/`: Fuzzy search in current buffer using a dropdown theme.
  * `<leader>s/`: Live grep in open files.
  * `<leader>sn`: Search Neovim configuration files.

### Language Server Protocol (LSP) & Development Tools

* **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):** Easy way to configure Neovim's built-in LSP client.
  * **Dependencies:** `mason.nvim`, `mason-lspconfig.nvim`, `mason-tool-installer.nvim`, `fidget.nvim`.
  * **Configured LSPs:** `gopls` (for Go), `stylua` (for Lua formatting), and `lua_ls` (for Lua development, with specific runtime and workspace settings).
  * Automatic installation of LSPs and tools via `mason-tool-installer.nvim`.
  * **LSP Keymaps (on LspAttach):**
    * `grn`: Rename symbol.
    * `gra`: Code action.
    * `grD`: Go to declaration.
    * `<leader>th`: Toggle inlay hints (if supported by LSP).
  * Highlights references of the word under cursor on `CursorHold`.
* **[saghen/blink.cmp](https://github.com/saghen/blink.cmp):** Autocompletion plugin.
  * **Snippet Engine:** Uses `L3MON4D3/LuaSnip` (with `make install_jsregexp` build step, if not Windows).
  * `keymap.preset = 'enter'`: Accepts completion with `<CR>`.
  * `signature.enabled = true`: Shows signature help.
  * `fuzzy.implementation = 'lua'`.
* **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim):** Formatter plugin.
  * Mapped `<leader>f` to format the buffer asynchronously with `lsp_format = 'fallback'`.
  * `format_on_save` is configured to disable for `c` and `cpp` filetypes but enabled for others with a timeout and LSP fallback.
  * `formatters_by_ft.lua = { 'stylua' }`.
* **[mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint):** Linter plugin.
  * Configured to use `markdownlint` for markdown files.
  * Automatically runs linters on `BufEnter`, `BufWritePost`, `InsertLeave` if the buffer is modifiable.
* **[mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap):** Debug Adapter Protocol client.
  * **Dependencies:** `rcarriga/nvim-dap-ui`, `nvim-neotest/nvim-nio`, `mason-org/mason.nvim`, `jay-babu/mason-nvim-dap.nvim`, `leoluz/nvim-dap-go`.
  * Automatic installation of debug adapters via `mason-nvim-dap.nvim` (ensures `delve` is installed).
  * `nvim-dap-ui` configured with custom icons.
  * DAP listeners for `dapui.open` on `event_initialized` and `dapui.close` on `event_terminated`/`event_exited`.
  * `nvim-dap-go` setup, with `detached = false` on Windows.
  * **Debugging Keymaps:**
    * `<F5>`: Start/Continue.
    * `<F1>`: Step Into.
    * `<F2>`: Step Over.
    * `<F3>`: Step Out.
    * `<leader>b`: Toggle Breakpoint.
    * `<leader>B`: Set Breakpoint with condition.
    * `<F7>`: Toggle DAP UI.
* **[ray-x/go.nvim](https://github.com/ray-x/go.nvim):** Go development plugin.
  * Uses `ray-x/guihua.lua`, `neovim/nvim-lspconfig`, `nvim-treesitter/nvim-treesitter` as dependencies.
  * Configures `goimports` on `BufWritePre` for `*.go` files.
  * Sets `tabstop = 4`, `shiftwidth = 4`, `expandtab = false`, `smarttab = true`, `autoindent = true` for Go files.

## Health Check

* A custom health check (`lua/kickstart/health.lua`) is included to verify Neovim version and external executables (`git`, `make`, `unzip`, `rg`).
