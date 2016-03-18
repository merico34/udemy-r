#########################################
##### Defining Statistical Models  #####
#####           Formulae           #####
#########################################

### Defining Statistical Models; formulae

# Template is a linear regression model with
# independent, homoscediastic errors

# y_i = sum_{j=0}^p beta_j x_{ij} + e_i, i = 1, . . ., n,

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
# y ~ -1 + x
# y ~ x - 1

#   Simple linear regression of y on x through 
#   the origin (that is, without an intercept term). 

# log(y) ~ x1 + x2

#   Multiple regression of the transformed variable, 
#   log(y), on x1 and x2 (with an implicit intercept term). 

# y ~ poly(x,2)
# y ~ 1 + x + I(x^2)

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

# y ~ (A + B + C)^2
# y ~ A*B*C - A:B:C

#   Three factor experiment but with a model
#   containing main effects and two factor 
#   interactions only. Both formulae specify
#   the same model. 

# y ~ A * x
# y ~ A/x
# y ~ A/(1 + x) - 1

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
# M_1 + M_2 %in% M_1. 

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

### Analysis of Variance and model comparison

### ANOVA TABLES

# Note that you can compare two fitted models
# directly if one (or more) is nested within
# the other(s)

# This approach can be seen as a more handy
# alternative to the default full ANOVA table
# by comparing two or more models directly 
# using the anova() function.  

# anova(fitted.model.1, fitted.model.2, .)

# The display is then an ANOVA table showing
# the differences between the fitted models 
# when fitted in sequence.

### UPDATING MODELS

# The update() function is largely a convenience
# function that allows a model to be fitted 
# that differs from one previously fitted by
# just a few additional or removed terms. 

# The form is:

# new.model <- update(old.model, new.formula)

# In the new.formula the special name consisting 
# of a period, '.',  only, can be used to stand
# for "the corresponding part of the old model formula". 

# fm05 <- lm(y ~ x1 + x2 + x3 + x4 + x5, data = production)
# fm6  <- update(fm05, . ~ . + x6)
# smf6 <- update(fm6, sqrt(.) ~ .)

# would (1) fit a five variate multiple regression 
# with variables (presumably) from the data 
# frame production: 

# fm05 <- lm(y ~ x1 + x2 + x3 + x4 + x5, data = production)

# (2) fit an additional model with
# a sixth regressor variable:

# fm6  <- update(fm05, . ~ . + x6)

# and (3) fit a variant on the model
# where the response had a square root
# transform applied:

# smf6 <- update(fm6, sqrt(.) ~ .)

# Onene could compare the first two nested
# models like this:
# anova(fm05, fm6)

# Note especially that if the data= argument is 
# specified on the original call to the model 
# fitting function, this information is passed
# on to the fitted model object using update(). 

#### ANALYSIS OF VARIANCE

# Weight Gain in Rats
# The data is available in the data.frame 
# weightgain. The following R code produces
# the required summary statistics
data("weightgain", package = "HSAUR3")

# take a look:
View(weightgain)

# Tabular analyses:
tapply(weightgain$weightgain, 
       list(weightgain$source, 
            weightgain$type), mean)
tapply(weightgain$weightgain, 
       list(weightgain$source, 
            weightgain$type), sd)

# This will show us a plot of mean 
# weight gain for each level of the
# two factors:
plot.design(weightgain)

# To apply analysis of variance to the 
# data we can use the aov function in R
# and then the summary method to provide
# the analysis of variance table.

# The model formula specifies a two-way 
# layout with interaction terms, where
# the first factor is source, and the 
# second factor is type.

wg_aov <- aov(weightgain ~ source * type,
              data = weightgain)

# The estimates of the intercept and the 
# main and interaction effects can be
# extracted from the model fit by
coef(wg_aov)

# Note that the model was fitted with the
# restrictions that lambda1 = 0 (corresponding
# to Beef) and Beta1 = 0 (corresponding to High)
# because treatment contrasts were used as
# as default as can be seen
options("contrasts")

# Thus, the coeffiient for source of -14.1
# can be interpreted as an estimate of the
# difference between lambda1 - lambda2

# R output of the ANOVA fit for the 
# weightgain data:
summary(wg_aov)

# Interaction plot of type and source:
interaction.plot(weightgain$type, 
                 weightgain$source, 
                 weightgain$weightgain,
                 legend = FALSE)
legend(1.5, 95, 
       legend = levels(weightgain$source), 
       title = "weightgain$source", 
       lty = c(2,1), bty = "n")

### FOSTER FEEDING OF RATS OF DIFFERENT GENOTYPE

