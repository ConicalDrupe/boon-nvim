# To-do -> dadbod
- Location to save queries
- Navigate through results (List of results, and also navigate through columns/rows)
- Navigate through Queries
- Create helper queries (make sure they do not save)
- When using helper queries,rename buffer to helper query


# Nvim version > 9.0

# Python3

# Node and npm. -version?

#R
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
  - install.packages(c("languageserver","devtools","dplyr","reticulate","ggplot2"))
