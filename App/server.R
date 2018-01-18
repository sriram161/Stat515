
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(gridExtra)
source('App/exploration.R')

myServer <- function(input, output) {
  output$boxPlot <- renderPlot(
    grid.arrange(fossil.plot(input$fuelType1), renew.plot(input$fuelType2), nrow=2))
  output$corPlot <- renderPlot(
    cor.plot(input$idecade, input$isource, input$ifeatures))
  output$scatterPlot <- renderPlot(
    scatter.plot(x=input$xAxis, y=input$yAxis))
}
