# Requirements
- nvim version > 9.5
- python3
- node and npm (for some lsp support)
  - required for Pyright. If haing pyright error, uninstall pyright within Mason, and reinstall using updated version of node > 20 
- sudo apt install ripgrep
- sudo apt install xdg-utils (for URL opening in obsidian-need to change depending on OS)
- sudo apt-get install xclip
- sudo apt install ipython

- pip3 install pynvim jupyter (ipython?)

## For Latex 
### Support
- Treesitter CLI
    - TSInstall latex
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
