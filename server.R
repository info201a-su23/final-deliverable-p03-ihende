library(dplyr)
library(plotly)
library(ggplot2)
library(tidyverse)

clinics_df <- read.csv("cities.csv", stringsAsFactors = FALSE)

new_clinics_df <- clinics_df %>%
  select(state, gestation_8_duration, gestation_12_duration, gestation_16_duration, gestation_20_duration)

pivot_df <- new_clinics_df %>%
  pivot_longer(!c(state),
               names_to = "gestation",
               values_to = "duration")

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
      labs(title = "Average Distance (hours) at 12 Weeks Gestation by State",
           x = "State", 
           y = "Average 12-week Driving Duration (hours)", 
           fill = "Key")
  
    clinics1_plotly <- ggplotly(clinics1_plot)
    
    return(clinics1_plotly)
  })
  
  output$clinics2_plotly <- renderPlotly({
    selected_state <- input$state_select2
    
    selected_df <- pivot_df %>%
      filter(state == selected_state) %>%
      group_by(gestation) %>%
      summarize(avg_duration = mean(duration))
    
    clinics2_plot <- ggplot(selected_df) +
      geom_col(aes(x = factor(gestation),
                   y = avg_duration,
                   fill = factor(gestation),
                   text = paste("<br>Avg. Duration:", round(avg_duration, 2), "hours"))) +
      labs(x = "Gestation Stage (Weeks)", 
           y = "Driving Duration (hours)", 
           fill = "Gestation Weeks") +
      labs(title = paste("Average Driving Time at Different Gestation Stages in", selected_state)) +
      scale_x_discrete(labels = c("12 weeks", "16 weeks", "20 weeks", "8 weeks")) +
      theme(legend.position = "none")

    clinics2_plotly <- ggplotly(clinics2_plot)
   
    return(clinics2_plotly)
    
  })  
  
  output$clinics3_plotly <- renderPlotly({
    
  })
  
}
