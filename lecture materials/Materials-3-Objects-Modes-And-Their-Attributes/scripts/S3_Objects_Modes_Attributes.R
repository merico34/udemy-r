################################################
#####         Objects: Their Modes         #####
#####            and Attributes            #####
################################################

##### Objects: Their Modes and Attributes

##### SEE SLIDES

# The entities R operates on are technically known as objects. 
# Examples are vectors of numeric (real) or complex values, 
# vectors of logical values and vectors of character strings. 

# These are "atomic" structures since their components are all 
# of the same type, or mode, namely 'numeric', 'complex', 'logical',
# 'character' and 'raw'.

# Double data type: you can perform calculations on numbers:
x <- 8.14
y <- 8.0
z <- 87 + 12.9
y/z
# [1] 0.08008008

typeof(x)
# [1] "double"

# type slightly different than mode
mode(x)
# [1] "numeric"

is.double(8.9)
# [1] TRUE

test <- 1223.456
is.double(test)
# [1] TRUE

# Integer data type
nchild <- 3.0
is.integer(nchild)
# [1] FALSE

typeof(nchild)
# [1] "double"

nchild <- 3
is.integer(nchild)
# [1] FALSE

# even integers default to doubles
typeof(nchild)
# [1] "double"

# but can force it to be an integer
int.child <- as.integer(nchild)

typeof(int.child)

# Can mix objects of type 'double' and 'integer' in one calculation
x <- as.integer(7)
y <- 2.0
z <- x/y
z
# [1] 3.5

typeof(z)
# [1] "double"

# objects of type complex
test1 <- as.complex(-25+5i)
sqrt(test1)
# [1] 0.497543+5.024694i

test2 <- complex(5,real=2,im=6)
test2
# [1] 2+6i 2+6i 2+6i 2+6i 2+6i 

typeof(test2)
# [1] "complex"

# Logical data type
x <- 13
y <- x > 15
y
# [1] FALSE

# Logical operators
x <- c(9,166)
y <- (3 < x) & (x <= 10)
x
# [1]  9 166

y
# [1] TRUE FALSE

x <- 1:15
# number of elements in x larger than 9
sum(x>9)
# [1] 6

# Character data type
x <- c("a", "b", "c")
x
# [1] "a" "b" "c"

mychar1 <- "This is a test"
mychar1
# [1] "This is a test" 

# Character Strings
a <- "abc"
b <- "123"
as.numeric(a)
# [1] NA
# Warning message:
# NAs introduced by coercion

as.numeric(b)
# [1] 123 

pets <- c("cat","dog","gerbil","terrapin")
# Here, pets is a vector comprising four character strings:

length(pets)
# [1] 4

# And the individual character strings have 3, 3, 6 and 8 characters:
nchar(pets)
# [1] 3 3 6 8

# When first defined, character strings are not factors:
class(pets)
# [1] “character”

is.factor(pets)
# [1] FALSE 

# R has built-in vectors that contain 26 letters of the 
# alphabet in lower case (letters) and in upper case (LETTERS):
letters
# [1] “a” “b” “c” “d” .. etc

LETTERS
# [1] “A” “B” “C” “D” .. etc

# Can match numbers with letters using ‘which’:
which(letters=="n")
# [1] 14

letters[14]
# [1] “n” 

# Function noquote suppresses printed quote marks: 
noquote(letters)
# [1] a b c d e f g h I j k l m o p .. etc

# Can amalgamate strings into character vectors:
a <- "abc"
b <- "123"
d <- c(a,b)
# [1] “abc” “123”

paste(a,b,sep="")
# [1] “abc123”

# No separator above; the default in one blank:
paste(a,b)
# [1] “abc 123”

paste(a,b,"A longer phrase with blanks", sep="")
# [1] “abc123A longer phrase with blanks”

# When pasting a vector:
d <- c(a,b,"new")
e <- paste(d,"A longer phrase")
e
# [1] “abc A longer phrase” “123 A longer phrase”
# +   “new A longer phrase” (all on same line)

## BASIC DATA STRUCTURES
# vectors
c(1,2,6,4,8)
x <- c(88,5,15,44)
x

# vectors are addressable
x <- c(88,5,15,44)
x[1:3]
x <- c(x[1:3],168,x[4])
x

# vector elements can have names
v <- c(10,20,30)
names(v) <- c("Moe","Larry","Curly")
print(v) # note: same as typing "v" at prompt
v[1]
v[2:3]
c(v[1],v[3])

##### LIST STRUCTURES: MODE 'LIST'

# R also operates on objects called lists, of mode 'list'. 
# They are ordered sequences of objects which individually 
# can be of any mode. lists are "recursive" rather than 
# atomic, since their components can themselves be lists.

