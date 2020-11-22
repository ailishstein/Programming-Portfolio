## Final Exam ##


library(dplyr)
library(tidyr)
library(ggplot2)
library(multcomp) 
## Chapter 15 Question30 ##
crab <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter15/chap15q30FiddlerCrabFans.csv"))
crab <- crab[-85,]  #the last line comes in as a row of NA - this will remove that.
crab %>% group_by(crabType) %>%
  summarise(meanCrab = mean(bodyTemperature), sdCrab = SD(bodyTemperature), SECrab = sdCrab/sqrt(length(crab$crabType)))
## B ##
ggplot(data = crab, aes(x = crabType, y = bodyTemperature)) + geom_boxplot() + theme_classic() + xlab("Crab Type") + ylab("Body Temperature (Celsius)") + ggtitle("Body Temperature of Crab Types")

## C Assumptions ##
#Normality 
crab.lm <- lm(bodyTemperature ~ crabType, data = crab)
shapiro.test(residuals(crab.lm))
#p-value = 0.112, the data is normal because p-value > 0.05
#Equal variance 
library(car)
leveneTest(bodyTemperature ~ crabType, data = crab)
#pr(>F) = 0.9238, the data has equal variance because p-value is > 0.05
## Null: 

## ANOVA ##
anova(crab.lm)
## We reject the null, major claws do affect the body temperature of male crabs ##

## Post - Hoc Comparison ##
TukeyHSD(aov(bodyTemperature ~ crabType , data = crab))
crab.aov <- aov(bodyTemperature~ crabType,data=crab) 
crab.tukey <- glht(crab.aov, linfct=mcp(crabType="Tukey")) 
cld(crab.tukey)
## 
########################################################################################
## Chapter 17 Question 34 ##
## A ##
father <- read.csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q34FatherAgeMutations.csv")
head(father)
plot(father$AgeOfFather, father$numberOfNewMutations, xlab = "Father's Age", ylab = "Number of mutations", main = "Number of mutations based on father's age")
fatherlm <- lm(numberOfNewMutations ~ AgeOfFather, data = father)
abline(fatherlm)
fatherlm
## 15.209 + 1.583X = Y ##
15.209 + 1.583*35

## D ##
shapiro.test(residuals(fatherlm))
qqnorm(residuals(fatherlm))
qqline(residuals(fatherlm))

plot(residuals(fatherlm) ~ father$AgeOfFather)
abline(h = 0)
abline(h = c(4, -4), col = "red", lty = 2)

plot(residuals(fatherlm) ~ fitted(fatherlm))
abline(h = 0)
abline(h = c(, -2), col = "red", lty = 3)
abline(h = c(4, -4), col = "red", lty = 2)

leveneTest(residuals(fatherlm) ~ AgeOfFather, data = father)
str(father)
father$AgeOfFather <- as.factor(father$AgeOfFather)
father$AgeOfFather <- as.integer(father$AgeOfFather)
## The data does not pass either of the assumptions, normality or equal variance ##
anova(fatherlm)
1818.33/1
891.48/19
1818.33 + 46.92
1818.33/1865.25
## F ##
ggplot(data = father, aes(x = AgeOfFather, y = numberOfNewMutations)) + geom_point() + geom_abline(intercept = 15.209, slope = 1.583, linetype = "solid", size = 1) + theme_classic() + xlab("Father's Age") + ylab("New Mutations") + ggtitle("Father's Age by New Mutations")
## Chapter 18 Question 18 ##
sws <- read.csv(url("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter18/chap18q18OpsinExpression.csv"))

interaction.plot(sws$population, sws$waterClarity, sws$relativeExpressionOfSWS1, xlab = "Population in Different Habitats", ylab = "Relative Expression of SWS1", trace.label = "Water Clarity")
swslm <- lm(relativeExpressionOfSWS1 ~ population * waterClarity, data = sws)
Anova(swslm)
## Reject the null for population and water clarity ##
## Fail to reject the null for population by water clarity ##
