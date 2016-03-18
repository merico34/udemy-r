#######################################
#####    AN INTRODUCTION TO R     #####
#######################################

#######################################
#####   Exercise for Session #1   #####
#####  Read Appendix A at the end #####
#####  of the Intro to R manual   #####
#####  while you type in and      #####
#####  execute the scripts. Here  #####
#####  I provide a sample of the  #####
#####  scripts.                   #####
#######################################

# A SAMPLE OF SOME OF THE SESSION: APPENDIX A

# YOU MUST TYPE IN AND THEN EXECUTE MOST
# OF THEM !

# Appendix A: A sample session
# This session is intended to introduce to you some 
# features of the R environment by using them.

# Generate two pseudo-random normal vectors of x- and 
# y-coordinates.
x <- rnorm(50)
y <- rnorm(x)

# Plot the points in a scatterplot
plot(x, y)

# See which R objects are now in the R workspace
ls()

# Remove objects no longer needed.
rm(x, y)

# Make x = (1, 2, 3, 4, . . . , 20).
x <- 1:20

# Create a 'weight' vector of standard deviations.
w <- 1 + sqrt(x)/2

# Make a data frame of two columns, x and y.
dummy <- data.frame(x=x, y= x + rnorm(x)*w)

# then take a look at it
dummy

# Fit a simple linear regression. With y to the left 
# of the tilde, we are modelling y dependent on x.
fm <- lm(y ~ x, data=dummy)

# Look at the analysis
summary(fm)
 