# list is an ordered collection of objects
e <- list(thing="hat",size="8.25")
e

# can reference list components and elements with subscripts
e[1]
e[[1]]
e[2]
e[[2]]
e[3]

# can combine data structures using list() function
x1 <- c(1, 2, 3)
x2 <- c(c("a", "b", "c", "d"),c(1,2,3))
x3 <- 3
x4 <- matrix(nrow = 2, ncol = 2)
x4[,1] <- c(1, 2)
x4[,2] <- c(3, 4)
Y <- list(x1 = x1, x2 = x2, x3 = x3, x4 = x4)
Y  # What appears when we type Y at R prompt?
z <- list(x1, x2, x3, x4)
z  # What appears when we type Y at R prompt?

x <- list(first=Y,second=z)

##### MODES 'FUNCTION' AND 'EXPRESSION'

# The other recursive structures are those of mode 
# 'function' and 'expression'. Functions are objects
# that come with the R system or which may be written
# by users. 

##### MODE IS A PROPERTY OF AN OBJECT, an INTRINSIC PROPERTY

# By 'mode' we mean the basic type of an object's 
# fundamental constituents. 

##### ANOTHER PROPERTY IS LENGTH

# This is a special case of a "property" of an object. 
# Another property of every object is its length. 
# The functions mode(object) and length(object) determine
# the mode and length of any defined structure. 
 
# Further properties are provided by attribute() function

# Example: If z is a complex vector of length 100, 
# then in an expression mode(z) is the character
# string "complex" and length(z) is 100. 

# modes can be changed:
z <- 0:9; z
mode(z)
length(z)
attributes(z)
digits <- as.character(z); digits
mode(digits)
length(digits)
d <- as.integer(digits); d
# now d and z are the same:
mode(d)
length(d)

# Is a large collection of functions of the form 
# 'as.something()' for coercion from one mode to another, 
# or for giving an object some other attribute it does
# not already possess. 

##### CHANGING THE LENGTH OF AN OBJECT

# An "empty" object may still have a mode. For example 

e <- numeric();e
e
# an empty numberic vector object
mode(e)
length(e)
# an empty character object:
character()

# Once an object is created, new components may be 
# added to it by giving it an index value outside
# its previous range:
e[3] <- 17;e
# First two elements are 'NA'
length(e)
mode(e)

# This applies to any structure, provided the mode 
# of the additional component(s) agrees with the 
# mode of the object. 

# To truncate the size of an object requires only
# an assignment to do so:
alpha <- 1:10; alpha
length(alpha)
alpha <- alpha[2 * 1:5];alpha
length(alpha)
which(alpha>0)
# we can retain just first 3 elements by:
alpha
length(alpha) <- 3; alpha

##### THE CLASS OF AN OBJECT

# All objects in R have a class, reported by function class(). 
# For simple vectors this is just the mode, for example 
# "numeric", "logical", "character".

# But "matrix", "array", "factor" and "data.frame" 
# are other possible values. 

# A special attribute known as the class of the object
# is used to allow for an object-oriented style of 
# programming in R. 

# For example if an object has class "data.frame", 
# it will be printed in a certain way, the plot() 
# function will display it graphically in a certain way, 
# and other so-called generic functions such as
# summary() will react to it as an argument in 
# a way sensitive to its class. 
 
# To remove temporarily the effects of class, 
# use the function unclass().  

# For example here is a dataframe
class(cars)
# show it (same as 'print')
print(cars)
# has only two variables
names(cars)
# plot calls a scatterplot with a dataframe
plot(cars)
# note can add a smooth (non-linear) fit
lines(lowess(cars))
# summary works on data frames
summary(cars)
# unclass cars
uncars <- unclass(cars)
# Now it is a list
class(uncars)
# take a look
print(uncars)
# with only two variables
names(uncars)
# plot doesn't call anything for a list
plot(uncars)
# summary does something very different for a list
summary(uncars)
# but summary works (although a little differently)
# when used as argument to lapply
lapply(uncars, summary)
# this argument to plot does not have a class
plot(sin, -pi, 2*pi) # see ?plot.function
?plot.function
# plot evaluates first argument as an expression
## Discrete Distribution Plot:
plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10,
     main = "rpois(100, lambda = 5)")