# Begin with a plot of the mean litter weight 
# for the different genotypes of mother and litter.
# Data is in data frame "foster":
data("foster", package = "HSAUR3")

# take a look:
View(foster)

# We plot the design. This is a plot 
# of mean litter weight for each level 
# of the two factors for the foster data:
plot.design(foster)

# We can derive the two analyses of variance
# tables for the foster feeding example by
# applying the R code
summary(aov(weight ~ litgen * motgen, 
            data = foster))

# and then the code
summary(aov(weight ~ motgen * litgen, 
            data = foster))

# There are (small) differences in the 
# sum of squares for the two main effects
# and, consequently, in the associated F-tests
# and p-values. This would not be true if we 
# had used the code
summary(aov(weightgain ~ type * source, 
            data = weightgain))

# We can investigate the effect of genotype
# B on litter weight in more detail by the
# use of multiple comparison procedures.

# Such procedures allow a comparison of all 
# pairs of levels of a factor while maintaining
# the nominal significance level at its specified
# value and producing adjusted confidence intervals
# for mean differences. 

# One such procedure is called 'Tukey Honest 
# Significant' differences suggested by Tukey (1953);

# Here, we are interested in simultaneous confidence
# intervals for the weight differences between all
# four genotypes of the mother.

# First, we fit an ANOVA model:
foster_aov <- aov(weight ~ litgen * motgen, 
                  data = foster)

# which serves as the basis of the multiple
# comparisons, here with all pair-wise
# differences by:
foster_hsd <- TukeyHSD(foster_aov, "motgen")
foster_hsd

# A convenient plot method exists for this
# object and we can get a graphical view
# of the multiple confidence intervals. 

# It appears that there is only evidence 
# for a difference in the B and J genotypes.
# Note that the particular method implemented
# in TukeyHSD is applicable only to balanced
# mildly unbalanced designs
plot(foster_hsd)

### WATER HARDNESS AND MORTALITY

# The water hardness and mortality data 
# for 61 large towns in England and Wales.

# Here we will extend the analysis by an 
# assessment of the differences of both 
# hardness and mortality in the North or South. 

# The hypothesis that the two-dimensional 
# mean-vector of water hardness and mortality
# is the same for cities in the North and the
# South can be tested by Hotelling-Lawley test
# in a multivariate analysis of variance
# framework. 

data("water", package = "HSAUR3")
View(water)

# The R function manova can be used to fit
# such a model and the corresponding summary
# method performs the test specified by the
# test argument:
summary(manova(cbind(hardness, mortality) ~ location, 
               data = water), test = "Hotelling-Lawley")

# The cbind statement in the left hand 
# side of the formula indicates that a
# multivariate response variable is to be modelled. 

# The p-value associated with the 
# Hotelling-Lawley statistic is very small 
# and there is strong evidence that
# the mean vectors of the two variables are 
# not the same in the two regions.

# Looking at the sample means
tapply(water$hardness, water$location, mean)
tapply(water$mortality, water$location, mean)

# we see we see large differences in the
# two regions both in water hardness and 
# mortality, where low mortality is associated
# with hard water in the South and high
# mortality with soft water in the North.

### MALE EGYPTIAN SKULLS

data("skulls", package = "HSAUR3")
# take a look:
View(skulls)

# We can begin by looking at a table
# of mean values for the four measurements
# within each of the five epochs. 

# The measurements are available in the
# data.frame skulls and we can compute 
# the means over all epochs by
means <- aggregate(skulls[,c("mb", "bh", "bl", "nh")], 
                   list(epoch = skulls$epoch), mean)
# Look:
means

# It may also be useful to look at 
# these means graphically and this 
# could be done in a variety of ways. 

# Here we construct a scatterplot 
# matrix of the epoch means of skulls
pairs(means[,-1],
      panel = function(x, y) {
        text(x, y, levels(skulls$epoch), 
             new = FALSE, cex = 0.8)
      })

# There appear to be quite large differences
# between the epoch means, at least on 
# some of the four measurements. 

# We can now test for a difference more 
# formally by using MANOVA with the 
# following R code to apply each of the
# four possible test criteria mentioned earlier:

skulls_manova <- manova(cbind(mb, bh, bl, nh) ~ epoch, 
                        data = skulls)
summary(skulls_manova, test = "Pillai")
summary(skulls_manova, test = "Wilks") 
summary(skulls_manova, test = "Hotelling-Lawley")
summary(skulls_manova, test = "Roy")

# The p-value associated with each four
# test criteria is very small and there is
# strong evidence that the skull measurements
# differ between the five epochs.

# We might now move on to investigate 
# which epochs differ and on which variables.

# We can look at the univariate F-tests for
# each of the four variables by using the code:
summary.aov(skulls_manova)

