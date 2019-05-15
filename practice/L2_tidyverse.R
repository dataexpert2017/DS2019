####################
# Tidyverse 
# Dookyung Kim
# 2019-05-15
####################


#### I. data ---------------------------------------------

## package setup

# devtools::install_github("rstudio/EDAWR") 
library(EDAWR)

## read data
storms
cases
pollution

str(storms)

## subset

storms$storm 
storms$wind 
storms$pressure 
storms$date

cases$country 
names(cases)[-1] 
unlist(cases[1:3, 2:4])


pollution$city[c(1,3,5)]
pollution$amount[c(1,3,5)]
pollution$amount[c(2,4,6)]


## mutate

ratio <- storms$pressure / storms$wind
ratio

#### II. tidyr ---------------------------------------------

# install.packages("tidyr")
library(tidyr) 

?gather 
?spread


## gather

# for test in excel
write.csv(cases, "caese.csv")

# solution in R - super easy!!!!
gather(cases, "year", "n", 2:4)   


## spread

# for test in excel
write.csv(pollution, "pollution.csv")

# solution in R - super easy!!!!
spread(pollution, size, amount)  

## separate

separate(storms, date, c("year", "month", "day"), sep = "-")

## unite

storms2 <- separate(storms, date, c("year", "month", "day"), sep = "-")

unite(storms2, "date", year, month, day, sep = "-")


#### III. dplyr ---------------------------------------------

# install.packages("dplyr")
library(dplyr) 

?select 
?filter 
?arrange
?mutate 
?summarise 
?group_by


#install.packages("nycflights13")
library(nycflights13) 

?airlines 
?airports 
?flights
?planes 
?weather


## select()

select(storms, storm, pressure)
select(storms, -storm)
select(storms, wind:date)

select(storms, contains("wi"))
select(storms, date, everything())


## filter()

filter(storms, wind >= 50)

filter(storms, wind >= 50, 
       storm %in% c("Alberto", "Alex", "Allison"))


## mutate()

mutate(storms, ratio = pressure / wind)
mutate(storms, ratio = pressure / wind, inverse = ratio^-1)

mutate(storms, cum_wind = cumsum(wind))
mutate(storms, n = row_number())
mutate(storms, lag_wind = lag(wind))


## summarise()

pollution %>% summarise(median = median(amount), variance = var(amount))


## arrange()

arrange(storms, wind)
arrange(storms, desc(wind))
arrange(storms, wind, date)


## with pipe
select(storms, storm, pressure)
storms %>% select(storm, pressure)

filter(storms, wind >= 50)
storms %>% filter(wind >= 50)


storms %>% 
  filter(wind >= 50) %>%
  select(storm, pressure)

storms %>% 
  mutate(ratio = pressure / wind) %>%
  select(storm, ratio)


## group_by() + summarise()

pollution %>% group_by(city)


pollution %>% group_by(city) %>% 
  summarise(mean = mean(amount), sum = sum(amount), n = n())

pollution %>% group_by(city) %>%  summarise(mean = mean(amount))

pollution %>% group_by(size) %>%  summarise(mean = mean(amount))

pollution %>% ungroup()



