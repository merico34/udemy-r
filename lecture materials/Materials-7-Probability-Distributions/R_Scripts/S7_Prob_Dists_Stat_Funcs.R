#########################################
#####   Probability Distributions   #####
#####     and Statistical Models    #####
#########################################

### Probability Distributions

# R provides a comprehensive set of statistical tables. 
# Functions are provided to evaluate the cumulative 
# distribution function P(X <= x), the probability 
# density function and the quantile function 
# (given q, the smallest x such that P(X <= x) > q), 
# and to simulate from the distribution. 

#   Distribution   R name   additional arguments
#   ------------   ------   --------------------
#   beta           beta     shape1, shape2, ncp 
#   binomial       binom    size, prob 
#   Cauchy         cauchy   location, scale 
#   chi-squared    chisq    df, ncp 
#   exponential    exp      rate 
#   F              f        df1, df2, ncp 
#   gamma          gamma    shape, scale 
#   geometric      geom     prob 
#   hypergeometric hyper    m, n, k 
#   log-normal     lnorm    meanlog, sdlog 
#   logistic       logis    location, scale 
#   negative       binomial nbinom size, prob 
#   normal         norm     mean, sd 
#   Poisson        pois     lambda 
#   signed         rank     signrank n 
#   Student's t    t        df, ncp 
#   uniform        unif     min, max 
#   Weibull        weibull  shape, scale 
#   Wilcoxon       wilcox   m, n 

# Prefix the name given here by 'd' for the 
# density, 'p' for the CDF, 'q' for the quantile
# function and 'r' for simulation (random deviates). 

# For every distribution there are four commands. 
# The commands for each distribution are prepended
# with a letter to indicate the functionality:

# "d" returns the height of the probability density function 
# "p" returns the cumulative density function 
# "q" returns the inverse cumulative density function (quantiles) 
# "r" returns randomly generated numbers 

# We look at the normal distribution
help(Normal)

# we first look at dnorm. Given a set of values 
# it returns the height of the probability 
# distribution at each point. 

# If you only give the points it assumes you
# want to use a mean of zero and standard 
# deviation of one. Also can use different
# values for the mean and standard deviation:
  
dnorm(0)
# [1] 0.3989423
dnorm(0)*sqrt(2*pi)
# [1] 1
dnorm(0,mean=4)
# [1] 0.0001338302
dnorm(0,mean=4,sd=10)
# [1] 0.03682701
v <- c(0,1,2)
dnorm(v)
# [1] 0.39894228 0.24197072 0.05399097
x1 <- seq(-20,20,by=.1);x1
x2 <- seq(-4,4,by=.02);x2
# dnorm(x1) assumes mean=0 and sd=1
dnorm(x1)
y1 <- dnorm(x1);y1
# dnorm(x2) assumes mean=0 and sd=1
y2 <- dnorm(x2);y2
plot(x1,y1)
# should "look" normal with mean=0, sd=1
plot(x2,y2)
# plot with mean=4.5 and sd=5
y3 <- dnorm(x1,mean=4.5,sd=6);y3
plot(x1,y3)

# Let's look at pnorm...Given a number 
# or a list it computes the probability
# that a normally distributed random 
# number will be less than that number. 

# This function also goes by the title
# "Cumulative Distribution Function." 

# It accepts the same options as dnorm:
pnorm(0)
# [1] 0.5
pnorm(1)
# [1] 0.8413447
pnorm(0,mean=2)
# [1] 0.02275013
pnorm(0,mean=2,sd=3)
# [1] 0.2524925
v <- c(0,1,2);v
pnorm(v)
# [1] 0.5000000 0.8413447 0.9772499
x1 <- seq(-4,4,by=.02);x1
x2 <- seq(-20,20,by=.1);x2
y1 <- pnorm(x1,sd=1);y1
y2 <- pnorm(x1,sd=1.5);y2
y3 <- pnorm(x1,sd=2);y3
# successively gets "flatter"
plot(x1,y1)
plot(x1,y2)
plot(x1,y3)
y4 <- pnorm(x2,mean=-3,sd=4);y4
y5 <- pnorm(x2,mean=0,sd=4);y5
y6 <- pnorm(x2,mean=3,sd=4);y6
# successively shifts to the right
plot(x2,y4)
plot(x2,y5)
plot(x2,y6)

