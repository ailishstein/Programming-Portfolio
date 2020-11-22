## Ailish Stein ##
## PBIO 3150 ##
## Lab 12 ##
## April 15th 2020 ##

library(tidyr)
library(dplyr)
library(car)
library(nlme)
library(boot)
data("ToothGrowth")
head(ToothGrowth)

## In Class Exercise 1 ##
ToothGrowth$len <- as.numeric(ToothGrowth$len)
ToothGrowth$dose <- as.numeric(ToothGrowth$dose)
str(ToothGrowth)

interaction.plot(ToothGrowth$supp, ToothGrowth$dose, ToothGrowth$len)
interaction.plot(ToothGrowth$dose, ToothGrowth$supp, ToothGrowth$len)

## These two lines are exactly the same, just written a little different ##
tooth.lm <- lm(len ~supp + dose + supp:dose, data = ToothGrowth)
tooth.lm2 <- lm(len ~supp * dose, data = ToothGrowth)
tooth.lm
tooth.lm2

## Testing anova for the tooth data ##
anova(tooth.lm)

## In Class Exercise 2 - Testing Assumptions for Tooth Growth Linear Model ##

## Check Normality ##
plot(residuals(tooth.lm))
qqnorm(residuals(tooth.lm))
## Check residuals and fitted ##
plot(residuals(tooth.lm) ~ fitted(tooth.lm))
## Check Residuals and dose ##
plot(residuals(tooth.lm) ~ ToothGrowth$dose)
## Check residuals and supplement ##
plot(residuals(tooth.lm) ~ ToothGrowth$supp)

## 1.2 Linear models that combine numeric variables and factors ##
plantCO2 <- read.csv("C:/Users/19376/Documents/plantCO2.csv")
head(plantCO2)

str(plantCO2)
plot(x = plantCO2$treatment, y = plantCO2$seedWeight)
plant.lm1 <- lm(plant.size ~ treatment + seedWeight, data = plantCO2)
plant.lm2 <- lm(plant.size ~ treatment * seedWeight, data = plantCO2)
anova(plant.lm1, plant.lm2)
plant.lm3 <- lm(plant.size ~ seedWeight, data = plantCO2)
anova(plant.lm1, plant.lm3)
anova(plant.lm1)
summary(plant.lm1)

## In Class Exercise 4 ##
## Check the assumptions of our plants in elevated CO2 model ##
shapiro.test(residuals(plant.lm1))
plot(residuals(plant.lm1))
qqnorm(residuals(plant.lm1))
leveneTest(seedWeight ~ treatment, data = plantCO2)

## 1.3 Random Effects ##
zooDiv <- read.csv("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18e2ZooplanktonDepredation.csv")
zooModel <- lme(diversity ~ treatment, random = ~1 | block, data = zooDiv)
anova(zooModel)

## 1.3.1 Testing Assumptions ##
shapiro.test(residuals(zooModel))
plot(zooModel)
plot(residuals(zooModel) ~ zooDiv$treatment)

## In Class Exercise 5 ##
beetles <- read.csv("C:/Users/19376/Documents/beetles.csv")
head(beetles)
beetleModel <- lme(weight ~ genotype, random = ~1 | Block, data = beetles)
plot(residuals(beetleModel) ~ beetles$genotype, main = "Beetle Model vs Genotype", xlab = "Genotype", ylab = "Beetle Model", col = c("red", "green", "blue"))
## Testing Assumptions ##
shapiro.test(residuals(beetleModel))
plot(beetleModel)
## Running ANOVA ##
anova(beetleModel)
## p < .05, we reject the null, there is a significant difference in dry weight betweeen the three genotypes ##

## Lab Assignment ##
data("poisons")
## Plotting both of the x variables by y variable ##
plot(x = poisons$poison, y = poisons$time, xlab = "Poison Type", ylab = "Time", main = "Poison by Time")
plot(x = poisons$treat, y = poisons$time, xlab = "Treatment", ylab = "Time", main = "Treatment by Time")
## lm for treatment and original linear model ##
poison.lm1 <- lm(time ~ poison, data = poisons)
poison.lm1
poison.lm2 <- lm(time ~ poison + treat, data = poisons)
poison.lm2
## Testing the Assumptions ##
##Normality ##
shapiro.test(residuals(poison.lm1))
shapiro.test(residuals(poison.lm2))
## Both linear models were not normal ##
## lm1 - .001 ##
## lm2 - .003 ##
## Equal Variances ##
leveneTest(time ~ poison, data = poisons)
leveneTest(time ~ treat, data = poisons)
## poison - .021 ##
## treat - .0017 ##
## Linear model we are using (Random) ##
poisonModel <- lme(time ~ poison, random = ~1 | treat, data = poisons)
poisonModel
anova(poison.lm1, poison.lm2)

## Plotting the poison model, and the residuals agains the two explanatory variables ##
plot(poisonModel)
plot(residuals(poisonModel) ~ poisons$poison)
plot(residuals(poisonModel) ~ poisons$treat)
