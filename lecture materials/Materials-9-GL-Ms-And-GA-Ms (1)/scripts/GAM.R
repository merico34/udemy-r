#####################################################################
########### ALL SCRIPTS FOR CH 10: SMOOTHERS AND GAMS ###############
#####################################################################

library(HSAUR3)
data(men1500m)

###########################################################################
###  LET'S FIRST DEPART FROM TEXT AND SHOW YOU SOME INSTRUCTIONAL POINTS ##
###########################################################################

## To see the effect of changing the proposition of points 
## that influence the smooth (f in command or Span for smooth in menu) 
## enter the following commands into the Script Window and submit them.
f1=lowess(men1500m$year,men1500m$time,f=0.2)
f2=lowess(men1500m$year,men1500m$time,f=0.3)
f3=lowess(men1500m$year,men1500m$time,f=0.4)
plot(men1500m$year,men1500m$time,
     xlab="year",ylab="time", 
     main="Men's 1000m Times",
     sub="black f=0.2, red f=0.3, 
     blue f=0.4, green ls")
lines(f1$x,f1$y,type="l")
lines(f2$x,f2$y,type="l",col="red")
lines(f3$x,f3$y,type="l",col="blue") 
abline(lm(men1500m$time~men1500m$year),
       col="green")

## Need package mgcv for function gam()
library("mgcv")
library("mboost")
library("rpart")

## To compare fits, enter the following commands 
## into the Script Window and submit them:
x=men1500m$year
f1=predict(lm(time~year,
              data=men1500m))
f2=predict(lm(time~poly(year,3),
              data=men1500m))
f3=lowess(men1500m$year,men1500m$time)
f3=f3$y
f4=lowess(men1500m$year,men1500m$time,f=0.25)
f4=f4$y
f5=predict(gam(time~s(year),data=men1500m))
plot(men1500m$year,men1500m$time,xlab="year",
     ylab="time",main="Men's 1000m Times", 
     sub="lm linear black, lm cubic brown, 
     lowess default green, 
     lowess f=0.25 blue, gam red")
lines(x,f1,type="l")
lines(x,f2,type="l",col="brown")
lines(x,f3,type="l",col="green")
lines(x,f4,type="l",col="blue") 
lines(x,f5,type="l",col="red")

###########################################################################
######## NOW LET'S FOLLOW THE TEXT FOR A WHILE  ###########################
###########################################################################

## OLYMPIC 1500m TIMES

## Here are the scripts in HSAUR3 Chapter 10:
library(HSAUR2)
data(men1500m)
plot(time ~ year, data=men1500m) # produces a scatterplot of year and winning time
## 1896 is an obvious outlier
## Let's predict future winning times 2008-2012 using both a linear and
## a quadratic model. Also, let's create a confidence interval
## First the linear model:
men1500m1900 <- subset(men1500m, year >= 1900)
men1500m_lm <- lm(time ~ year, data=men1500m1900)
## Produces a scatterplot of year and winning time with fitted values from a simple linear model:
plot(time ~ year, data=men1500m1900)
## Adds the regression line to the plot:
abline(men1500m_lm)

## Now the confidence interval on predicting winning times for 2008 and for 2012 from the linear model:
predict(men1500m_lm, newdata = data.frame(year = c(2008, 2012)), interval = "confidence")

## Now the quadratic linear model:
men1500m_lm2 <- lm(time ~ year +I(year^2), data=men1500m1900)
## Produces a scatterplot of year and winning time with fitted values from quadratic model:
plot(time ~ year, data=men1500m1900)
## Adds the quadratic line to the plot:
lines(men1500m1900$year, predict(men1500m_lm2))

## Now the confidence interval on predicting winning times for 2008 and for 2012 with the quadratic:
predict(men1500m_lm2, newdata = data.frame(year = c(2008, 2012)), interval = "confidence")

## Let's do an analysis of variance on the linear and quadratic models:
anova(men1500m_lm,men1500m_lm2, test="Chisq")

## There is a significant difference so we should prefer the quadratic model

## Create a scatterplot of year and winning time with fitted values
## from a smooth non-parametric model with both a lowess smoother and
## a cubic spline smoother:
x <- men1500m1900$year
y <- men1500m1900$time
men1500m_lowess <- lowess(x, y)
plot(time ~ year, data=men1500m1900)
## Add the lowess line to the plot:
lines(men1500m_lowess, lty=2)
## Estimate the cubic model:
men1500m_cubic <- gam(y ~ s(x, bs="cr"))
## Add the cubic smoothing line:
lines(x, predict(men1500m_cubic), lty=3)

## Not much difference between the lowess and the cubic spline smoother

## Let’s look at a scatterplot of year and winning time with
## fitted values from a quadratic model:
men1500m_lm2 <- lm(time ~ year + I(year^2), data=men1500m1900)
plot(time~year,data=men1500m1900)
lines(men1500m1900$year, predict(men1500m_lm2))

## Will need data set "kyphosis" in package "rpart"
data(kyphosis)
layout(matrix(1:3, nrow=1))
spineplot(Kyphosis~Age, data=kyphosis, ylevels=c("present","absent"))
spineplot(Kyphosis~Number, data=kyphosis, ylevels=c("present","absent"))
spineplot(Kyphosis~Start, data=kyphosis, ylevels=c("present","absent"))

## We want conditional probability of Kyphosis with this gam (which is a glm)
## Is a logistic additive model, so use family = binomial

## bs="cr" selects a cubic spline basis, 
## k selects the dimension of the basis (degree of smoothing).

## Will need to install and load package "rpart"
m1=gam(Kyphosis ~ s(Age,bs="cr")+ s(Number,bs="cr",k=3)+ s(Start,bs="cr",k=3), family=binomial, data=kyphosis); m1 
trans=function(x) binomial()$linkinv(x) 
layout(matrix(1:3,nrow=1)) 
plot(m1, select=1, shade=TRUE, trans=trans) 
plot(m1, select=2, shade=TRUE, trans=trans) 
plot(m1, select=3, shade=TRUE, trans=trans)

## Plots show the partial contributions of each 
# covariate to the conditional
## probability of kyphosis with confidence 
## bands so we reach same conclusions as 
## before: Risk of kyphosis is lower at : 
## (1) low and high children ages; 
## (2) lower number of vertebrae involved; and 
## (3) higher starting vertebrae

