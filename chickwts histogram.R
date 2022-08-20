library(shiny)
data(chickwts)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Chicken Weights"),
  
  # Sidebar layout with input ansd output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider input for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 0,
                  max = 60,
                  value = 30,
                  step = 1)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  

  output$distPlot <- renderPlot({
    
    x    <- chickwts$weight
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#98FB98", border = "black",
         xlab = "Chicken Weight (grams)",
         main = "Histogram of Chicken Weights")
    
  })
  
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)
