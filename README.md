# tpcquarto: html factsheet template <img src="man/figures/hex_tpcquarto.png" align="right" height="138" alt="" />

This repo is forked from [quarto-journals/article-format-template](https://github.com/quarto-journals/article-format-template)

In its current iteration this only supports an html version of a TPC factsheet. To create a PDF, open the HTML file in your browser and "print" to PDF.

In order to use this template, run the following in your terminal

```
quarto add nikhitaairi/tpcquarto
```

Then in the heading of your qmd file, set your format accordingly:
```
format:
  tpc-html: default
```