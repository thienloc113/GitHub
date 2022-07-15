#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny);
library(markdown)


# Define UI for application that draws a histogram
shinyUI(navbarPage("DDP | WEEK 4 ASSIGNMENT",

    # Application title
    

    # Sidebar with a slider input for number of bins
        tabPanel("Plot",
                titlePanel("Internet User Around the world"),
            sidebarPanel(
            h3("Pick regions you want to plot"),
            checkboxGroupInput("regions", "Regions:", L_region),
            h3("Do you want color plot by regions?"),
            checkboxInput("color", "Color", value = F),
            h3("Filter country by population"),
            numericInput("min_pop", "Greater than", value = min(data$Population, na.rm = T)),
            numericInput("max_pop", "Less than", value = max(data$Population, na.rm = T))
                        ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Internet Users Around the World")
                )
        ),
        tabPanel("About", 
                 mainPanel(
                         includeMarkdown("about.Rmd")
                        )
                )
))
