library(dplyr)
library(plotly)
library(ggplot2)
library(tidyverse)
library(maps)
library(mapproj)
library(shiny)
library(rsconnect)

clinics_df <- read.csv("cities.csv", stringsAsFactors = FALSE)

new_clinics_df <- clinics_df %>%
  select(state, gestation_8_duration, gestation_12_duration, gestation_16_duration, gestation_20_duration)

pivot_df <- new_clinics_df %>%
  pivot_longer(!c(state),
               names_to = "gestation",
               values_to = "duration")

theme1 <- theme_bw() +
  theme (
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank(),
  )

server <- function(input, output) {
  output$clinics1_plotly <- renderPlotly({
    summarized_df <- clinics_df %>%
      group_by(state) %>%
      summarize(avg_12_gestation_time = mean(gestation_12_duration)) %>%
      filter(state %in% input$state_select)
    
    clinics1_plot <- ggplot(summarized_df) +
      geom_col(aes(x = state,
                   y = avg_12_gestation_time,
                   fill = state,
                   text = paste("State: ", state, "<br>",
                                "Average Duration: ", round(avg_12_gestation_time, 2), " hours")),
                 show.legend = FALSE) +
      labs(title = "Average Distance (hours) at 12 Weeks Gestation by State",
           x = "State", 
           y = "Average Driving Duration (hours)", 
           fill = "Key")
  
    clinics1_plotly <- ggplotly(clinics1_plot, tooltip = "text")
    
    return(clinics1_plotly)
  })
  
  output$clinics2_plotly <- renderPlotly({
    selected_state <- input$state_select2
    
    selected_df <- pivot_df %>%
      filter(state == selected_state) %>%
      group_by(gestation) %>%
      summarize(avg_duration = mean(duration)) %>%
      arrange(avg_duration)
    
    clinics2_plot <- ggplot(selected_df) +
      geom_col(aes(x = reorder(factor(gestation), avg_duration),
                   y = avg_duration,
                   fill = factor(gestation),
                   text = paste("Average Duration: ", round(avg_duration, 2), " hours")),
               show.legend = FALSE) +
      labs(x = "Gestation Stage (Weeks)", 
           y = "Average Driving Duration (hours)", 
           fill = "Gestation Weeks") +
      labs(title = paste("Average Driving Time at Different Gestation Stages in", selected_state)) +
      scale_x_discrete(labels = c("8 weeks", "12 weeks", "16 weeks", "20 weeks")) +
      theme(legend.position = "none")

    clinics2_plotly <- ggplotly(clinics2_plot, tooltip = "text")
   
    return(clinics2_plotly)
    
  })  
  
  output$clinics3_plotly <- renderPlotly({
    states <- map_data("state")
    
    clinics_df <- read.csv("cities.csv") %>% 
      group_by(state) %>%
      mutate(state = tolower(state)) %>%
      summarize(avg_8_closed = mean(gestation_8_duration_closed),
                avg_12_closed = mean(gestation_12_duration_closed),
                avg_16_closed = mean(gestation_16_duration_closed),
                avg_20_closed = mean(gestation_20_duration_closed)
                ) 
    colnames(clinics_df)[1] <- "region"
    
    state_clinics <- left_join (states, clinics_df)
    
    state_clinics$text <- paste("State: ", str_to_title(state_clinics$region),
                                "<br>Avg. Driving Distance (hours): ",
                                state_clinics[[input$preg_stage_select]])
    
    clinics3_plot <- ggplot(state_clinics) +
      geom_polygon(aes(long, lat, group=group, fill = get(input$preg_stage_select), text = text)) +
      scale_fill_continuous(low = "yellow", high = 'red') +
      coord_map() +
      labs(fill = "Hours",
           title = "Avg. Driving Distance (hours) if the Nearest Clinic Closed by Gestation Stage") +
      theme1
    
    clinics3_plotly <- ggplotly(clinics3_plot, tooltip = "text")
    
    return(clinics3_plotly)
  })
  
}
