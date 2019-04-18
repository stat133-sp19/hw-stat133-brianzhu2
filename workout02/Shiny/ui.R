library(shiny)

# Define UI for application that compares investment cycles
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Comparing Investment Scenarios"),
  
  # Rows with input widgets 
  fluidRow(
    column(4,
           sliderInput("initial",
                       "Initial Amount",
                       min = 0,
                       max = 100000,
                       step = 500,
                       value = 1000)
    ),
    column(4,
           sliderInput("return",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 5
                       )
    ),
    column(4,
           sliderInput("years", 
                       "Number of Years",
                       min = 1,
                       max = 50,
                       step = 1,
                       value = 20)
    )
  ),
  fluidRow(
    column(4,
           sliderInput("annual",
                       "Annual contribution",
                       min = 0,
                       max = 50000,
                       step = 500,
                       value = 2000)
    ),
    column(4,
           sliderInput("growth",
                       "Growth Rate (in %)",
                       min = 0,
                       max = 20,
                       step = 0.1,
                       value = 2
           )
    ),
    column(4,
           selectInput("facet",
                       "Facet?",
                       c("No", "Yes")
           )
    )
  ),
    
  # Show a plot of the investment timeline, and data table
  verticalLayout(
    h4("Timelines"),
    plotOutput("plot"),
    h4("Balances"),
    tableOutput("dat")
    )
  )
)
