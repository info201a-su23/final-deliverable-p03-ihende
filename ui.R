library(shiny)
library(shinythemes)

introduction_tab_panel <- tabPanel("Introduction",
                                   h1("Introduction"),
                                   p("The data we are using for this project was used in The Pudding Essay -
                                     How far is too far? An analysis of driving times to abortion clinics in the US. in
                                     September 2017. The data set can be accessed here:"),
                                   a(href = "https://github.com/the-pudding/data/blob/master/clinics/cities.csv", 
                                     "https://github.com/the-pudding/data/blob/master/clinics/cities.csv"),
                                   p(""),
                                   p("With the recent overturning of Roe v. Wade and increasing polarization of
                                     politics, the topic of abortion has become increasingly controversial. Individual
                                     states and/or regions undoubtedly have varying political climates which can affect
                                     state regulations and policies on abortion access. It is important to understand
                                     the healthcare disparities that are created as a result because they can widen other
                                     socioeconomic gaps. With the provided dataset, we hope to answer the following questions:"),
                                   p("1. How does each state vary in the driving times (hours) to the nearest abortion
                                     clinic?"),
                                   p("2. "),
                                   p("3. "),
                                   p(""),
                                   p("This data was collected by Russell Goldenberg and provides us with information on
                                     the driving time, in hours, to the nearest abortion clinic in varying locations. This
                                     data provides information on hundreds of counties across the U.S. It provides driving
                                     times, in hours, to the nearest abortion clinic that will provide abortion care at
                                     8, 12, 16, and 20 weeks. This type of data can help us detect patterns across various
                                     locations regarding how accessible abortion is, making the dataset sufficient in
                                     answering our main questions."),
                                   p(""),
                                   p("However, there are ethical questions and limitations that we need to consider when
                                     using this data to answer such critical questions. For example, we must consider who
                                     collected this data. Everyone has implicit biases, and the individual identity of the
                                     data collectors can affect the methodology of collection and what data is/isn't included.
                                     Additionally, we must consider missing or inaccurate values. With an expansive dataset like
                                     this one, there are bound to be missing, inaccurate, or distorted values. As a matter of
                                     fact, the author of the dataset mentions that they were unable to get detailed timing
                                     information for two clinics. Additionally, for city-specific data, only cities with >50,000 
                                     population (via 2015 data) were included. When considering this data, these ethical questions
                                     and limitations must be considered by us and users of our visuals."),
                                   img("",
                                       src = "https://media.glamour.com/photos/6274421e81bb7b6a215226a4/master/pass/0505-signs.png",
                                       height = "300px",
                                       width = "525px",
                                       style= "position:absolute; left: 200px;")

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
                             p(""),
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
