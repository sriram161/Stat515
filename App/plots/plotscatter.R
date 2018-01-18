source('App/data/clean_data/data_mangle.R')
source('App/helpers/plots.R')

#Data preparation
renew <- data.energy.renew() 
fossil <- data.energy.fossil() 
renew.fossil.data <- inner_join(renew, fossil, by=c("StateCode", "Year","decade"))


scatter.plot <- function(x='RETCB' , y='FFTCB') {
  return(ggplot(renew.fossil.data, aes(x=eval(parse(text = x)), y=eval(parse(text = y)))) + 
           geom_point(aes(color=factor(StateCode))) +
           geom_smooth(method = 'lm') + facet_wrap(~decade, ncol=2) + 
           labs(title = "USA Energy consumption dynamics per decade per states"))
}
