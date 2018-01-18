library(shiny)
library(gridExtra)
source('App/helpers/labels.R')

corr.plot1 <- function(){
  return(fluidPage(
    titlePanel("USA EIA Energy state data 1960-2015."),
    sidebarLayout(
      sidebarPanel(
        selectInput('idecade', label= "Select decade", choices = codes.decades, selected="1960's"),
        selectInput('isource', label= "Select source fuel", choices = codes.energy.source, selected="FFTCB"),
        selectInput('ifeatures', label= "Select all renew/fossil component fuel", choices = codes.componet.fuel, selected="Fossil")
      ),
      mainPanel(plotOutput('corPlot'))
    )))
}