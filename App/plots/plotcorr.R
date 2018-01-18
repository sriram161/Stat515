library(GGally)
source('App/data/clean_data/data_mangle.R')
source('App/helpers/plots.R')

#Data preparation
renew <- data.energy.renew() 
fossil <- data.energy.fossil() 
renew.fossil.data <- inner_join(renew, fossil, by=c("StateCode", "Year","decade"))

#plot
cor.plot <- function(decades = "1960's", source = 'RETCB', components = 'Renew'){
  data_ <- renew.fossil.data %>% filter(decade == decades)
  key <- 3
  comp <- 12:14
  if(source == 'RETCB') { key <- 3}
  else { key <- 11}
  if(components == "Renew") { comp <- 4:9}
  else {comp <- 12:14}
  return(ggpairs(data_[,c(key,comp)]))
}
