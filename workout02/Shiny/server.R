library(shiny)
library(ggplot2)
library(tidyr)

# Define server logic for investment plots
shinyServer(function(input, output) {
   
  dat <- reactive({
    no <- c(input$initial, rep(0, input$years))
    fixed <- c(input$initial, rep(0, input$years))
    growing <- c(input$initial, rep(0, input$years))
    return_rate <- input$return / 100.0 + 1
    growth_rate <- input$growth / 100.0 + 1
    
    for (i in 1:input$years) {
      no[i+1] <- no[i] * (return_rate)
      fixed[i+1] <- fixed[i] * (return_rate) + input$annual
      growing[i+1] <- growing[i] * (return_rate) +  input$annual * (growth_rate ^ (i - 1))
    }
    
    dat <- data.frame(
      year = 0:input$years,
      no_contrib = no,
      fixed_contrib = fixed,
      growing_contrib = growing
    )
    return(dat)
  })
  
  output$plot <- renderPlot({
    dt <- dat()
    dat_long <- gather(dt, -year, key = "type", value = "value")
    if (input$facet == "No") {
      plt <- ggplot() + 
        geom_line(data = dat_long, aes(x = year, y = value, color = factor(type))) +
        labs(x = "Year", y = "Value", title = "Three Modes of Investing")
    } else {
      plt <- ggplot() + 
        geom_area(data = dat_long, aes(x = year, y = value, fill = factor(type))) +
        labs(x = "Year", y = "Value", title = "Three Modes of Investing") + 
        facet_wrap(~type, ncol = 3)
    }
    return(plt)
  })
  
  output$dat <- renderTable(dat())
  
})
