require(rCharts)
shinyUI(pageWithSidebar(
  headerPanel("rCharts: Interactive Charts from R using polychart.js"),
  
  sidebarPanel(
    selectInput(inputId = "x",
                label = "Choose X",
                choices = c('sc_shortfall', 'phc_shortfall', 'chc_shortfall'),
                selected = "sc_shortfall")
  ),
  mainPanel(
    showOutput("myChart")
  )
))