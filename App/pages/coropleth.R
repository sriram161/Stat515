library(shiny)
library(gridExtra)
source("App/helpers/labels.R")

coropleth.plot1 <- function(){
  return(fluidPage(
    titlePanel("USA EIA Energy state data 1960-2015."),
    sidebarLayout(
      sidebarPanel(
        selectInput('Fuel', label= "Select Fuel", choices = codes.new, selected="Coal"),
        selectInput('Stat', label= "Select decriptive stat", choices = codes.stats, selected="Mean"),
        sliderInput('Bins', label= "Number of observations:", min = 1, max = 10, value = 1)
),
      mainPanel(plotOutput('CoroplethPlot'))
    )))
}