# We see that the results for the maximum
# breadths (mb) and basialiveolar length
# (bl) are highly significant, with those
# for the other two variables, in particular
# for nasal heights (nh), suggesting little 
# evidence of a difference. 

# To look at the pairwise multivariate tests
# (any of the four test criteria are equivalent
# in the case of a one-way layout with two 
# levels only) we can use the summary method
# and manova function as follows:
summary(manova(cbind(mb, bh, bl, nh) ~ epoch, 
               data = skulls, 
               subset = epoch %in% c("c4000BC", 
                                     "c3300BC")))
summary(manova(cbind(mb, bh, bl, nh) ~ epoch, 
               data = skulls, 
               subset = epoch %in% c("c4000BC", 
                                     "c1850BC")))
summary(manova(cbind(mb, bh, bl, nh) ~ epoch, 
               data = skulls, 
               subset = epoch %in% c("c4000BC", 
                                     "c200BC")))
summary(manova(cbind(mb, bh, bl, nh) ~ epoch, 
               data = skulls, 
               subset = epoch %in% c("c4000BC", 
                                     "cAD150")))

# To keep the overall significance level for
# the set of all pairwise multivariate tests
# under some control (and still maintain a 
# reasonable power), Stevens (2001) recommends
# setting the nominal levelalpha = 0.15 and 
# carrying out each test at the a/m level where m
# is the number of tests performed. 

# The results of the four pairwise tests suggest
# that as the epochs become further separated
# in time the four skull measurements become
# increasingly distinct.

### LINEAR MODELS: REGRESSION

# The basic function for fitting ordinary 
# multiple models is lm(), and a streamlined 
# version of the call is as follows:  

# fitted.model <- lm(formula, data = data.frame)

# For example 

# fm2 <- lm(y ~ x1 + x2, data = production)

# would fit a multiple regression model 
# of y on x1 and x2 (with implicit intercept term). 

### How old in the Universe

# get the data
install.packages("gamair")
# get the hubble telescope data
data("hubble", package = "gamair")
View(hubble)
velocity <- hubble$y
distance <- hubble$x

# given the relative velocity and
# the distance of 24 galaxies, 
# according to measurements made
# using the Hubble Space Telescope,
# can you estimate the age of the universe?

### YES ! ! ! 

# plot velocity and distance give you
# a scatterplot of velocity and distance
plot(velocity ~ distance, data = hubble)

# estimating the age of the universe is
# actually pretty easy
sum(hubble$y*hubble$x) / 
  sum(hubble$x^2)

# can also do it like this using linear modeling
hmod <- lm(velocity ~ distance - 1, data = hubble)
str(hmod)
# Note that the model formula specifies a model 
# without intercept. We can now extract
# the estimated model coefficients via
coef(hmod)

# and add this estimated regression line
# to the scatterplot. 

# we produce a scatterplot of the residuals yi -
# y_hat_i against fitted values y_hat_i to assess
# the quality of the model fit. It seems
# that for higher distance values the variance
# of velocity increases.

# Here we see a scatterplot of velocity and 
# distance with estimated regression line
# (left) and plot of residuals against fitted
# values (right).

layout(matrix(1:2, ncol = 2))
plot(velocity ~ distance, data = hubble)
abline(hmod)
plot(hmod, which = 1)

# Now we can use the estimated value of
# Beta1 to find an approximate value for
# the age of the universe. 

# The Hubble constant itself has units
# of km x sec -1 x Mpc -1. A mega-parsec
# (Mpc) is 3.09x10to the 19th km, so we 
# need to divide the estimated value by
# value of Beta1 by ?. The approximate 
# age of the universe in seconds will then
# be the inverse of this calculation.

Mpc <- 3.09 * 10^19
ysec <- 60^2 * 24 * 365.25
Mpcyear <- Mpc / ysec
1 / (coef(hmod) / Mpcyear)

# So the estimated age is 12.8 billion years.

##### CLOUD SEEDING EXPERIMENT

# get the clouds seeding data
data("clouds", package = "HSAUR3")
View(clouds)
names(clouds)
# Begin by taking a look at the non-parametric univariate
# distributions of seeding and echo motion by levels
data("clouds", package = "HSAUR3")
layout(matrix(1:2, nrow = 2))
bxpseeding <- boxplot(rainfall ~ seeding, 
                      data = clouds, 
    ylab = "Rainfall", xlab = "Seeding")
bxpecho <- boxplot(rainfall ~ echomotion, 
                   data = clouds, 
    ylab = "Rainfall", xlab = "Echo Motion")

