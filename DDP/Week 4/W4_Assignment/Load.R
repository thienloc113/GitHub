library(tidyverse)
data <- read.csv("C:/Users/ASUS/Documents/GitHub/DDP/Week 4/W4_Assignment/worldwide internet users - users.csv")
L_region <- distinct(data, Region)[, 1]
data
