# GRAPHICS DAY 4 FUNDAMENTALS OF USING R IN-CLASS SCRIPTS

# Plots for single variables (p. 161)
# Histogram
hist(rpois(1000,1.7),main="",xlab="random numbers from a Poisson with mean 1.7")

hist(rpois(1000,1.7),breaks=seq(-0.5,9.5,1),main="",xlab="random numbers from a Poisson with mean 1.7")

# Time series plots (p. 167)
data(UKLungDeaths)
ts.plot(ldeaths,mdeaths,fdeaths,xlab="year",ylab="deaths",lty=c(1:3))

data(sunspots)
plot.ts(sunspots)

class(sunspots)
# [1] "ts"

is.ts(sunspots)
time(sunspots)
# [1] "ts"

# Pie charts
data<-read.csv("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/piedata.csv",header=TRUE)
data
pie(data$amounts,labels=as.character(data$names))

# The plot function (p. 136)
data1<-read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/scatter1.txt",header=TRUE)
head(data1)
attach(data1)
names(data1)
# [1] "xv" "ys"

plot(xv,ys,col="red")

plot(xv,ys,col="red",xlab="Explanatory variable", ylab="Response variable")

# Add regression line and more points
abline(lm(ys~xv))
data2 <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/scatter2.txt",header=TRUE)
attach(data2)
names(data2)
[1] "xv2" "ys2"

points(xv2,ys2,col="blue")
abline(lm(ys2~xv2))

# Fix by plotting all of the data with type="n"
plot(c(xv,xv2),c(ys,ys2),xlab="x",ylab="y",type="n")
points(xv,ys,col="red")
points(xv2,ys2,col="blue")
abline(lm(ys~xv))
abline(lm(ys2~xv2))

# Can determine axis values using range function (p. 138)
range(c(xv,xv2))
# [1] 0.02849861 99.93262000

range(c(ys,ys2))
# [1] 13.41794 62.59482

plot(c(xv,xv2),c(ys,ys2),xlim=c(0,100),ylim=c(0,80),xlab="x",ylab="y",type="n")
points(xv,ys,col="red")
points(xv2,ys2,col="blue")
abline(lm(ys~xv))
abline(lm(ys2~xv2))

# Can 'place' the legend on the plot
legend(locator(1),c("treatment","control"),pch=c(1,1),col=c(2,4))

# Full set of plotting characters (p. 139)
plot(0:10,0:10,type="n",xlab="",ylab="")
k <- -1
for(i in c(2,5,8)){
  for(j in 0:9){
  k <- k+1
  points(i,j,pch=k,cex=2)}}

# Identifying individuals in scatterplots (p. 141)
data <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/sleep.txt",header=T)
attach(data)
Subject <- factor(Subject)
plot(Days,Reaction,col=as.numeric(Subject),pch=as.numeric(Subject))

# Using a third variable to label a scatterplot (p. 141)
data <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/pgr.txt",header=T)
attach(data)
names(data)
# [1] "FR"  "hay" "pH"
plot(hay,pH)
text(hay,pH,labels=round(FR,2),pos=1,offset=0.5,cex=0.7)

# Show points with FR above median in red
plot(hay,pH,pch=16,col=ifelse(FR>median(FR),"red","black"))

# Adding text to scatterplots (p. 143)
# To add text '(b)' at location x=0.8 and y=45
# text(0.8,45,"(b)")

# Adding place names (p. 143)
map.places <- read.csv("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/map.places.csv",header=T)
attach(map.places)
names(map.places)
# [1] "wanted"
map.data <- read.csv("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/bowens.csv",header=T)
attach(map.data)
names(map.data)
# [1] "place" "east"  "north"
nn <- ifelse(north<60,north+100,north)
plot(c(20,100),c(60,110),type="n",xlab="",ylab="")
for(i in 1:length(wanted)){
ii <- which(place==as.character(wanted[i]))
text(east[ii],nn[ii],as.character(place[ii]),cex=0.6)}

# Drawing mathematical functions (p. 144)
curve(x^3-3*x,-2,2)
# More difficult approach using plot():
x <- seq(-2,2,0.01)
y <- x^3-3*x
plot(x,y,type="l")

# Plotting with a categorical explanatory variable (p. 154)
weather <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/SilwoodWeather.txt",header=T)
attach(weather)
names(weather)
# [1] "upper" "lower" "rain"  "month" "yr"
# Must declare month to be a factor (is numeric at this point):
month <- factor(month)
# Now we get a boxplot rather than a scatterplot:
plot(month,upper)
# To get informative labels:
plot(month,upper,ylab="daily maximum temperature",xlab="month")

# Boxplot uses same syntax but x variable is categorical
trial <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/compexpt.txt",header=T)
attach(trial)
names(trial)
# [1] "biomass"  "clipping"
plot(clipping,biomass,xlab="treatment",ylab="yield")

# Boxplots with notches to indicate significant differences (p. 156)
par(mfrow=c(1,2))
boxplot(biomass~clipping)
boxplot(biomass~clipping,notch=T)

# Barplot (p. 158)
means <- tapply(biomass,clipping,mean)
par(mfrow=c(1,1))
barplot(means,xlab="treatment",ylab="yield")

# Plots for multiple comparisons (p. 158)
data <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/box.txt",header=T)
attach(data)
names(data)
# [1] "fact"     "response"
plot(response~factor(fact))

# Order the factor levels
index <- order(tapply(response,fact,mean))
ordered <- factor(rep(index,rep(20,8)))
boxplot(response~ordered,notch=T,names=as.character(index),xlab="ranked treatments",ylab="response")

# Confidence levels for mean differences (p. 160)
model <- aov(response~factor(fact))
summary(model)
plot(TukeyHSD(model))                  

# Plots with multiple variables (p. 169)
ozonedata <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/ozone.data.txt",header=T)
attach(ozonedata)
names(ozonedata)

# [1] "rad"   "temp"  "wind"  "ozone"

pairs(ozonedata,panel=panel.smooth)

# The coplot function (p. 171)
coplot(ozone~wind|temp,panel=panel.smooth)

# Interaction plots (p. 172)
yields <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/splityield.txt",header=T)
attach(yields)
names(yields)

# [1] "yield" "block" "irrigation" "density" "fertilizer"

interaction.plot(fertilizer,irrigation,yield)

# Trellis Graphics
data <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/panels.txt",header=T)
attach(data)
names(data)

# [1] "age" "weight" "gender"

library(lattice)
xyplot(weight~age | gender)

data <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/daphnia.txt",header=T)
attach(data)
names(data)

# [1] "Growth.rate" "Water" "Detergent" "Daphnia"

library(lattice)
trellis.par.set(col.whitebg())
bwplot(Growth.rate ~ Water + Daphnia | Detergent)

# Design Plots (p. 176)
plot.design(Growth.rate ~ Water*Detergent*Daphnia)

plot.design(Growth.rate ~ Water*Detergent*Daphnia,fun="sd")

# Effect Sizes (p. 178)
install.packages("effects")
library(effects)
model <- lm(Growth.rate~Water*Detergent*Daphnia)

daph.effects <- allEffects(model)
plot(daph.effects,"Water:Detergent:Daphnia")

# Plots with many identical values (p. 180)


numbers <- read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/longdata.txt",header=T)
attach(numbers)
names(numbers)

# [1] "xlong" "ylong"

sunflowerplot(xlong,ylong)


