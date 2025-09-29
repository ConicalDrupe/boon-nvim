# Refactor
Replace nvim-lspconfig with blink-cmp. Makes lspconfig capabilitiy definitions obsolete via vim.lsp.config api integrations, blink takes care of the rest.

# Requirements
- nvim version > 11.3
- python3
- node and npm (for some lsp support)
  - required for Pyright. If haing pyright error, uninstall pyright within Mason, and reinstall using updated version of node > 20 
- sudo apt install ripgrep
- sudo apt install xdg-utils (for URL opening in obsidian-need to change depending on OS)
- sudo apt-get install xclip
- sudo apt install ipython3
- sudo apt install ipython3-pynvim
- sudo apt install ipython3-notebook
- sudo apt install ipython3-debugpy

- pip3 install pynvim jupyter (ipython?)

## For Latex 
### Support
- Treesitter CLI
    - TSInstall latex
    - TSInstall python
    - TSInstall regex
### Rendering
- Install zathura
### LSP
- Install latexmk

## Optional R support
- install R
- add the following snippet to .Rprofile
```
utils::assignInNamespace(
  "q", 
  function(save = "no", status = 0, runLast = TRUE) 
  {
    .Internal(quit(save, status, runLast))
  }, 
  "base"
)
```
- go to https://github.com/REditorSupport/languageserver and follow instructions
- install.packages(c("languageserver","devtools","dplyr","reticulate","ggplot2","patchwork","remote","GGally"))

# WSL2
- Install Xephyr
- Change permissions for /temp/.X11-server if needed
Xephyr :1 -fullscreen
(In new terminal) -> 
$ DISPLAY:=1
$ awesome

