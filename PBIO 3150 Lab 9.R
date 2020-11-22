## Ailish Stein ##
## Lab 9 - Linear Regression ##
## 3/27/20 ##


## 1.1 ##

data(mtcars)
head(mtcars)
plot(mtcars)
summary(mtcars)
## 1.1 In class exercises ##
plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower", ylab = "Miles per gallon", main = "Horsepower of cars by miles per gallon")
carslm <- lm(mpg ~ hp, data = mtcars)
abline(carslm)

## 1.2 ##
shapiro.test(residuals(carslm))
qqnorm(residuals(carslm))
qqline(residuals(carslm))

plot(residuals(carslm) ~ mtcars$hp)
abline(h = 0)
abline(h = c(4, -4), col = "red", lty = 2)

plot(residuals(car.lm) ~ fitted(car.lm))
abline(h = 0)
abline(h = c(2, -2), col = "red", lty = 3)
abline(h = c(4, -4), col = "red", lty = 2)

## All four plots on the same screen ##
par(mfrow = c(2,2))
plot(carslm)

removeCars <- c("Maserati Bora", "Toyota Corolla", "Lotus Europa")
mtcars.2 <- mtcars[!rownames(mtcars) %in% removeCars, ]

## 1.2 In Class Exercise ##
plot(mtcars.2$hp,mtcars.2$mpg, xlab = "Horsepower", ylab = "Miles per Gallon", main = "Horsepower vs Miles per Gallon (Removed Models)", col = "red")
cars2lm <- lm(mpg ~ hp, data = mtcars.2)
abline(cars2lm)
summary(cars2lm)

qqnorm(residuals(cars2lm))
qqline(residuals(cars2lm))
shapiro.test(residuals(cars2lm))

plot(residuals(cars2lm) ~ mtcars.2$hp) 
abline(h = 0)
abline(h = c(2, -2), col = "red", lty = 2)

head(mtcars.2)    


## 1.3 Extracting information from the model object ##

coef(carslm)           ## carslm$coefficients
fitted(carslm)         ## carslm$fitted.values
residuals(carslm)      ## carslm$residuals
summary(carslm)[[4]]
summary(carslm)[[4]][, 4]

## 1.3 In Class Exercises ##
pollen <- read.csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter17/chap17q10HybridPollenSterility.csv")

plot(pollen$geneticDistance, pollen$proportionSterile, xlab = "Genetic Distance", ylab = "Proportion Sterile", main = "Genetic Distance in Relation to Sterile Population")
pollenlm <- lm(proportionSterile ~ geneticDistance, data = pollen)

qqnorm(residuals(pollenlm))
qqline(residuals(pollenlm))
shapiro.test(residuals(pollenlm))

plot(residuals(pollenlm) ~ pollen$geneticDistance) 
abline(h = 0)
abline(h = c(0.1, -0.1), col = "green", lty = 2)

## The transformation needed for the data is a square root transformation ##

pollent <- pollen %>%
  mutate(sqrt(proportionSterile))
pollent

## plot transformed data ## 
plot(pollent$geneticDistance ,pollent$`sqrt(proportionSterile)`)

## Run linear regression assumptions ##
pollentlm <- lm(sqrt(proportionSterile) ~ geneticDistance, data = pollent)
shapiro.test(residuals(pollentlm))
qqnorm(residuals(pollentlm))
qqline(residuals(pollentlm))

plot(residuals(pollentlm) ~ pollent$geneticDistance) 
abline(h = 0)
abline(h = c(0.1, -0.1), col = "green", lty = 2)


## 1.4 Exercise ##
## Lab Assignment ##
library(car)

data("Prestige")

plot(Prestige$prestige ~ Prestige$income)
preslm <- lm(prestige ~ income, data = Prestige)
qqnorm(residuals(preslm))
qqline(residuals(preslm))

shapiro.test(residuals(preslm))

plot(residuals(preslm) ~ Prestige$income) 
abline(h = 0)
abline(h = c(10, -10), col = "green", lty = 2)
abline(h = c(20, -20), col = "red", lty = 2)
plot(residuals(preslm) ~ fitted(preslm))
abline(h = 0)

## Normality and Equal Variance are violated ##
