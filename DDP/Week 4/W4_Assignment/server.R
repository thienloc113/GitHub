#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        library(tidyverse)
        library(ggplot2)
        data <- read.csv("data.csv")
        data$Population <- as.numeric(gsub(",","",data$Population))
        data$Internet.users <- as.numeric(gsub(",","",data$Internet.users))
        L_region <- distinct(data, Region)[, 1]
        
    output$plot1 <- renderPlot({
            data1 <- filter(data, Population > input$min_pop & Population <input$max_pop, Region %in% input$regions)
            if(input$color==0){
                    data1$Region <- "Nation"
            }
            ggplot(data = data1, aes(Internet.users, Population, colour = Region),xlim = c(0,10^7), ylim = c(0,10^7)) + geom_point(na.rm=T) + labs(color=NULL) 
    }, res = 96)

})
