source('App/data/clean_data/data_mangle.R')
source('App/helpers/plots.R')

#Data preparation
renew <- data.energy.renew() 
fossil <- data.energy.fossil()

#plot
renew.box <- function(item){
  return(ggplot(renew, aes(x=decade, y=eval(parse(text = item)))) +
           geom_boxplot(notch = TRUE, outlier.colour = "red", outlier.shape = 1) + stat_summary(fun.y=mean, geom="point", shape=5, size=1, colour = "Blue") +
           scale_y_log10() + scale_y_continuous(labels=fancy_scientific) +
           labs(x="Decade",
                y="Total Consumption in Million Btu",
                title="USA renewable Energy Consumption per decade, 1960-2015") + coord_flip())
}

fossil.box <- function(item) {
  return(ggplot(fossil, aes(x=decade, y=eval(parse(text = item)))) +
           geom_boxplot(notch = TRUE, outlier.colour = "red", outlier.shape = 1) + stat_summary(fun.y=mean, geom="point", shape=5, size=1, colour = "Blue") +
           scale_y_log10() + scale_y_continuous(labels=fancy_scientific) +
           labs(x="Decade",
                y="Total Consumption in Million Btu",
                title="USA fossil fuel Consumption per decade, 1960-2015") + coord_flip())
}
