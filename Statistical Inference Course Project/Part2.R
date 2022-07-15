# Loading libraries
library(tidyverse)
library(ggplot2)
library(datasets)


data(ToothGrowth)
head(ToothGrowth)


# Exploratory Data Analysis


#Figures
ggplot(data=ToothGrowth, aes(x= supp, y = len,fill = supp)) +
      geom_boxplot() +
      facet_grid(.~dose) +
      ggtitle("Tooth Length by Dose (in milligrams/day) and Suplement Type")
#2. Provide a basic summary of the data
# Number of observations for each treatment/experiment. Total guinea pigs = 60:
table(ToothGrowth$supp, ToothGrowth$dose)
str(ToothGrowth)
summary(ToothGrowth)

#3. Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose
#The data contains: tooth length, supplement, and supplement dose for a group of guinea pigs. Presumably the data was not collected in a pairwise fashion. Performing T Test for each subset of data separated by dosages
# Assumptions
#Samples are both unpaired and unequal variances
# The sample population distribution is mound shaped and not skewed
d.5 <- filter(ToothGrowth, dose == 0.5)
d1 <- filter(ToothGrowth, dose == 1)
d2 <- filter(ToothGrowth, dose == 2)


# Test for dosage = 0.5
test.5 <- t.test(len ~ supp, paired = FALSE, var.equal = FALSE, data = d.5)

# Test for dosage = 1
test1 <- t.test(len ~ supp, paired = FALSE, var.equal = FALSE, data = d1)

# Test for dosage = 2
test2 <- t.test(len ~ supp, paired = FALSE, var.equal = FALSE, data = d2)



#Conclusion
# P-values are lower than 0.05 for dose 0.5 (test.5$p.value) and 1.0 (test.1$p.value) but greater than for 2.0 (test.2$p.value). We can say the supplements have
# different effects for dosages 0.5 and 1.0 but there is not enough evidence to prove so when the dosage is 2.0.