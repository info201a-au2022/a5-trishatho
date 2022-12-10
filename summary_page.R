data_one <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

df_newdata <- select(data_one, 1,2,8,20,38)

dataset <- df_newdata %>%
  filter(as.numeric(year) == 2018) %>%
  drop_na("co2","coal_co2", "gas_co2")

library(tidyverse)
library(dplyr)

#1 Value
#Which year is the coal_co2 variable the highest? Ans: (2014)

highest_year_coal <- df_newdata %>%
  filter(coal_co2 == max(coal_co2, na.rm = TRUE)) %>%
   pull(year)

#Which year is the gas_co2 variable the lowest? Ans: (1949)
 lowest_year_gas <- df_newdata %>%
  filter(gas_co2 == min(coal_co2, na.rm = TRUE)) %>% 
   pull(year) %>%
   head(1)

 #2 Value
#From the countries that had data in 2018, which country had the lowest gas emissions? Ans: (Andorra, Anguilla, etc.)
country_lowest_gas <- dataset%>%
  filter(gas_co2 == min(gas_co2, na.rm = TRUE)) %>%
  pull(country)

#3 value

#From the countries that had data in 2018, which country had the highest gas emissions? Ans: (World - 7529.847)
country_highest_gas <- dataset%>%
  filter(gas_co2 == max(gas_co2, na.rm = TRUE)) %>%
  pull(country)



