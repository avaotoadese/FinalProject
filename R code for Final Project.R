install.packages("gtsummary", dependencies = TRUE)
install.packages("here")
install.packages("tidyverse")
ebola <-(here::here("data", "ebola.csv"))
ebola <- read.csv("data/ebola.csv")
                  
#create a table for ebola dataset using gtsummary
library(gtsummary)
tbl_summary(
  ebola,
  by = Country,
  include = c(Indicator, Date, value))

#create a regression for ebola dataset using gtsummary
tbl_uvregression(
  ebola, 
  y = value,
  include = c(Country, Indicator,
              Date, value),
  method = lm)

#create a log regression for ebola dataset using gtsummary
tbl_uvregression(
  ebola, 
  y = Country,
  include = c(Indicator, Date,
              value,
  method = glm,
  method.args = list(family = binomial()),
  exponentiate = TRUE))
#FIX this ^^

#create a figure (histogram)
#| label: fig-hist
#| fig-cap: "ebola count"
hist(ebola$value)

mean <- nrow(ebola)
stats <- list(n = nrow(ebola),
              mean_value = mean(ebola$value))
  