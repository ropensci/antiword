#' Antiword
#'
#' Wraps the antiword utility. Takes a path to an word file and returns
#' text from the document.
#'
#' @export
#' @param file path or url to your word file
#' @param format format the output text (-f parameter)
#' @examples text <- antiword("https://jeroen.github.io/files/UDHR-english.doc")
#' cat(text)
antiword <- function(file = NULL, format = FALSE){
  args <- if(length(file)){
    if(grepl("^https?://", file)){
      tmp <- tempfile(fileext = ".doc")
      utils::download.file(file, tmp, mode = "wb")
      file <- tmp
    }
    file <- normalizePath(file, mustWork = TRUE)
    # Path with spaces need shQuote() on Windows, see https://github.com/jeroen/sys/issues/4
    c(ifelse(isTRUE(format), "-f", "-t"), file)
  }
  wd <- getwd()
  on.exit(setwd(wd))
  bindir <- system.file("bin", package = "antiword")
  setwd(bindir)
  postfix <- if(is_windows()) .Machine$sizeof.pointer * 8
  path <- file.path(bindir, paste0("antiword", postfix))
  out <- sys::exec_internal(path, args, error = FALSE)
  if(out$status == 0){
    if(length(out$stderr))
      cat(rawToChar(out$stderr), file = stderr())
    return(rawToChar(out$stdout))
  }
  stop(sprintf("System call to 'antiword' failed (%d): %s",
               out$status, rawToChar(out$stderr)), call. = FALSE)
}

is_windows <- function(){
  identical(.Platform$OS.type, "windows")
}
