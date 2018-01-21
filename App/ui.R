# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(gridExtra)
source("App/helpers/labels.R")
source("App/pages/boxplots.R")
source("App/pages/correlations.R")
source("App/pages/scatters.R")
source("App/pages/coropleth.R")

myUI <- navbarPage("USA Energy dashboard",
  tabPanel("BOX_PLOT", box.plot1()),
  tabPanel("CORRELATION_PLOT", corr.plot1()),
  tabPanel("SCATTER_FACET", scatter.plot1()),
  tabPanel("BINNED_MAP", coropleth.plot1()),
  collapsible = TRUE)