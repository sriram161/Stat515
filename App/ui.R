# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(gridExtra)
source("App/helpers/labels.R")
source("App/pages/pages.R")

myUI <- navbarPage("USA Energy dashboard",
  tabPanel("BOX_PLOT", boxplot.page1()),
  tabPanel("CORRELATION_PLOT", corplot.page2()),
  tabPanel("SCATTER_FACET", scatterplot.page3()), 
  collapsible = TRUE) 