# Simple quantiles/ECDF, see ecdf() {library(stats)} for a better one:
plot(x <- sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")
# points is a secondary plotting function
points(x, cex = .5, col = "dark red")

# More on generic functions and class-specific methods later.

##### ORDERED AND UNORDERED FACTORS

# Factor objects
gender <- c("male","male","female","male")
gender <- factor(gender)
gender
# [1] male male female male
# Levels: female male

# The function levels
levels(gender)
# [1] "female" "male"

# Note that the result of the levels function is of type 'character'.
# Could also create gender variable:
gender <- c(1,1,2,1)

# Object gender is an integer, need to convert it
gender <- factor(gender)
gender
# [1]   1 1 2 1
# Levels: 1 2

# Cannot perform arithmetic operations on gender
gender + 6
# [1] NA NA NA NA 

# Can transform factor variables to double or integer
gender.numeric <- as.double(gender)
gender.numeric 
# [1] 1 1 2 1

gender <- factor(c("male","female"))

# Then can perform arithmetic operations on gender.numeric
gender.numeric + 6
# [1] 7 7 8 7 

# If order of levels is important, use function order
Income <- c("High","Low","Average","Low","Average","High")
Income <- ordered(Income, levels=c("Low","Average","High"))
Income
# [1] High Low Average Low Average High
# Levels: Low < Average < High

# Order is used to assign numbers to levels
Income.numeric <- as.double(Income)
Income.numeric 
# [1] 3 1 2 1 2 3 

# Suppose we have a sample of 30 tax accountants from all the states and territories of Australia

state <- c("tas", "sa",  "qld", "nsw", "nsw", "nt",
           "wa",  "wa", "qld", "vic", "nsw", "vic",
           "qld", "qld", "sa",  "tas", "sa",  "nt",
           "wa",  "vic", "qld", "nsw", "nsw", "wa",
           "sa",  "act", "nsw", "vic", "vic", "act")

# what is state?
class(state) 
# look at state
state
# sort state, makes it alphabetical
sort(state)
# although the ordering of state is unchanged
state

# we change it to a factor
statef <- factor(state)
# what is it?
class(statef)
# now look, has levels sorted alphabetically
statef
?substring # returns parts of a string
# example of substring
class(c("abcdef"))
is.vector(c("abcdef"))
# returns from 2nd thru 4th character
substring("abcdef", 2, 4)
# is vectorized (from 1 to 1, from 2 to 2, etc)
substring("abcdef", 1:6, 1:6)
# more complicated example
substring("statistics", 1:10, 1:10)
# what is class?
class(substring("statistics", 1:10, 1:10))
# is a vector?
is.vector(class(substring("statistics", 1:10, 1:10)))
# note is has ten elements, not one
length((substring("statistics", 1:10, 1:10)))
# make if a factor vector
statf <- factor(substring("statistics", 1:10, 1:10))
# look at it, has five levels
statf
# can add a letter to position 11 as long as it is
# one of the existing levels
statf[11] <- "a"
statf
# but not otherwise, "z" is not a level
statf[12] <- "z"
# so get <NA> in 12th position
statf

# R has built-in vectors that contain 26 letters of the 
# alphabet in lower case (letters) and in upper case (LETTERS):
letters
# [1] “a” “b” “c” “d” .. etc

LETTERS
# [1] “A” “B” “C” “D” .. etc

# Can match numbers with letters using ‘which’:
which(letters=="n")
# [1] 14

letters[14]
# [1] “n” 

# Function noquote suppresses printed quote marks: 
noquote(letters)
# [1] a b c d e f g h I j k l m o p .. etc

# make a factor vector, but give it a wider range of 
# possible levels using levels argument
(ff <- factor(substring("statistics", 1:10, 1:10), 
              levels = letters))
# can now add "z" to position 11
ff[11] <- "z"
# levels of ff are unchanged
ff
levels(ff)
# start over
(ff <- factor(substring("statistics", 1:10, 1:10), 
              levels = letters))
# factor levels are stored internally as
# numbers in the order in which they occur
ff
# first letter 's' is 19 in alphabet
which(letters==ff[1])
# the internal codes for the factors
# correspond to the order of the letters
# in the alphabet, is the default
as.integer(ff)
# drops the levels that do not occur
(f. <- factor(ff))
f.
# ff is unchanged
ff
# the same, more transparently
ff[, drop = TRUE]
?ordered
# "ordered", inheriting from "factor"
class(ordered(4:1)) 
z <- factor(LETTERS[3:1], ordered = TRUE)
# z is an ordered factor
class(z)
# level C is stored internally as 1
# level B is stored internally as 2
# level A is stored internally as 3
# so it displays the levels in alphabetical order
# but tells you the order of the levels
z

##### FUNCTION tapply() and RAGGED ARRAYS

# Australian tax accountants again
state <- c("tas", "sa",  "qld", "nsw", "nsw", "nt",
           "wa",  "wa", "qld", "vic", "nsw", "vic",
           "qld", "qld", "sa",  "tas", "sa",  "nt",
           "wa",  "vic", "qld", "nsw", "nsw", "wa",
           "sa",  "act", "nsw", "vic", "vic", "act")

# Suppose we have incomes of the same tax accountants in another vector
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69,
             70, 42, 56, 61, 61, 61, 58, 51, 48, 65,
             49, 49, 41, 48, 52, 46, 59, 46, 58, 43)


