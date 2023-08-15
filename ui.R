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
                                     states undoubtedly have varying political climates which can affect
                                     state regulations and policies on abortion access. It is important to understand
                                     the healthcare disparities that are created as a result because they can widen other
                                     socioeconomic gaps. With the provided dataset, we hope to answer the following questions:"),
                                   h4("1. How does each state vary in the driving times (hours) to the nearest abortion
                                     clinic at 12 weeks gestation?"),
                                   h4("2. How restrictive are individual states when providing abortion access at different
                                     stages of pregnancy?"),
                                   h4("3. What geographical patterns can be detected across the United States regarding average
                                      driving distances to alternate abortion clinics (if the nearest one is closed)?"),
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
                                     population (via 2015 data) were included. The dataset also does not include information on Vermont or West Virginia 
                                     When considering this data, these ethical questions and limitations must be considered by us and users of our visuals."),
                                   img("",
                                       src = "https://media.glamour.com/photos/6274421e81bb7b6a215226a4/master/pass/0505-signs.png",
                                       height = "300px",
                                       width = "525px",
                                       style = "display: block; margin: 0 auto;")
                                   
)

graph1_tab_panel <- tabPanel("Driving Distance by State (12 Weeks)",
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
                                 plotlyOutput(outputId = "clinics1_plotly")
                               )
                             ))

graph2_tab_panel <- tabPanel("Driving Distance by Gestation Stage",
                             h1("Average Driving Distance (hours) to Nearest Clinic at each Gestation Stage"),
                             p("This chart shows the average driving time to the nearest abortion clinic
                               at either 8, 12, 16, or 20 weeks gestation for the selected state. These stages
                               of pregnancy were chosen as the first two groups fall within the first trimester 
                               and the last two fall within the second trimester. The user can select the state
                               they wish to observe and see the average driving time in hours to the nearest clinic
                               at 4 different stages of gestation. This visual allows us to observe and analyze
                               the differences in abortion care accessibility not only by state, but at different
                               stages of pregnancy as well. For example, this can help us compare state policies,
                               and how restrictive abortion access is up to a certain number of weeks."),
                             sidebarLayout(
                               sidebarPanel(
                                 h2("State Selector"),
                                 selectInput(inputId = "state_select2",
                                             label = "Select State",
                                             choices = unique(pivot_df$state),
                                             selected = "Washington",
                                             multiple = FALSE)
                               ),
                               mainPanel(
                                 plotlyOutput(outputId = "clinics2_plotly")
                               )
                             ))

graph3_tab_panel <- tabPanel("Map of Average Driving Distance by Gestation",
                             p ("This map depicts the average driving distance (in hours) for each state if 
                                 the closest clinic happens to closed. Additionally, this map allows 
                                 the user select different pregnancy stages (8, 12, 16, and 20 weeks). This 
                                feature helps shows the additional geographical disparities of this topic as 
                                well as highlighting the problem of having enough available alternate clinics 
                                and abortion resources in certain locations in the United States."),
                             sidebarLayout(
                               sidebarPanel(
                                 selectInput("preg_stage_select", label = h3("Select Pregnancy Stage"), 
                                             choices = list("8 Weeks" = "avg_8_closed", "12 Weeks" = "avg_12_closed", 
                                                            "16 Weeks" = "avg_16_closed", "20 Weeks" = "avg_20_closed"), 
                                             selected = "avg_8_closed"),
                               ),
                               mainPanel(
                                 plotlyOutput(outputId = "clinics3_plotly")
                               )
                             )
)

conclusion_tab_panel <- tabPanel("Conclusion & Summary Takeaways",
                                 h1("Conclusion & Summary Takeaways"),
                                 h3("Takeaways"),
                                 p("1. The Average Driving Time to Nearest Clinic at 12 Weeks Gestation graph unveils insights into
                                   abortion clinic accessibility. Its interactive feature empowers users to explore state-driven 
                                   variations in driving times, revealing potential policy impacts on abortion access at a critical gestation stage. Beyond data 
                                   representation, it's a dynamic tool for drawing conclusions about reproductive healthcare complexities.
                                   This graph visually displays stark disparities in average driving times across diverse states, 
                                   highlighting regional accessibility gaps. For example, states like Arkansas, South Dakota, and Wyomings have an 
                                   average of 2+ hours of distance to the nearest abortion clinic that will provide care at 12 weeks. This is in 
                                   contrast to states California, Colorado, or Washington which have less than half an hour of driving to the nearest clinic.
                                   This accentuates the need to scrutinize policy frameworks and their real-world implications for clinic access. In 
                                   essence, the graph bridges policy decisions and individuals' healthcare experiences through data visualization. It 
                                   provides a platform to grasp the intricate landscape of abortion clinic accessibility, where geographic nuances and 
                                   state policies mold the realities of reproductive healthcare access."),
                                 p(""),
                                 p("2. The Distance by Gestation Stage graph intricately weaves geographic disparities and gestation stage variables, offering
                                   insight into abortion care accessibility. Focusing on state-specific driving distances, the graph can help evaluate policy 
                                   impact on reproductive healthcare access. The graph visually aligns geographical variations and reproductive stages, enabling
                                   analysis of accessibility variation between states and gestation periods. We could detect patterns between the different states
                                   and stages. One of the most obvious was the directly related relationship between gestation in weeks and driving time in hours:
                                   as one variable increased, so did the other. This gives us a look into the levels of abortion care that are more/less accessible.
                                   This nuanced exploration between state, gestation stage, and driving time can help us critically analyze not only where abortion
                                   care is accessible, but the varying degrees in which it is made available. We can use these observations to draw conclusions
                                   about disparities in where and how abortion care is regulated."),
                                 p(""),
                                 p("3. Takeaway 3 (map)")
                                 h3("Insights/What we learned"),
                                 p("The most important insight we gathered from this report comes from the disparities and inequalities that come as a result
                                   of differing state political climates and abortion access policies. We have explore how individual states and regions may
                                   have more/less access to critical reproductive healthcare. Healthcare inequalities can have devastating socioeconomic
                                   impacts that widen existing disparities in the United States. Overall, this project was an opportunity for us to explore and
                                   understand how impactful individual state policies and regulations on healthcare can be on accessibility and consider how 
                                   the disparities we investigated affects broader American society."),
                                 h3("Implications of our Data"),
                                 p("The insight that certain states experience driving times to abortion clinics exponentially higher than the 
                                   national average holds significant implications. This revelation sheds light on healthcare disparities, as 
                                   individuals in regions with limited clinic access face heightened challenges in seeking abortion care. This 
                                   emphasizes broader issues of healthcare equity and underscores the need for comprehensive policies that account 
                                   for socioeconomic factors and accessibility challenges. Additionally, it highlights the direct impact of state 
                                   policies on healthcare access,emphasizing the need for advocacy, awareness, and evidence-based policy reform. 
                                   This insight serves as a compelling example of the real-world consequences of restrictive policies on reproductive 
                                   rights and prompts discussions on addressing disparities and ensuring equitable access to critical healthcare 
                                   services.")
                                 
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
