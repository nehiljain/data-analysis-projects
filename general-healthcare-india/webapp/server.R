require(rCharts)
shinyServer(function(input, output) {
  output$myChart <- renderChart({
    n1 <- nPlot(sc_shortfall ~ state_and_ut, data=analysis_data[1:35,], type="discreteBarChart", staggerLabels=TRUE)
    n1$addParams(dom = 'myChart')
    return(n1)
  })
})
