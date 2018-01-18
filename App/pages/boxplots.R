library(shiny)
library(gridExtra)
source("App/helpers/labels.R")

box.plot1 <- function(){
  return(fluidPage(
    titlePanel("USA EIA Energy state data 1960-2015."),
    sidebarLayout(
      sidebarPanel(
        selectInput('fuelType1', label= "Select type fossil Fuel", choices = codes.fossil, selected="FFTCB"),
        selectInput('fuelType2', label= "Select type renewable Fuel", choices = codes.renew, selected="RETCB")
      ),
      mainPanel(plotOutput('boxPlot'))
    )))
}
