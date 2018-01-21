source('App/data/clean_data/data_mangle.R')
source('App/helpers/labels.R')
source('App/helpers/plots.R')
source('App/helpers/colors.R')
library('leaflet')
library('sf')
library('gridExtra')

#*** Need latitudes and longitudes for 

#Data preparation
renew <- data.energy.renew() 
fossil <- data.energy.fossil()
renew.fossil.data <- inner_join(renew, fossil, by=c("StateCode", "Year","decade"))
shape.frame <- read_sf(dsn="App/data/shape_data/data")
renew.fossil.data <- renew.fossil.data[,!(names(renew.fossil.data) %in% c("FFTCB", "RETCB", 'Year'))]

data.prep <- function(data, decades, funct){
  decade.data <- data %>% filter(decade == decades)
  decade.data <- decade.data %>% group_by(StateCode) %>% summarize_all(funs(eval(parse(text=funct))))
  decade.data <- data %>% left_join(shape.frame, by=c("StateCode" = "STUSPS"))
  return(decade.data)
}

#plot minor
plot.bin.leaflet <- function(colname, funct, bins, decades)
  {
  colname.abs <- paste('data.piece$',colname)
  data.piece <- data.prep(renew.fossil.data, decades, funct)
  col.palette <- pallete("YlOrRd", paste('data.piece$',colname.abs), typename='bin', bins)
  plot <- data.piece %>%
          leaflet() %>%
          addPolygons(weight = 1, label= ~NAME, color = ~col.palette(colname.abs))
  return(plot)
}

#plot used on server call
coropleth.plot <- function(colname, funct, bins){
  plots <- list()
  for (decade in codes.decades){
    plots[decade] <- plot.bin.leaflet(colname, funct, as.integer(bins), decades = decade)
  }
  return(do.call(grid.arrange,c(plots,nrows=3)))
}
