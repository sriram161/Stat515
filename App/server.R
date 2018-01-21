
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(gridExtra)
library(tidyverse)
library(hexbin)
source("App/plots/plotbox.R")
source("App/plots/plotcorr.R")
source("App/plots/plotscatter.R")
source("App/plots/plotleaflet.R")

myServer <- function(input, output) {
  output$boxPlot <- renderPlot(
    grid.arrange(fossil.box(input$fuelType1), renew.box(input$fuelType2), nrow=2))
  output$corPlot <- renderPlot(
    cor.plot(input$idecade, input$isource, input$ifeatures))
  output$scatterPlot <- renderPlot(
    scatter.plot(x=input$xAxis, y=input$yAxis))
  output$CoroplethPlot <- renderPlot(
    coropleth.plot(colname=input$Fuel, funct=input$Stat, bins=input$Bins))
}
