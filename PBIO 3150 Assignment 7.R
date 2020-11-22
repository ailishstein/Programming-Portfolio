## Assignment 7 ##
## Ailish Stein ##
## April 21st 2020 ##
library(dplyr)
library(tidyr)
library(car)
plants <- read.csv("C:/Users/19376/Documents/DataS1.csv")
plant <- plants %>%
  select(Season, Treatment, PlantBiomass, NativeRich, pH)

## Part a ##

plant1 <- plant[(plant$Treatment == "native") & (plant$Season == "green-up"),]
plant1
## Graph ##
plot(plant1$pH, plant1$PlantBiomass, xlab = "Soil Ph", ylab = "Plant Biomass", main = "Soil Ph Correlation to Total Plant Biomass")

## Checking Assumptions ## 
## Normality ##
qqnorm(residuals(plant.lm))
qqline(residuals(plant.lm))
plant.lm <- lm(PlantBiomass ~ pH, data = plant1)
plant.lm
shapiro.test(residuals(plant.lm))
## The data is not normal ##
## Variances ##
str(plant)
plant1$pH <- as.factor(plant1$pH)
leveneTest(PlantBiomass ~ pH, data = plant1)
## Our variances are not equal ##

## Statistical Test ## 
Anova(plant.lm)

## Part b ##

## Plot Data ##
plot(plant$Treatment, plant$NativeRich, xlab = "Treatment", ylab = "Native Species Richness", main = "Treatment on Native Species Richness", )

## Checking Assumptions ##
## Normality ##
plant.lm2 <- lm(NativeRich ~ Treatment, data = plant)
shapiro.test(residuals(plant.lm2))
## Data is not normal ##
## Variance ## 
leveneTest(NativeRich ~ Treatment, data = plant)
## Data has equal variance ##

## Statistical Test ##
kruskal.test(NativeRich ~ Treatment, data = plant)

## Part C ##

plant.lm3 <- lm(PlantBiomass ~ Treatment * Season, data = plant)
plant.lm3

## Plot Data ##
plot(residuals(plant.lm3))
## Checking Assumptions ## 
## Normality ##
qqnorm(residuals(plant.lm3))
qqline(residuals(plant.lm3))
shapiro.test(residuals(plant.lm3))
## The data is not normal ##
leveneTest(plant.lm3)
## Variances are not equal ##

plant$Treatment <- as.integer(plant$Treatment)
plant$Season <- as.integer(plant$Season)
str(plant)
biomass.var <- plant %>% group_by(Treatment * Season) %>% summarise(biomassVar = var(PlantBiomass, na.rm = TRUE))
biomass.var
37867/6369
## We can ignore the unequal variances because our fold difference is less than 10 ##

#Anova
anova(plant.lm3)

