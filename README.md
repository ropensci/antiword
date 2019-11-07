# antiword

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/ropensci/antiword.svg?branch=master)](https://travis-ci.org/ropensci/antiword)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ropensci/antiword?branch=master&svg=true)](https://ci.appveyor.com/project/jeroen/antiword)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/antiword)](http://cran.r-project.org/package=antiword)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/antiword)](http://cran.r-project.org/web/packages/antiword/index.html)

> Extract Text from Microsoft Word Documents

Wraps the [AntiWord](http://www.winfield.demon.nl/) utility to extract text from 
Microsoft Word documents. The utility only supports the old `doc` format, not the 
new xml based `docx` format. Use the 'xml2' package to read the latter.

## Installation

Install the package directly from CRAN:

```r
install.packages("antiword")
```

## Example Usage

The function has only a single function `antiword()`. It takes either a local 
file path or a URL to a word document:

```r
library(antiword)
text <- antiword("https://jeroen.github.io/files/UDHR-english.doc")
cat(text)
```

```
Universal Declaration of Human Rights
                            Plain English Version

 
All people everywhere have the same human rights, which no one can take
away. This is the basis of freedom, justice and peace in the world.
This Declaration affirms the dignity and worth of all people, and the equal
rights of women and men. The rights described here are the common standard
for all people everywhere.
Every person and nation is asked to support the understanding and respect
for these rights, and to take steps to make sure that they are recognised
and observed everywhere, for all people.
```

This package is part of rOpenSci!
