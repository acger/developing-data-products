library(shiny)
library(plotly)

ui <- fluidPage(
  
  # Application title
  titlePanel("Baby Age/Weight Calculator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("sex", "Sex", choices = c("girl", "boy"), selected = "girl"),
      sliderInput("age",
                  "Age in days:",
                  min = 1,
                  max = 1850,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("distPlot")
    )
  )
)