require(ggplot2)
require(dplyr)
require(reshape2)
require(scales)
require(shiny) 
require(grid)
source("load_data.R")
source("analysis.R")


shinyServer(function(input, output) {
  
  # Create a reactive text
  text <- reactive({
    paste(input$variable)
  })
  
  # Return as text the selected variables
  output$caption <- renderText({
    text()
  })
  
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
            vjust =  0.5, hjust = - 0.01, angle = 90 ) +
            theme(axis.text.x = element_blank(), axis.ticks = element_blank()) + 
            scale_y_continuous(breaks=c(-15:15)) + 
      xlab("States and UTs of India") +
      ylab("Effect of GOvt. Efforts per Population Density")
            


    print(p)
  }, height = 700, width = 900)
})

ggplot(imrData, aes(x=imrData$states_and_ut, y=imrData$imr_per_pop_d)) +
  geom_bar(stat = "identity"),
aes(fill = imrData$imr_per_pop_d > 0 ,
    legend = FALSE) +
  geom_text(label = imrData$states_and_ut,
            vjust = 0.5, hjust = 0.5, angle = 90 ) +
  theme(axis.text.x = element_blank(), axis.ticks = element_blank())
