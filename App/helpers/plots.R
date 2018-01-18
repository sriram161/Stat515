library('ggplot2')
library('micromapST')
library('lattice')
library('hexbin')
library('corrplot')
library('splines')
library('ISLR')

col.name.number <- function(x){
  val <- 1:ncol(x)
  names(val)<- colnames(x)
  return(val)
}

onDiag <- function(x, ...){
  yrng <- current.panel.limits()$ylim
  d <- density(x, na.rm=TRUE)
  d$y <- with(d, yrng[1] + 0.95 * diff(yrng) * y / max(y) )
  panel.lines(d,col=rgb(.83,.66,1),lwd=2)
  diag.panel.splom(x, ...)
}

offDiag <- function(x,y,...){
  panel.grid(h=-1,v=-1,...)
  panel.hexbinplot(x,y,xbins=15,...,border=gray(.7),
                   trans=function(x)x^.5)
  panel.loess(x , y, ..., lwd=2,col='red')
}

fancy_scientific <- function(l) {
  # turn in to character string in scientific notation
  l <- format(l, scientific = TRUE)
  # quote the part before the exponent to keep all the digits
  l <- gsub("^(.*)e", "'\\1'e", l)
  # turn the 'e+' into plotmath format
  l <- gsub("e", "%*%10^", l)
  # return this as an expression
  parse(text=l)
}