# We create some scatterplots:
layout(matrix(1:4, nrow = 2))
plot(rainfall ~ time, data = clouds)
plot(rainfall ~ cloudcover, 
     data = clouds)
plot(rainfall ~ sne, data = clouds, 
     xlab="S-Ne criterion")
plot(rainfall ~ prewetness, 
     data = clouds)

# Both the boxplots and the scatterplots
# show some evidence of outliers, so the
# the row names of the extreme observations
# in the clouds data.frame can be identified via
rownames(clouds)[clouds$rain %in% c(bxpseeding$out, 
                                    bxpecho$out)]

# outliers in rows # 1 and # 15
clouds[c(1,15),]

# In this example it is sensible to assume
# that the effect of some of the other explanatory
# variables is modified by seeding and therefore
# consider a model that includes seeding as covariate
# and, furthermore, allows interaction terms
# for seeding with each of the covariates except
# time. This model can be described by the formula:
clouds_formula <- rainfall ~ seeding + seeding:(sne + cloudcover + prewetness + echomotion) + time

# and the design matrix X* can be computed via
Xstar <- model.matrix(clouds_formula, 
                      data = clouds)

# By default, treatment contrasts have been 
# applied to the dummy codings of the factors
# seeding and echomotion as can be seen from 
# the inspection of the contrasts attribute 
# of the model matrix
attr(Xstar, "contrasts")

# The default contrasts can be changed via 
# the contrasts.arg argument to model.matrix
# or the contrasts argument to the fitting
# function, for example lm() or aov().

# Such internals are hidden and performed 
# by high-level model-fitting functions such
# as lm() which will be used to fit the linear 
# model defined by the formula clouds_formula:
clouds_lm <- lm(clouds_formula, 
                data = clouds)
class(clouds_lm)

# The results of the model fitting is an
# object of class lm for which a summary
# method showing the conventional regression
# analysis output is available.
summary(clouds_lm)

# The coefficient estimates can be assessed:
betastar <- coef(clouds_lm)
betastar

# and the corresponding covariance matrix
# is available from the vcov method:
Vbetastar <- vcov(clouds_lm)
Vbetastar

# where the square roots of the diagonal 
# elements are the standard errors as
# shown in
sqrt(diag(Vbetastar))

# In order to investigate the quality
# of the model fit, we need access to the
# residuals and the fitted values. 

# The residuals can be found by the 
# residuals method and the fitted values of 
# the response from the fitted (or predict)
# method
psymb <- as.numeric(clouds$seeding)
# Shows the regression relationship between
# S-Ne criterion and rainfall with and
# without seeding.
plot(rainfall ~ sne, data = clouds, 
     pch = psymb, 
     xlab = "S-Ne criterion")
abline(lm(rainfall ~ sne, 
          data = clouds, 
          subset = seeding == "no"))
abline(lm(rainfall ~ sne, 
          data = clouds, 
          subset = seeding == "yes"), 
       lty = 2)  
legend("topright", 
       legend = c("No seeding", "Seeding"), 
       pch = 1:2, lty = 1:2, bty = "n")

# extract the residuals
clouds_resid <- residuals(clouds_lm)
# and the fitted values
clouds_fitted <- fitted(clouds_lm)

# do a scatterplot of the two
# Now the residuals and the fitted values 
# can be used to construct diagnostic
# plots; for example the residual plot in
# where each observation is labelled by
# its number. Observations 1 and 15 give 
# rather large residual values and the data
# should perhaps be reanalysed after these
# two observations are removed. 
plot(clouds_fitted, clouds_resid, 
     xlab = "Fitted values",
     ylab = "Residuals", 
     type = "n",
     ylim = max(abs(clouds_resid)) * c(-1, 1))
# put a line at zero
abline(h = 0, lty = 2)
# label the points
text(clouds_fitted, 
     clouds_resid, 
     labels = rownames(clouds))

# Can see rows 15 and 1 "way out there"...

# The normal probability plot of the
# residuals shows a reasonable agreement between
# theoretical and sample quantiles, however,
# observations 1 and 15 are extreme again.
qqnorm(clouds_resid, ylab = "Residuals")
qqline(clouds_resid)

# An index plot of the Cook's distances for
# each observation (and many other plots including
# those constructed above from using the basic
# functions) can be found from applying the 
# plot method to the object that results from the
# application of the lm function. 

# This figure suggests that observations 2 
# and 18 have undue influence on the estimated
# regression coefficients, but the two outliers
# identified previously do not. 

# Again it may be useful to look at the
# results after these two observations 
# have been removed.
plot(clouds_lm)

# To get a specific Cook's distance plot:
plot(clouds_lm, which = 4, 
     sub.caption = NULL)

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