# Others: Converting t-values to p-values
# 2-tailed p-value for t distribution
2*pt(-2.43, df = 13)

### Examining the distribution of a set of data
# Given a (univariate) set of data we can examine 
# its distribution in a large number of ways. 

# The simplest is to examine the numbers. 
# Two slightly different summaries are given
# by summary() and fivenum() and a display 
# of the numbers by stem ("stem and leaf" plot).  

# attach faithful data
attach(faithful)
str(faithful)
dim(faithful)
head(faithful)
summary(eruptions)
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  1.600   2.163   4.000   3.488   4.454   5.100

# Tukey's five number summary (minimum, lower-hinge,
# median, upper-hinge, maximum) for the input data:
fivenum(eruptions)
# [1] 1.6000 2.1585 4.0000 4.4585 5.1000

# stem-and-leaf plot
stem(eruptions)

# A stem-and-leaf plot is like a histogram:
hist(eruptions)
## make the bins smaller, make a plot of density
hist(eruptions, seq(1.6, 5.2, 0.2), prob=TRUE)
lines(density(eruptions, bw=0.1))
rug(eruptions) # show the actual data points

# We can plot the empirical cumulative distribution
# function by using the function ecdf.   
plot(ecdf(eruptions), 
     do.points=FALSE, 
     verticals=TRUE)

# This distribution is obviously far from 
# any standard distribution. How about the 
# right-hand mode, say eruptions of longer 
# than 3 minutes? Let us fit a normal 
# distribution and overlay the fitted CDF. 
long <- eruptions[eruptions > 3]
length(long)
plot(ecdf(long), 
     do.points=FALSE, 
     verticals=TRUE)
x <- seq(3, 5.4, 0.01)
lines(x, pnorm(x, mean=mean(long), 
               sd=sqrt(var(long))), lty=3)

# Quantile-quantile (Q-Q) plots can help us 
# examine this more carefully.    

# arrange for a square figure region
par(pty="s")
qqnorm(long) 
qqline(long)

# which shows a reasonable fit but a 
# shorter right tail than one would 
# expect from a normal distribution. 

# Let us compare this with some simulated 
# data from a t distribution:
x <- rt(250, df = 5)
qqnorm(x); qqline(x)

# which will usually (with a random sample) 
# show longer tails than expected for a normal.

# We can make a Q-Q plot against the generating
# distribution by 
qqplot(qt(ppoints(250), df = 5), x, 
       xlab = "Q-Q plot for t dsn")
qqline(x)

# Finally, we might want a more formal test of 
# agreement with normality (or not). R provides 
# the Shapiro-Wilk test   
shapiro.test(long)

#Shapiro-Wilk normality test

#data:  long
#W = 0.9793, p-value = 0.01052

### One and Two-Sample Tests
# So far we have compared a single sample
# to a normal distribution. A much more 
# common operation is to compare aspects
# of two samples. 

# Note that in R, all "classical" tests
# including the ones used below are in 
# package stats which is normally loaded. 

# Consider the following sets of data on
# the latent heat of the fusion of ice (cal/gm)
# from Rice (1995, p.490) 

# Method A: 79.98 80.04 80.02 80.04 80.03 80.03 80.04 79.97
# 80.05 80.03 80.02 80.00 80.02
# Method B: 80.02 79.94 79.98 79.97 79.97 80.03 79.95 79.97

# Boxplots provide a simple graphical 
# comparison of the two samples. 

A <- c(79.98, 80.04, 80.02, 80.04, 80.03,
       80.03, 80.04, 79.97, 80.05, 80.03,
       80.02, 80.00, 80.02)

B <- c(80.02, 79.94, 79.98, 79.97, 79.97,
       80.03, 79.95, 79.97)

boxplot(A, B)

# which shows that the first group tends to
# give higher results than the second.

# To test for the equality of the means 
# of the two examples, we can use an 
# unpaired t-test by   
t.test(A, B)

# which which does indicate a significant 
# difference, assuming normality. 

# By default the R function does not 
# assume equality of variances in the 
# two samples. 

