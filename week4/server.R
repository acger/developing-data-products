library(shiny)
library(plotly)

percentiles_girls <- read.table("data/wfa_girls_p_exp.txt", header = TRUE, sep="\t", stringsAsFactors = FALSE)
percentiles_boys  <- read.table("data/wfa_boys_p_exp.txt", header = TRUE, sep="\t", stringsAsFactors = FALSE)

# Init dataset
percentiles <- percentiles_girls

plotPercentiles <- function(data, age) {
  plot_ly(data, x = ~Age, y = ~P50, name = 'P50', type = 'scatter', mode = 'lines', line = list(color = 'black', width = 2)) %>%
    add_trace(y = ~P3, name = 'P3', line = list(color = 'rgb(205, 12, 24)', width = 3)) %>%
    add_trace(y = ~P10, name = 'P10', line = list(color = 'rgb(22, 96, 167)', width = 1)) %>%
    add_trace(y = ~P15, name = 'P15', line = list(color = 'rgb(22, 96, 167)', width = 1)) %>%
    add_trace(y = ~P85, name = 'P85', line = list(color = 'rgb(22, 96, 167)', width = 1)) %>%
    add_trace(y = ~P90, name = 'P90', line = list(color = 'rgb(22, 96, 167)', width = 1)) %>%
    add_trace(y = ~P97, name = 'P97', line = list(color = 'rgb(205, 12, 24)', width = 3)) %>%
    add_segments(x = age, xend = age, y = 0, yend = 27) %>%
    layout(title = "Child weight (kg) / age (days)",
           xaxis = list(title = "Weight (days)"),
           yaxis = list(title = "Weight (kg)"))
}

server <- function(input, output) {
  observeEvent(eventExpr = input[["sex"]],
               handlerExpr = {
                 if (input$sex == "girl") {
                   output$distPlot <- renderPlotly({
                     plotPercentiles(percentiles_girls, input$age)
                   })
                 } else {
                   output$distPlot <- renderPlotly({
                     plotPercentiles(percentiles_boys, input$age)
                   })
                 }
               })
}