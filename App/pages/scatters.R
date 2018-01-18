library(shiny)
library(gridExtra)
source("App/helpers/labels.R")

scatter.plot1 <- function(){
  return(fluidPage(
    titlePanel("USA EIA Energy state data 1960-2015."),
    sidebarLayout(
      sidebarPanel(
        selectInput('xAxis', label= "Select dependent Fuel", choices = codes.all, selected="FFTCB"),
        selectInput('yAxis', label= "Select impacted Fuel", choices = codes.all, selected="RETCB")
      ),
      mainPanel(plotOutput('scatterPlot'))
    )))
}