# We can use the F test to test for 
# equality in the variances, provided 
# that the samples are from normal populations. 
var.test(A, B)

# which shows no evidence of a significant
# difference, and so we can use the classical
# t-test that assumes equality of the variances. 
t.test(A, B, var.equal=TRUE)

# All these tests assume normality of the
# two samples. The two-sample Wilcoxon 
# (or Mann-Whitney) test only assumes a 
# common continuous distribution under 
# the null hypothesis. 
wilcox.test(A, B)

# Note the warning: there are several 
# ties in each sample, which suggests 
# that these data are from a discrete 
# distribution (probably due to rounding). 

# There are several ways to compare graphically
# the two samples. We have already seen a pair 
# of boxplots. The following 
plot(ecdf(A), 
     do.points=FALSE, 
     verticals=TRUE, 
     xlim=range(A, B))
plot(ecdf(B), 
     do.points=FALSE, 
     verticals=TRUE, 
     add=TRUE)

# will show the two empirical CDFs, and qqplot
# will perform a Q-Q plot of the two samples.

### Defining Statistical Models; formulae

# Template is a linear regression model with
# independent, homoscedastic errors

# y_i = sum_{j=0}^p beta_j x_{ij} + e_i,     i = 1, ., n,

# where the e_i are NID(0,sigma^2).

# In matrix terms:

# y = X beta + e

# where y is the response vector, X is the model
# matrix or design matrix and has columns
# x_0, x+1,...x_p, the determining variables.

# Often x_0 will be a column of ones defining 
# an intercept term.

### Examples

# Suppose y, x, x0, x1, x2 are numeric variables,
# x is a matrix and A, B, C ... are factors. The
# following formulae on the left side below
# specify statistical models as described on right.

# y ~ x
# y ~ 1 + x

#   Both imply the same simple linear regression 
#   model of y on x. The first has an implicit 
#   intercept term, and the second an explicit one. 

# y ~ 0 + x
# y ~ -1 + xy ~ x - 1

#   Simple linear regression of y on x through 
#   the origin (that is, without an intercept term). 

# log(y) ~ x1 + x2

#   Multiple regression of the transformed variable, 
#   log(y), on x1 and x2 (with an implicit intercept term). 

# y ~ poly(x,2)y ~ 1 + x + I(x^2)

#   Polynomial regression of y on x of degree 2. 
#   The first form uses orthogonal polynomials, 
#   and the second uses explicit powers, as basis. 

# y ~ X + poly(x,2)

#   Multiple regression y with model matrix 
#   consisting of the matrix X as well as polynomial 
#   terms in x to degree 2. 

# y ~ A

#   Single classification analysis of variance model
#   of y, with classes determined by A. 

# y ~ A + x

#   Single classification analysis of covariance 
#   model of y, with classes determined by A, and
#   with covariate x. 

# y ~ A*B
# y ~ A + B + A:B
# y ~ B %in% A
# y ~ A/B

#   Two factor non-additive model of y on A and B. 
#   The first two specify the same crossed 
#   classification and the second two specify 
#   the same nested classification. 

#   In abstract terms all four specify
#   the same model subspace. 

# y ~ (A + B + C)^2y ~ A*B*C - A:B:C

#   Three factor experiment but with a model
#   containing main effects and two factor 
#   interactions only. Both formulae specify
#   the same model. 

# y ~ A * xy ~ A/xy ~ A/(1 + x) - 1

#   Separate simple linear regression models
#   of y on x within the levels of A, with 
#   different codings. The last form produces
#   explicit estimates of as many different 
#   intercepts and slopes as there are levels in A. 

# y ~ A*B + Error(C)

#   An experiment with two treatment factors,
#   A and B, and error strata determined by 
#   factor C. For example a split plot experiment, 
#   with whole plots (and hence also subplots), 
#   determined by factor C.

# The operator ~ is used to define a model 
# formula in R. The form, for an ordinary
# linear model, is 

#   response ~ op_1 term_1 op_2 term_2 op_3 term_3 .

# where 

# response 

#   is a vector or matrix, (or expression evaluating
#   to a vector or matrix) defining the response variable(s). 

# op_i 

