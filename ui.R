
introduction_tab_panel <- tabPanel("Introduction",
                                    h1("TO DO: Add introduction here.")
)


graph1_tab_panel <- tabPanel("First graph",
                             h1("Maternity Leave By Country"),
                             
                             sidebarLayout(
                               sidebarPanel(
                                 h2("Options for Graph"),
                                 selectInput(inputId = "country_select",
                                             label = "Select Countries",
                                             choices = maternity_df$Country.Name,
                                             selected = "Bulgaria",
                                             multiple = TRUE)
                               ),
                               mainPanel(
                                 h2("Maternity Leave by Country Plot"),
                                 plotlyOutput(outputId = "maternity_plotly")
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

ui <- navbarPage("Abortion Clinics Distance in Driving Time",
                 introduction_tab_panel,
                 graph1_tab_panel,
                 graph2_tab_panel,
                 graph3_tab_panel,
                 conclusion_tab_panel
)