# calculate the sample mean income for each state we 
# can now use the special function tapply(): 
  
incmeans <- tapply(incomes, statef, mean)

# giving a means vector with the components labelled
# by the levels 

incmeans

# function tapply() is used to apply a function, 
# here mean(), to each group of components of the 
# first argument, here incomes, defined by the levels
# of the second component, here statef15, as if 
# they were separate vector structures. 

# The result is a structure of the same length as 
# the levels attribute of the factor containing 
# the results.

# Suppose we needed to calculate the standard errors
# of the state income means. 

# So we write an R function to calculate the 
# standard error for any given vector. 

# We use the Since the builtin function var() 
# to calculate the sample variance 
stderr <- function(x) sqrt(var(x)/length(x))
# We use our user-defined function with tapply
incster <- tapply(incomes, statef, stderr)

# and the values calculated are then 
incster

###### MATRICES

# matrix is a vector with two dimensions
A <- 1:6 # A is a vector at this point
print(A) # same as expressing, or evaluating, A
dim(A) <- c(2,3) # Force vector A to be 2 x 3
print(A) # Now A is a matrix, no longer a vector

# list is an ordered collection of objects
e <- list(thing="hat",size="8.25")
e

# Are several way of making a matrix: 
x <- matrix(1:9,nrow=3)
x
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

class(x)
# [1] “matrix”

attributes(x)
# $dim
# [1] 3 3

#Make a matrix row-wise with byrow=T: 
vector <- c(1,2,3,4,4,3,2,1)
v <- matrix(vector, byrow=T, nrow=2)
v
#      [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    4    3    2    1

# Another way is to provide vector two dimensions:
dim(vector) <- c(4,2)

# Can check that vector is a matrix:
is.matrix(vector)
# [1] TRUE

# We will need to transpose vector: 
vector
#      [,1] [,2]
# [1,]    1    4
# [2,]    2    3
# [3,]    3    2
# [4,]    4    1

# We will need to transpose vector: 
x <- matrix(rpois(20,1.5),nrow=4)
x
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    0    2    5    3
# [2,]    1    1    3    1    3
# [3,]    3    1    0    2    2
# [4,]    1    0    2    1    0

# We want to label the rows ‘Trial.1’ etc.:
rownames(x) <- rownames(x,do.NULL=FALSE,prefix="Trial.")
x

#          [,1] [,2] [,3] [,4] [,5]
# Trial.1    1    0    2    5    3
# Trial.2    1    1    3    1    3
# Trial.3    3    1    0    2    2
# Trial.4    1    0    2    1    0

# We want drug names for the columns:
colnames(x) <- c("aspirin","paracetamol","nurofen","hedex","placebo")
x

#          aspi..  pare.. nuro.. hede.. plac..
# Trial.1     1       0      2      5      3
# Trial.2     1       1      3      1      3
# Trial.3     3       1      0      2      2
# Trial.4     1       0      2      1      0

# Could also use the dimnames function:
dimnames(x) <- list(NULL,paste("drug.",1:5,sep=""))
x

#      drug.1  drug.2 drug.3 drug.4 drug.5
# [1,]     1       0      2      5      3
# [2,]     1       1      3      1      3
# [3,]     3       1      0      2      2
# [4,]     1       0      2      1      0

# Use rbind and cbind to add rows and columns: 
x <- rbind(x,apply(x,2,mean))
x <- cbind(x,apply(x,1,var))
x
#      [,1] [,2] [,3] [,4] [,5]     [,6]
# [1,]  1.0  0.0 2.00 5.00    3  3.70000
# [2,]  1.0  1.0 3.00 1.00    3  1.20000
# [3,]  3.0  1.0 0.00 2.00    2  1.30000 
# [4,]  1.0  0.0 2.00 1.00    0  0.70000
# [5,]  1.5  0.5 1.75 2.25    2  0.45625

# Label variance and means columns and rows
colnames(x) <- c(1:5,"variance")
rownames(x) <- c(1:4,"mean")
x
#      1    2    3    4 5 variance
# 1  1.0  0.0 2.00 5.00 3  3.70000
# 2  1.0  1.0 3.00 1.00 3  1.20000
# 3  3.0  1.0 0.00 2.00 2  1.30000 
# 4  1.0  0.0 2.00 1.00 0  0.70000
# mean 1.5 0.5 1.75 2.25 2 0.45625

# Arrays are numeric objects with dimension attributes
array <- 1:25
is.matrix(array)
# [1] FALSE
