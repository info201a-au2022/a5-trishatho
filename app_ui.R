#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(plotly)
#source("summary_page.R")

ui <-  navbarPage(theme = shinytheme("united"),
           "Co2 Emissions",
           tabPanel("Introduction",
                    h2("Trisha Thonupunoori, A5, December 9th, 2022"),
                    h2("Overview"),
                    #h3("Co2 has become a major issue in the world nowadays. I wil discuss country_highest_gas",`r country_highest_gas`),
                    h3("Nowadays, co2 has become a major concern and continues to be that way. So, I decided to focus this specific assignment on two specific c02 emissions called coal_co2 and gas_co2. These two variables will allow me to explore the highest_year_coal, lowest_year_gas, lowest_country_gas, country_highest_gas. To begin with, 2014 was the year when the coal emission was high. On the other hand, 1949 was the year when the gas emission was low. Secondly, from the filtered countries in 2018, there were a lot of countries like Andorra, Anguilla, etc., that had low gas emission rates. Lastly, the highest gas emission rates were the “World” country from the dataset. Next, the visualization tab will allow you to investigate more information about the growth/the rising trend of coal and gas emission!"),
                    tags$img(src = "https://images.unsplash.com/photo-1580120656760-c652daad203c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2971&q=80", height = "400", width = "800")
           ),
           tabPanel("Visualization",
                    titlePanel("Co2 Emission"),
                    
                    # Sidebar 
                    sidebarLayout(
                      sidebarPanel(
                        uiOutput("selectCountry"),
                        radioButtons("variables", "Select Y variables" , list("coal_co2", "gas_co2")),
                        tags$img(src = "https://images.unsplash.com/photo-1657571483974-3da174efbda3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2232&q=80", height = "425", width = "415"),
                        h5("Image references: https://unsplash.com/")
                        
                        ),
                      
                      
                      # Plot Distribution
                      mainPanel(
                        plotlyOutput("countryPlot"),
                        h4("This line chart visualization depicts the coal and gas emission growth of the countries (1750-2021) that have data in 2018, where the x representing the year and the y representing the coal and gas emissions. By exploring this chart and selecting a country from the drop down, it is visible that that there are lots of countries like Andorra, Angola, Anguilla, Antigua (etc.) that have the low growth in coal emissions because they have 0.000 in the graph. Now, regards to gas co2, the “World” country has the highest gas emission/growth which is not really safe. The minimum of gas emission has areas like Andorra, Anguilla, Bahamas (etc.) All these values calculated reveals that the countries with the lowest to average coal and gas emission is good for the environment and that they are in “good condition.” Not only that, but they also use cleaner emissions. This is good because they use natural fuels to create fuel. Another pattern that was obvious was that most countries have some what closer to 0% (stable) in the earlier times and increase through the modern generation. Overall, I chose to create a line chart that uses (ggplot and plotly that you can zoom through the year, plus hover over to get details about all information) for these variables to compare and pinpoint the growth of how much gas and coal emissions are being produced in different generations."),
                        )

                    )),
           
)

