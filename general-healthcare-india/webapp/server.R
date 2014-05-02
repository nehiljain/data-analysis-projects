require(rCharts)
require(ggplot2)
require(dplyr)
require(reshape2)
require(scales)
source("../code/r/analysis.R")

analysis_data <- analysis_data %.%
  filter(state_and_ut != c("All India Total"))  %.%
  arrange(desc(sc_shortfall)) %.%
  select(state_and_ut, sc_shortfall, sc_govt_effect)
shinyServer(function(input, output) {
  
  output$myChart <- renderChart({
    n1 <- ggplot(analysis_data, aes(x=state_and_ut, y=sc_govt_effect)) +
           geom_bar(stat = "identity", 
                     aes(fill = analysis_data$sc_govt_effect > 0 ), 
                     legend = FALSE) +
          geom_text(label = analysis_data$state_and_ut, 
                    vjust = 0.5, hjust = 0.5, angle = 90 ) + 
          theme(axis.text.x = element_blank(), axis.ticks = element_blank())
      
    n1$addParams(dom = 'myChart')
    return(n1)
  })
})
