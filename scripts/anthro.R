library(anthro)
library(readr)
library(eeptools)
library(ggplot2)

setwd("~/r4ph23")

rm(list = ls())

anthro <- read_csv("data/anthro.csv")

anthout <- anthro %>%
  mutate(age = age_calc(dob, visit_date, units = "months")) %>%
  mutate(anthro_zscores(
    sex = sex,
    age = age,
    is_age_in_month = T,
    weight = wt,
    lenhei = ht,
    measure = "h"
  ))

anthro_zscores(sex = "M",
               age = 450,
               is_age_in_month = F,
               weight = 12,
               lenhei = 80,
               measure = "l")

anthout %>% 
  ggplot() +
  geom_density(aes(x = zwei)) +
  geom_function(fun = dnorm, 
                args = list(mean = 0,
                            sd = 1))

