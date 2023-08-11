library(shiny)
library(shinythemes)

introduction_tab_panel <- tabPanel("Introduction",
                                   h1("TO DO: Add introduction here.")
)

graph1_tab_panel <- tabPanel("Average Distance by State (12 Weeks)",
                             h1("Average Driving Time (hours) to Nearest Clinic at 12 Weeks Gestation"),
                             p("This chart shows the average driving time to the nearest abortion clinic
                               at 12 weeks gestation for the selected state(s). Users can select as many
                               or as little states as they wish to observe. This visual was designed to
                               allow users to observe patterns and disparities across different states or 
                               regions and give them an idea of what abortion clinic access at 12 weeks 
                               looks like in various locations. The variability of this chart can also
                               allow users to draw conclusions or make inferences regarding the impacts of 
                               individual state government policies on abortion access."),
                             sidebarLayout(
                               sidebarPanel(
                                 h2("State Selector"),
                                 selectInput(inputId = "state_select",
                                             label = "Select State(s)",
                                             choices = clinics_df$state,
                                             selected = "Washington",
                                             multiple = TRUE)
                               ),
                               mainPanel(
                                 h2("Average Distance (hours) at 12 Weeks Gestation by State Plot"),
                                 plotlyOutput(outputId = "clinics1_plotly")
                               )
                             ))

graph2_tab_panel <- tabPanel("Second graph",
                             h1("TO DO: Add another graph here.")
)

graph3_tab_panel <- tabPanel("Third graph",
                             h1("TO DO: Add another graph here.")
)

conclusion_tab_panel <- tabPanel("Conclusion/Summary Takeaways",
                                 h1("TO DO: Add conclusion here.")
)

ui <- navbarPage(
  theme = shinytheme("superhero"),
  "Driving Times to Abortion Clinics in the U.S. - How Far is Too Far?",
  introduction_tab_panel,
  graph1_tab_panel,
  graph2_tab_panel,
  graph3_tab_panel,
  conclusion_tab_panel
)
