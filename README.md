# Requirements
- nvim version > 9.5
- python3
- node and npm (for some lsp support)
- sudo apt install ripgrep
- sudo apt install xdg-utils (for URL opening in obsidian-need to change depending on OS)
- sudo apt-get install xclip

## For Latex Rendering
- Install zathura

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
