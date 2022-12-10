#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(plotly)
library(crosstalk)

data_one <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

df_newdata <- select(data_one, 1,2,8,20,38)

dataset <- df_newdata %>%
  filter(as.numeric(year) == 2018) %>%
  drop_na("co2","coal_co2", "gas_co2")


# Define server logic required to draw a histogram
server <- function(input, output) {
  output$selectCountry <- renderUI({
    selectInput("country", "Choose a country:", choices = unique(dataset$country))
  })
  
  linePlot <- reactive({
    plotData <- df_newdata %>%
      filter(country %in% input$country)
    
    ggplot(plotData, aes(x = year, y = !!as.symbol(input$variables))) +
      geom_line(aes(color = country)) +
      labs(x= "Year",
           y = input$variables,
           title = "Different Co2 types (Coal and Gas) over Different Generations",
           caption = "This is a line chart of 2018 countries that depicts the growth of each country of how much Co2 has been there.")+
     theme(plot.title = element_text(face="bold", size=16),
            axis.title = element_text(face="bold", size = 14),
            axis.text = element_text(size = 15))

  })
  
  output$countryPlot <- renderPlotly({
    linePlot()
  })
  output$variables <- renderText(input$variables)
}
