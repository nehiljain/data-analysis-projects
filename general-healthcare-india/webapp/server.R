require(ggplot2)
require(dplyr)
require(reshape2)
require(scales)
require(shiny) 
source("~/coderepo/data-analysis-projects/general-healthcare-india/code/r/load_data.R")
source("~/coderepo/data-analysis-projects/general-healthcare-india/code/r/analysis.R")


shinyServer(function(input, output) {
  
#   # Create a reactive text
#   text <- reactive({
#     paste(input$variable)
#   })
#   
#   # Return as text the selected variables
#   output$caption <- renderText({
#     text()
#   })
  
  myData <- reactive({
    data.frame(name=analysis_data[,"state_and_ut"], value=analysis_data[,input$variable], 
               colorD = analysis_data[,input$variable] > 0 )
  })
  
  valuesDf <- reactive({
    list(analysis_data[,input$variable] > 0)
  })
  
  output$myChart <- renderPlot({
    
    
    
    p <- ggplot(myData(), aes_string(x="name", y="value")) +
            geom_bar(stat = "identity",
                     aes_string(fill = "colorD"),
                      legend = FALSE) +
            geom_text(label = myData()[,1],
            vjust = 0.5, hjust = 0.5, angle = 90 ) +
            theme(axis.text.x = element_blank(), axis.ticks = element_blank())


    print(p)
  }, height = 700, width = 900)
})


