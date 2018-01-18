library(shiny)
source('App/server.R')
source('App/ui.R')

shinyApp( ui = myUI, server = myServer)
