library(dplyr)
library(plotly)
library(ggplot2)

clinics_df <- read.csv("cities.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  output$clinics1_plotly <- renderPlotly({
    summarized_df <- clinics_df %>%
      group_by(state) %>%
      summarize(avg_12_gestation_time = mean(gestation_12_duration)) %>%
      filter(state %in% input$state_select)
    
    clinics1_plot <- ggplot(summarized_df) +
      geom_col(aes(x = state,
                   y = avg_12_gestation_time,
                   fill = state)) +
      labs(x = "State", y = "Average 12-week Driving Time (hours)", fill = "Key")
    
    clinics1_plotly <- ggplotly(clinics1_plot)
    
    return(clinics1_plotly)
  })
 
  output$clinics2_plotly <- renderPlotly({
    # Code for second graph goes here
    
  })  
  
  output$clinics3_plotly <- renderPlotly({
    # Code for third graph goes here

  })
   
}