#   is an operator, either + or -, implying the
#   inclusion or exclusion of a term in the model,
#   (the first is optional). 

# term_i

#   is either 

#     . a vector or matrix expression, or 1, 
#     . a factor, or 
#     . a formula expression consisting of 
#       factors, vectors or matrices connected
#       by formula operators. 

#   In all cases each term defines a collection
#   of columns either to be added to or removed
#   from the model matrix. A 1 stands for an 
#   intercept column and is by default included
#   in the model matrix unless explicitly removed. 

# The formula operators are similar in effect to
# the Wilkinson and Rogers notation used by such 
# programs as Glim and Genstat. One inevitable change
# is that the operator '.' becomes ':' since the 
# period is a valid name character in R. 

# The notation is summarized below (based on Chambers & Hastie, 1992, p.29): 
# Y ~ M
#   Y is modeled as M. 

# M_1 + M_2
#   Include M_1 and M_2.

# M_1 - M_2
#   Include M_1 leaving out terms of M_2.

# M_1 : M_2
#   The tensor product of M_1 and M_2. 
#   If both terms are factors, then 
#   the "subclasses" factor. 

# M_1 %in% M_2
#   Similar to M_1:M_2, but with a different coding. 

# M_1 * M_2
#   M_1 + M_2 + M_1:M_2. 

# M_1 / M_2
#   M_1 + M_2 %in% M_1. 

# M^n
#   All terms in M together with "interactions"
#   up to order n 

# I(M)
#   Insulate M. Inside M all operators have
#   their normal arithmetic meaning, and
#   that term appears in the model matrix. 

# Note that inside the parentheses that 
# usually enclose function arguments all 
# operators have their normal arithmetic 
# meaning. The function I() is an identity
# function used to allow terms in model 
# formulae to be defined using arithmetic
# operators. 

# Note particularly that the model formulae
# specify the columns of the model matrix, 
# the specification of the parameters being
# implicit. This is not the case in other 
# contexts, for example in specifying 
# nonlinear models. 

### Linear Models

# The basic function for fitting ordinary 
# multiple models is lm(), and a streamlined 
# version of the call is as follows:  

#   fitted.model <- lm(formula, data = data.frame)

# For example 

#   fm2 <- lm(y ~ x1 + x2, data = production)

# would fit a multiple regression model 
# of y on x1 and x2 (with implicit intercept term). 

### Generic Functions for Extracting Model Information

# The value of lm() is a fitted model object; 
# technically a list of results of class "lm". 
# Information about the fitted model can then
# be displayed, extracted, plotted and so on
# by using generic functions that orient 
# themselves to objects of class "lm". 

# These include 

#    add1    deviance   formula      predict  step
#    alias   drop1      kappa        print    summary
#    anova   effects    labels       proj     vcov
#    coef    family     plot         residuals

# A brief description of the most commonly used
# ones is given below.

# anova(object_1, object_2)
#   Compare a submodel with an outer model
#   and produce an analysis of variance table. 

# coef(object)
#   Extract the regression coefficient (matrix). 

#   Long form: coefficients(object). 

# deviance(object)
#   Residual sum of squares, weighted if appropriate. 

# formula(object)
#   Extract the model formula. 

# plot(object)
#   Produce four plots, showing residuals,
#   fitted values and some diagnostics. 

# predict(object, newdata=data.frame)
#   The data frame supplied must have 
#   variables specified with the same labels as the original. 
#   The value is a vector or matrix of predicted values
#   corresponding to the determining variable values in data.frame. 

# print(object)
#   Print a concise version of the object. 
#   Most often used implicitly. 

# residuals(object)
#   Extract the (matrix of) residuals,
#   weighted as appropriate. 

#   Short form: resid(object). 

# step(object)
#   Select a suitable model by adding or
#   dropping terms and preserving hierarchies.
#   The model with the smallest value of AIC
#   (Akaike's An Information Criterion) 
#   discovered in the stepwise search is
#   returned. 

# summary(object)
#   Print a comprehensive summary of the
#   results of the regression analysis. 

# vcov(object)
#   Returns the variance-covariance
#   matrix of the main parameters of 
#   a fitted model object.

### Analysis of Variance and model comparison






















