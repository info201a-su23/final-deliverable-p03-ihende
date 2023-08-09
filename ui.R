
maternity_leave_by_plot <- tabPanel("Maternity Leave By Country",
                                    h1("Maternity Leave By Country"),
                                    
                                    sidebarLayout(
                                      sidebarPanel(
                                        h2("Options for Graph"),
                                        selectInput(inputId = "country_select",
                                                    label = "Select Countries",
                                                    choices = maternity_df$Country.Name,
                                                    selected = "Ireland",
                                                    multiple = TRUE)
                                      ),
                                      mainPanel(
                                        h2("Maternity Leave by Country Plot"),
                                        plotlyOutput(outputId = "maternity_plotly")
                                      )
                                    )
)


second_tab_panel <- tabPanel("Second graph",
                             h1("TO DO: Add another graph here.")
)

third_tab_panel <- tabPanel("Third graph",
                             h1("TO DO: Add another graph here.")
)

ui <- navbarPage("Maternity Leave",
                 maternity_leave_by_plot,
                 second_tab_panel,
                 third_tab_panel
)
