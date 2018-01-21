pallete <- function(pname, colname ,typename="cat" , bins=10){
  if (typename == "cat") {return(colorFactor(pname, unique(eval(parse(text=colname)))))}
  if (typename == "bin") {
    colQ <- colorQuantile(pname, unique(eval(parse(text=colname))))
    return(colorBin(pname, domain = eval(parse(text=colname)), bins=bins))
    }
}