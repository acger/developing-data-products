library(shiny)
library(plotly)

ui <- fluidPage(
  
  # Application title
  titlePanel("The WHO Child Growth Standards - Age/Weight"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("sex", "Sex", choices = c("girl", "boy"), selected = "girl"),
      p("First select the sex of the child. You can change it any time."),
      sliderInput("age",
                  "Age in days:",
                  min = 1,
                  max = 1850,
                  value = 30),
      p("Use slider to set the age of the child. The plot displays the selected age as a vertical bar.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("distPlot")
    )
  )
)