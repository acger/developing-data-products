library(shiny)

source("plotFunction.R")

percentiles_girls <- subset(read.table("data/wfa_girls_p_exp.txt", header = TRUE, sep="\t", stringsAsFactors = FALSE), select = c(Age, P3, P10, P15, P50, P85, P90, P97))
percentiles_boys  <- subset(read.table("data/wfa_boys_p_exp.txt", header = TRUE, sep="\t", stringsAsFactors = FALSE), select = c(Age, P3, P10, P15, P50, P85, P90, P97))


server <- function(input, output) {
  observeEvent(eventExpr = input[["sex"]],
               handlerExpr = {
                 if (input$sex == "girl") {
                   output$distPlot <- renderPlotly({
                     plotPercentiles(percentiles_girls, input$age, nrow(percentiles_girls))
                   })
                 } else {
                   output$distPlot <- renderPlotly({
                     plotPercentiles(percentiles_boys, input$age, nrow(percentiles_boys))
                   })
                 }
               })
}