library(dplyr)
library(plotly)
library(ggplot2)

maternity_df <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/maternity-leave-2021.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  output$maternity_plotly <- renderPlotly({
    selected_df <- maternity_df %>%
      filter(Country.Name %in% input$country_select)
    
    maternity_plot <- ggplot(selected_df) +
      geom_col(aes(x = Value,
                   y = reorder(Country.Name, +Value),
                   fill = Country.Name,
      ))
    
    maternity_plotly <- ggplotly(maternity_plot)
    
    return(maternity_plotly)
    
  })
}
  
  
  