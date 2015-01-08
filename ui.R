library(shiny)

shinyUI(fluidPage(
  titlePanel("Reactive Stock Visualization"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Loads data from yahoo finance."),
    
      #textInput("symb", "Symbol", "SPY"),
      selectInput("symb", 
                  label = "Choose a company to display",
                  choices = c("IBM", "GOOG",
                              "YHOO", "SPY"),
                  selected = "IBM"),
      
    
      dateRangeInput("dates", 
        "Date range",
        start = "2014-01-01", 
        end = as.character(Sys.Date())),
   
      actionButton("get", "Get Stock"),
      
      br(),
      br(),
      
      checkboxInput("log", "y - Use log scale", value = FALSE),
      
      checkboxInput("adjust", "Adjust prices for inflation", value = FALSE)
    ),
    
    mainPanel(plotOutput("plot"))
  )
))