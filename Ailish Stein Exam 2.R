library(ggplot2)
library(dplyr)
library(tidyr)
library(MVN)
salmon <- read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter13/chap13q20SalmonColor.csv"))
salmon
salmon %>%
  group_by(species) %>%
  summarise(meansalmon = mean(skinColor), sdsalmon = sd(skinColor), ssalmon = sdsalmon / sqrt(length(species)))
##sdsalmon <- sd(salmon$skinColor)
##n <- length(salmon$species)
##sdsalmon / sqrt(n)
##tibble(salmon)


ggplot(data=salmon,aes(x=species,y=skinColor))+
  geom_boxplot()+theme_bw()+
  xlab("Salmon Species")+
  ylab("Skin Color (on the spectrum)")+ ggtitle("Skin Color by Salmon Species")
boxplot(skinColor ~ species, data = salmon, xlab = "Salmon Species", ylab = "Skin Color")

sockeye <-subset(salmon, species=="sockeye")
kokanee <-subset(salmon, species=="kokanee")

shapiro.test(sockeye$skinColor)
shapiro.test(kokanee$skinColor)

var.test(sockeye$skinColor, kokanee$skinColor)

## our variances are not equal ##

t.test(skinColor~species, data=salmon, var.equal=FALSE)
mdiff <- mean(kokanee$skinColor)-mean(sockeye$skinColor)
mdiff

## Question 2 ##
seal <- read.csv(url("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter12/chap12q24WeddellSeals.csv"))
Feeding <-seal$oxygenUseFeeding
Nonfeeding <-seal$oxygenUseNonfeeding

sealmeandiff <- (sum(Feeding)-sum(Nonfeeding))/length(seal$individual)
sealmeandiff
seal$diff <- seal$oxygenUseFeeding - seal$oxygenUseNonfeeding
mean(seal$diff)

qqnorm(seal$diff)
qqline(seal$diff)
shapiro.test(seal$diff)

## The true mean difference between oxygen feeding and nonfeeding is 0.
t.test(seal$oxygenUseFeeding,seal$oxygenUseNonfeeding,paired = TRUE)
t.test(seal$diff)
## We reject the null, the true mean difference between feeding and nonfeeding dives is not 0 ##


## Question 3 ##

trillium <- read.csv(url("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter16/chap16q22TrilliumRecruitment.csv"))
head(trillium)
ggplot(data=trillium,aes(x=edgeDistance,y=recruitment))+ 
  geom_point()+theme_bw()+ 
  xlab("Edge Distance (m)")+ 
  ylab("Recruitment") + ggtitle("")

library(MVN)
mvn(trillium, mvnTest = "hz")


t.trillium <- mutate(trillium, edgeDistance_new = log(edgeDistance))
t.trillium

mvn(t.trillium)
## Yes the transformation worked ##
cor.test(t.trillium$edgeDistance_new, t.trillium$recruitment)

