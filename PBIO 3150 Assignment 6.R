## Ailish Stein ##
## PBIO 3150 ##
## Assignment 6 ##
## 04/16/20 ##

library(tidyr)
library(car)
library(dplyr)
library(multcomp)
library(dunn.test)
library(nlme)
## Chapter 15 Q32 ##
volume <- read.csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q32HippocampalVolumeRatio.csv")
head(volume)
## a. Make a graph ##
## boxplot ##
plot(volume$group, volume$hippoVolumeRatio, xlab = ("Group"), ylab = ("Volume Ratio"), main = ("Test Group by Volume Ratio"))
volume.lm <- lm(hippoVolumeRatio ~ group, data = volume)

## b. Assumptions ##
shapiro.test(residuals(volume.lm))
leveneTest(volume.lm)

## c. Run ANOVA ##
volume.var <- volume %>%
  group_by(group) %>%
  summarise(hippoVar = var(hippoVolumeRatio))
volume.var
289 / 61.7 ## There is a 4.68 fold difference ##

## d. ##
kruskal.test(hippoVolumeRatio ~ group, data = volume)

## e. ##

dunn.test(volume$hippoVolumeRatio, volume$group, method = "bonferroni", list = TRUE)

volume.aov <- aov(hippoVolumeRatio~group,data=volume)
volume.tukey <- glht(volume.aov, linfct=mcp(group="Tukey"))
cld(volume.tukey)

###############################################################################################
## Chapter 15 Q22 ##

sticks <-read.csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q22WalkingStickHeads.csv")
head(sticks)

## a. Calculate the variance within groups ##
stickModel <- lme(headwidth ~ specimen, random = ~ 1 | specimen, data = sticks)
VarCorr(stickModel)
## The variance for within groups is 0.00025 ##
## b. What is the variance between groups for head width ##
## The variance for between groups is 0.000166 ##
## c. Calculate repeatability ##
0.0002489666 / (0.0002489666 + 0.000166)
1-0.6
## We have 40% measurement error ##
## d. What does repeatability measure ##
#### In word doc ##
## e. Which measurement has the greater measurement error ##
0.00105 / (0.00105+0.000356) ## From textbook ##
1 - 0.75
## We have 25% measurement error ##

## Chapter 14 Q18 ##
## N = 64 ##
## SD = .159 ##
## ME = 0.0565 ##
8*((0.159/0.0565)^2)
