# Driving Times to Abortion Clinics in the U.S. - How Far is Too Far?
## INFO 201 "Foundational Skills for Data Science" — Summer 2023

Authors: Isabelle Henderson, Laila Gmerek, Joy Aoanan, & Chelsey Alcala

**Link: Link to your Shiny App here**


# Introduction

The data we are using for this project was used in The Pudding Essay - How far is too far? An analysis of driving times to abortion clinics in the US. in September 2017. The data set can be accessed here:

[https://github.com/the-pudding/data/blob/master/clinics/cities.csv](https://github.com/the-pudding/data/blob/master/clinics/cities.csv)

With the recent overturning of Roe v. Wade and increasing polarization of politics, the topic of abortion has become increasingly controversial. Individual states and/or regions undoubtedly have varying political climates which can affect state regulations and policies on abortion access. It is important to understand the healthcare disparities that are created as a result because they can widen other
socioeconomic gaps. With the provided dataset, we hope to answer the following questions:

1. How does each state vary in the driving times (hours) to the nearest abortion clinic at 12 weeks gestation?
2. How restrictive are individual states when providing abortion access at different stages of pregnancy?
3.  What geographical patterns can be detected across the United States regarding average driving distances to alternate abortion clinics (if the nearest one is closed)?

This data was collected by Russell Goldenberg and provides us with information on the driving time, in hours, to the nearest abortion clinic in varying locations. This data provides information on hundreds of counties across the U.S. It provides driving times, in hours, to the nearest abortion clinic that will provide abortion care at 8, 12, 16, and 20 weeks. This type of data can help us detect patterns across various locations regarding how accessible abortion is, making the dataset sufficient in answering our main questions.

However, there are ethical questions and limitations that we need to consider when using this data to answer such critical questions. For example, we must consider who collected this data. Everyone has implicit biases, and the individual identity of the data collectors can affect the methodology of collection and what data is/isn't included. Additionally, we must consider missing or inaccurate values. With an expansive dataset like this one, there are bound to be missing, inaccurate, or distorted values. As a matter of fact, the author of the dataset mentions that they were unable to get detailed timing information for two clinics. Additionally, for city-specific data, only cities with >50,000 population (via 2015 data) were included. When considering this data, these ethical questions and limitations must be considered by us and users of our visuals.

![Image](images/abortion.png)

# Conclusion / Summary Takeaways

**Takeaways**

1. The Average Driving Time to Nearest Clinic at 12 Weeks Gestation graph unveils insights into abortion clinic accessibility. Its interactive feature empowers users to explore state-driven variations in driving times, revealing potential policy impacts on abortion access at a critical gestation stage. Beyond data representation, it's a dynamic tool for drawing conclusions about reproductive healthcare complexities. This graph visually displays stark disparities in average driving times across diverse states, highlighting regional accessibility gaps. For example, states like Arkansas, South Dakota, and Wyomings have an average of 2+ hours of distance to the nearest abortion clinic that will provide care at 12 weeks. This is in contrast to states California, Colorado, or Washington which have less than half an hour of driving to the nearest clinic. This accentuates the need to scrutinize policy frameworks and their real-world implications for clinic access. In essence, the graph bridges policy decisions and individuals' healthcare experiences through data visualization. It provides a platform to grasp the intricate landscape of abortion clinic accessibility, where geographic nuances and state policies mold the realities of reproductive healthcare access.

2. The Distance by Gestation Stage graph intricately weaves geographic disparities and gestation stage variables, offering insight into abortion care accessibility. Focusing on state-specific driving distances, the graph can help evaluate policy impact on reproductive healthcare access. The graph visually aligns geographical variations and reproductive stages, enabling analysis of accessibility variation between states and gestation periods. We could detect patterns between the different states and stages. One of the most obvious was the directly related relationship between gestation in weeks and driving time in hours: as one variable increased, so did the other. This gives us a look into the levels of abortion care that are more/less accessible. This nuanced exploration between state, gestation stage, and driving time can help us critically analyze not only where abortion care is accessible, but the varying degrees in which it is made available. We can use these observations to draw conclusions about disparities in where and how abortion care is regulated.

3. Another aspect of abortion accessibility to consider is the fact that clinics sometimes close or shut down. In this case, the dataset accounted for that and provided data for each location and gestation stage in a situation where the nearest clinic is closed. We made a map to represent this data and show the average driving distance by state at each gestation stage. We found that the states with the longest driving times tend to be in the Midwest and are in more rural settings. Additionally, we can observe that driving times increase as gestation progresses. This can be corroborated by the previous two bar charts.

**Insights/What we learned**

The most important insight we gathered from this report comes from the disparities and inequalities that come as a result of differing state political climates and abortion access policies. We have explored how individual states and regions may have more/less access to critical reproductive healthcare. Healthcare inequalities can have devastating socioeconomic impacts that widen existing disparities in the United States. Overall, this project was an opportunity for us to explore and nderstand how impactful individual state policies and regulations on healthcare can be on accessibility and consider how the disparities we investigated affects broader American society.

**Implications**

The insight that certain states experience driving times to abortion clinics exponentially higher than the national average holds significant implications. This revelation sheds light on healthcare disparities, as individuals in regions with limited clinic access face heightened challenges in seeking abortion care. This emphasizes broader issues of healthcare equity and underscores the need for comprehensive policies that account for socioeconomic factors and accessibility challenges. Additionally, it highlights the direct impact of state policies on healthcare access,emphasizing the need for advocacy, awareness, and evidence-based policy reform. This insight serves as a compelling example of the real-world consequences of restrictive policies on reproductive rights and prompts discussions on addressing disparities and ensuring equitable access to critical healthcare services.