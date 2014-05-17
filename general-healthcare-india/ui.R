library(shiny)
library(ggplot2)

shinyUI(pageWithSidebar(
  headerPanel("Healthcare ke Shortfalls in India"),
  
  sidebarPanel(
    selectInput("variable", "Health Centres(HC):",
                list("Sub Center" = "sc_govt_effect", 
                     "Public HC" = "phc_govt_effect", 
                     "Community HC" = "chc_govt_effect"))
  ),
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("myChart")
  )
))

