source('App/data/clean_data/data_mangle.R')
source('App/helpers/plots.R')
source('App/helpers/3dplot.R')
library(gridExtra)
library(GGally)

renew <- data.energy.renew() 
fossil <- data.energy.fossil() 

#Graph_1 boxplot to compare renew and fossil fuel usage in USA.
renew.plot <- function(item = 'RETCB'){
  return(ggplot(renew, aes(x=decade, y=eval(parse(text = item)))) +
  geom_boxplot(notch = TRUE, outlier.colour = "red", outlier.shape = 1) + stat_summary(fun.y=mean, geom="point", shape=5, size=1, colour = "Blue") +
    scale_y_log10() + scale_y_continuous(labels=fancy_scientific) +
  labs(x="Decade",
       y="Total Consumption in Million Btu",
       title="USA renewable Energy Consumption per decade, 1960-2015") + coord_flip())
}

fossil.plot <- function(item = 'FFTCB') {
  return(ggplot(fossil, aes(x=decade, y=eval(parse(text = item)))) +
  geom_boxplot(notch = TRUE, outlier.colour = "red", outlier.shape = 1) + stat_summary(fun.y=mean, geom="point", shape=5, size=1, colour = "Blue") +
  scale_y_log10() + scale_y_continuous(labels=fancy_scientific) +
  labs(x="Decade",
       y="Total Consumption in Million Btu",
       title="USA fossil fuel Consumption per decade, 1960-2015") + coord_flip())
}

#grid.arrange(fossil.plot(), renew.plot(), nrow=2) # result for plot 1. ####### Unit test

#Graph 2 correlation
renew.fossil.data <- inner_join(renew, fossil, by=c("StateCode", "Year","decade"))

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
#cor.plot()  ###unit testcode

#Graph 3 linear model
scatter.plot <- function(x='RETCB' , y='FFTCB') {
  return(ggplot(renew.fossil.data, aes(x=eval(parse(text = x)), y=eval(parse(text = y)))) + 
           geom_point(aes(color=factor(StateCode))) +
  geom_smooth(method = 'lm') + facet_wrap(~decade, ncol=2) + 
  labs(title = "USA Energy consumption dynamics per decade per states"))
}

temp <- lm(FFTCB~CLTCB+NNTCB+PMTCB, fossil)
summary(temp)

