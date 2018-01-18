library(shiny)
library(gridExtra)
source("App/helpers/labels.R")


boxplot.page1 <- function(){
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

corplot.page2 <- function(){
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

scatterplot.page3 <- function(){
  return(fluidPage(
    titlePanel("USA EIA Energy state data 1960-2015."),
    sidebarLayout(
      sidebarPanel(
        selectInput('xAxis', label= "Select decade", choices = codes.all, selected="FFTCB"),
        selectInput('yAxis', label= "Select source fuel", choices = codes.all, selected="RETCB")
      ),
      mainPanel(plotOutput('scatterPlot'))
    )))
}


