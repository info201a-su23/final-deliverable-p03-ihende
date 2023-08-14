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
                                     clinic at 12 weeks gestation?"),
                                   p("2. How restrictive are individual states when providing abortion access at different
                                     stages of pregnancy?"),
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

graph3_tab_panel <- tabPanel("Third graph",
                             h1("TO DO: Add another graph here.")
)

conclusion_tab_panel <- tabPanel("Conclusion & Summary Takeaways",
                             h1("Conclusion & Summary Takeaways"),
                              p("Takeaway 1"),
                              p("The graph titled Average Driving Time (hours) to Nearest Clinic at 12 Weeks Gestation offers
                                a comprehensive perspective that reveals nuanced insights into abortion clinic accessibility during
                                a critical gestation stage. Through its interactive feature allowing users to select multiple states
                                and explore variations in driving times, this visualization provides a rich platform for discerning
                                the potential impacts of state policies and regional distinctions on abortion access. This chart goes
                                beyond a mere representation of data; it becomes a dynamic tool for drawing meaningful conclusions and
                                fostering a deeper understanding of the intricate factors influencing reproductive healthcare access.
                                 
                                The visualization's effectiveness lies in its ability to visually convey the stark differences in average
                                driving times to the nearest abortion clinic at 12 weeks gestation across a diverse array of states. The
                                spectrum of driving times, spanning from relatively brief durations to significantly extended periods,
                                serves as a vivid indicator of the undeniable disparities in accessibility present across varying regions.
                                This observation emphasizes the necessity of not only analyzing the legal frameworks that underpin abortion
                                policies but also considering the real-world implications that these policies manifest in terms of actual clinic access times.
                                   
                                In essence, this takeaway encapsulates the core essence of the project—using data visualization to bridge
                                the gap between policy decisions and the on-the-ground experiences of individuals seeking reproductive healthcare.
                                By providing a platform to explore regional variations and their potential causes, the graph acts as a conduit for
                                understanding the multifaceted landscape of abortion clinic accessibility, where geographical nuances and state
                                policies converge to shape the realities of reproductive healthcare access."),
                              p("Takeaway 2"),
                              p("In summary, delving into the analysis of the Distance by Gestation Stage graph reveals an 
                                intricate tapestry of dynamics within the realm of abortion care accessibility—woven from the threads
                                of geographic disparities and the crucial variable of gestation stage. By delivering a focused examination of driving
                                distances to clinics through a state-specific lens, the graph emerges as a pivotal instrument for conducting a nuanced
                                evaluation of the far-reaching consequences of policy decisions on reproductive healthcare access. This multifaceted
                                insight taps into the very heart of the project's objectives, which center on unraveling the complexities of abortion
                                access and fostering a deeper understanding of the forces that shape it.
                                 
                                The graph's power lies in its capacity to provide a comprehensive visual panorama, allowing us to juxtapose geographical
                                variations and reproductive stages on a single canvas. This layered approach equips us with the means to scrutinize
                                not only how abortion care accessibility varies across states but also how it evolves within different gestation windows.
                                This nuanced exploration underscores the project's mission—to shed light on the interplay between policy choices and tangible
                                healthcare realities. The symbiotic relationship between policy decisions and accessibility becomes apparent, and this insight 
                                resonates with the project's overarching goal: to fuel informed and comprehensive policy dialogues that pave the way for equal
                                and prompt access to abortion services for all individuals.
                                   
                                Ultimately, the analysis echoes the clarion call for evidence-based, impactful interventions. By revealing the 
                                intricate dance of geographic and policy-related factors, the graph emboldens our resolve to address the inequalities
                                that shape reproductive healthcare access. It becomes clear that the journey toward a more equitable future in reproductive
                                healthcare necessitates informed discussions, collaborative efforts, and a steadfast commitment to bridging the gap between
                                policy intent and the lived experiences of those seeking abortion care."),
                              p("Takeaway 3"),
                              p(""),
                              p("Insights/what we learned"),
                              p("The most significant insight gleaned from our analysis is the stark disparity in
                                abortion clinic accessibility, with South Dakota standing out as a poignant example.
                                Our findings reveal a notable and concerning trend—South Dakota's average driving time
                                to the nearest clinic at 12 weeks gestation is over three times higher than the national
                                average for all states in the US. This revelation underscores the profound impact that state-level
                                policies and geographical context can have on reproductive healthcare access. 
                                 
                                This stark contrast in driving times serves as a powerful reminder of the intricate relationship
                                between policy decisions and practical healthcare realities. South Dakota's notably longer average
                                driving time points towards potential barriers that individuals in the state may face when seeking
                                timely abortion care. This disparity not only raises questions about the state's abortion regulations
                                and availability of services but also highlights the potential implications for individuals with limited
                                resources, those living in rural areas, and those who might be disproportionately affected by these access challenges.
                                 
                                The South Dakota example resonates deeply with the project's objectives, as it encapsulates the essence
                                of the study—examining the impact of political and geographical factors on reproductive healthcare accessibility.
                                This specific insight prompts further exploration into the reasons behind this significant disparity, delving into
                                the potential intersection of state regulations, clinic distribution, transportation infrastructure, and socioeconomic factors.
                                   
                                Ultimately, the revelation about South Dakota emphasizes the ongoing relevance of understanding these disparities,
                                especially in the context of an evolving political landscape and recent developments in reproductive rights. As we
                                continue to grapple with shifting policy landscapes and the potential impact on healthcare access, this insight
                                underscores the urgency of informed discussions and interventions to ensure equitable reproductive healthcare access
                                for all individuals, regardless of their geographic location."),
                              p("Implications of this project topic"),
                              p("The insight that South Dakota exhibits an average driving time to the nearest clinic at 12 weeks gestation over three
                                times higher than the national average holds significant implications. This revelation sheds light on healthcare disparities,
                                as individuals in regions with limited clinic access face heightened challenges in seeking abortion care. This underscores broader
                                issues of healthcare equity and underscores the need for comprehensive policies that account for socioeconomic factors and accessibility
                                challenges. Additionally, the South Dakota case underscores the direct impact of state policies on healthcare access, emphasizing the need
                                for advocacy, awareness, and evidence-based policy reform. This insight serves as a compelling example of the real-world consequences of 
                                restrictive policies on reproductive rights and prompts discussions on addressing disparities and ensuring equitable access to critical
                                healthcare services.")
                                 
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

