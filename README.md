# antiword

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/ropensci/antiword.svg?branch=master)](https://travis-ci.org/ropensci/antiword)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ropensci/antiword?branch=master&svg=true)](https://ci.appveyor.com/project/jeroen/antiword)
[![Coverage Status](https://codecov.io/github/ropensci/antiword/coverage.svg?branch=master)](https://codecov.io/github/ropensci/antiword?branch=master)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/antiword)](http://cran.r-project.org/package=antiword)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/antiword)](http://cran.r-project.org/web/packages/antiword/index.html)

> Extract Text from Microsoft Word Documents

Wraps the [AntiWord](http://www.winfield.demon.nl/) utility to extract text from 
Microsoft Word documents. The utility only supports the old `doc` format, not the 
new xml based `docx` format.

## Installation

```
devtools::install_github("ropensci/antiword")
```

## Hello World

The function has only a single function `antiword()`. It takes either a local 
file path or a URL to a word document:

```r
library(antiword)
text <- antiword("https://jeroen.github.io/files/UDHR-english.doc")
cat(text)
```
