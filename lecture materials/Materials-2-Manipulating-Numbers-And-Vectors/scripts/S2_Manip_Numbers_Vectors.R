################################################
#####        Simple Manipulation of        #####
#####          Numbers and Vectors         #####
################################################

##### Simple manipulations; numbers and vectors

# We will discuss:
# Vectors and assignment
# Vector arithmetic
# Generating regular sequences
# Logical vectors
# Missing values
# Character vectors
# Index vectors; selecting and modifying subsets of a data set
# Other types of objects

#### BUT FIRST

#### R has basic, or "atomic" data types and modes

# These relate to the basic characteristic of a
# variable (which is an object), or a 'single thing'
# Some basic types are logical, integer, double,
# complex, and character (also known as string)

##### Vectors and assignment
# R operates on named data structures. 

# Simplest is the numeric vector, which is an
# ordered collection of numbers. 

# Elements of a vector must all be the same mode or type.

# To create a numeric vector x:
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)

# We use the function c() which can take an arbitrary
# number of vector arguments and whose value is a vector
# derived by concatenating the arguments end to end.

# Assignment can also be made using the function assign():
assign("y", c(10.4, 5.6, 3.1, 6.4, 21.7))

# test the equality
x==y

# Note that assignments can also be made in the other 
# direction, using:
c(8.2, 15.6, 31.1, 6.14, 1.777) -> w
w

# and multiple times on same line
c(4.4, 5.6, 1.1, 6.33, 1.66) -> a -> b -> c
a
b
c

# R tries to evaluate (find value of) an expression. 
# An expression can be a statement, a function, an object.....

# Expressions can be nested with '()'

# R thinks each line is a distinct statement:
12       # is a number that evaluates to 12
"jeff"   # is a string that evaluates to 'jeff'
w        # is the vector we defined before

# An assignment statement is two separate "things"
# (a variable name) <- (expression that has a value)
# Assignment symbol called "gets symbol"
# Is actually a function
?'<-' # assigns a value to a name

# can assign to the left
a <- c(1,2,4); a # Note use of semicolon to separate statements

# can assign to the right
c("bill","henry","john") -> b; b

# can do multiple assignments 
d <- c <- c(T, T, F, T)
c
d

# If an expression is used as a complete command, 
# the value is printed at the terminal and lost:
1/a

# the value of a is unchanged
a

# Note an assignment statement is not printed
e <- c(4.3, 6.5, 2.3)
# unless you call the object with a value
e

# unless you put the assignment statement in '()'
(f <- c("irving","louis")) # this is 2 commands
f

# What is the value of '(' a single parenthesis?

?'('

# The value of parentheses is the result 
# of evaluating the argument....it returns
# the value of the argument

# What is variable x?
x <- c(10.4, 5.6, 3.1, 6.4, 21.7)
x

# This assignment creates a vector y with
# 11 entries consisting of two copies of
# x with a zero in the middle:
y <- c(x, 0, x)
y

##### Vector arithmetic
# Operations are performed element by element.
# When using two vectors, they can be different lengths. 

# Shorter vectors in the expression are "recycled"
# until they match the length of the longest vector. 

# So what do we have?
x
y

#  So with the above assignments the command
(v <- 2*x + y + 1)

# generates a new vector v of length 11 (length
# of longest vector) by recycling first element
# or shorter vector

# The elementary arithmetic operators are the 
# usual +, -, *, / and ^ for raising to a power.

# The operators also call functions
?'+'

# In addition all common arithmetic functions
# you have log, exp, sin, cos, tan, sqrt,
# and so on, all have their usual meaning. 

# max() and min() select the largest and smallest 
# values of a vector. range() is a function 
# whose value is a vector of length two, namely 
# c(min(x), max(x)). 
min(x)
max(x)
range(x)
# same as
c(min(x), max(x))

# Note min() and max() return highest and lowest
# even if provided several vectors
min(x)
min(x,y)

# The parallel maximum and minimum functions 
# pmax() and pmin() return a vector (of length
# equal to their longest argument) that contains 
# in each element the largest (smallest) element
# in that position in any of the input vectors.
a <- c(10,15,5,25,35)
b <- c(8,17,3,27,32)
pmax(a,b)
pmin(a,b)

# length(x) is the number of elements in x, 
# sum(x) gives the total of the elements in x, 
# and prod(x) their product.
length(x)
sum(x)

# cumsum() gives running cumulative sum
cumsum(x)

# prod() multiplies them all together
prod(x)

# Two statistical functions are mean(x) is 
# same as sum(x)/length(x), and var(x) is same
# as sum((x-mean(x))^2)/(length(x)-1) or the
# sample variance.
x
mean(x)
sum(x)/length(x)
var(x)
sum((x-mean(x))^2)/(length(x)-1)

# sort(x) returns a vector of the same size as 
# x with the elements arranged in increasing order;
# order(x) returns the indexes from low to high
x

# low to high is default
sort(x)

# high to low
rev(sort(x))

# same as
sort(x, decreasing = TRUE)

# order and sort.list return the indexes sorted,
# not the values themselves
order(x)

# same as
sort.list(x)

# can be used to sort a data frame by one column
data(cars)

# first 6 records
head(cars)

# how many rows and columns?
dim(cars)

# show first 12 records
cars[1:12,]

# index from low to high on just dist
idx <- order(cars[,2])

# and the indexes can be used to sort the entire
# data frame by just one column or the other
cars[idx,]

# For most purposes the user will not be concerned
# if the "numbers" in a numeric vector are integers,
# reals or even complex. 

# To work with complex numbers, supply an explicit
# complex part. Thus
sqrt(-17)

# will give NaN and a warning, but
sqrt(-17+0i)

# will do the computations as complex numbers.

##### Generating regular sequences
# R has a number of facilities for generating commonly
# used sequences of numbers. For example
1:30 

# is the vector c(1, 2, ..., 29, 30). 
# The colon operator has high priority within an expression,
# so, for example 
2*1:15 

# is the vector c(2, 4, ..., 28, 30). Put 
n <- 10 # and compare the sequences 
1:n-1 # and 
1:(n-1)

# 30:1 generates a sequence backwards.
30:1

# The function seq() has five arguments

# The first two specify the beginning and end
seq(2,10)

# is the same vector as 
2:10.

# If you name the seq arguments, can present in
# any order
1:30

#same as
seq(1,30) 

# same as
seq(from=1, to=30) # and 

# same as
seq(to=30, from=1)

# Also have a by=value and length=value argument.
(seq(-5, 5, by=.2) -> s3)
s3

# Similarly this gives same result
s4 <- seq(length=51, from=-5, by=.2)
s4

# A related function is rep() which can be used for
# replicating or repeating an object
x

# The simplest form is
s5 <- rep(x, times=5)
s5

# which will put five copies of x end-to-end in s5. 

# Or you can use 'each' argument
s6 <- rep(x, each=5) # repeats individual elements
s6

##### 2.4 Logical vectors
# The elements of a logical vector can have values 
# TRUE, FALSE, and NA 

# The first two are often abbreviated as T and F. 
# Note however that 'T' and 'F' are just variables
# which are set to TRUE and FALSE by default, 
# but are not reserved words and hence can
# be overwritten by the user. 

# So you should always use TRUE and FALSE.

# Logical vectors are generated by conditions. For example
(x > 13)  # is a logical condition evaluates to T or F
temp = x > 13

# store the vector of TRUEs and FALSEs in temp
temp

# The logical operators are <, <=, >, >=, == 
# for exact equality and != for inequality. 

# '&' is logical AND
# '|' is logical OR
# '!' is logical NOT or NEGATION

# So if c1 and c2 are logical expressions, 
# then c1 & c2 is their intersection ("AND"), 
# c1 | c2 is their union ("OR"), and 
# !c1 is the NEGATION of c1.

# Logical vectors may be used in ordinary arithmetic, 
# in which case they are coerced into numerical vectors,
# FALSE becoming 0 and TRUE becoming 1. 

#### Missing values

# When an element or value is NA it is
# "not available" or a "missing value". 

# In general any operation on an NA becomes an NA.

# The function is.na(x) gives a logical vector 
# of the same size as x with value TRUE if and
# only if the corresponding element in x is NA.
z <- c(1,2,3,NA)
z
ind <- is.na(z)
ind

# Note that there is a second kind of "missing" 
# produced by numerical computation, Not a Number,
# or NaN, values. 

# Examples are
m <- 0/0
n <- Inf - Inf

# which both give NaN since the result cannot
# be defined sensibly.

# In summary, is.na(xx) is TRUE both for NA 
# and NaN values.
is.na(c(m,n,NA))
is.nan(c(m,n,NA))

# is.nan(xx) is only TRUE for NaNs.
is.nan(c(m,n,NA))

##### 2.6 Character vectors
# Character quantities and character vectors are
# used frequently in R, for example as plot labels.

# Character strings are entered using either matching
# double (") or single (') quotes, but are printed 
# using double quotes (or sometimes without quotes). 

# Character vectors may be concatenated into a vector 
# by the c() function; examples of their use will 
# emerge frequently.

# The paste() function takes string arguments 
# and concatenates them one by one into
# character strings. Any numerics in the 
# arguments are coerced into character strings. 

# The arguments are by default separated in the 
# result by a single blank character.

# For example
labels <- paste(c("X","Y"), 1:10, sep="")
labels

# makes labels into the character vector

# c("X1", "Y2", "X3", "Y4", "X5", "Y6", "X7", "Y8", "X9", "Y10")

# Note the recycling; c("X", "Y") is repeated

##### 2.7 Index vectors; selecting and modifying subsets of a data set

# Subsets of the elements of a vector may be selected 
# or filtered using brackets '[]' 

#### Can be a logical filter
# Values corresponding to TRUE in the index vector
# are selected and those corresponding to FALSE 
# are omitted. For example
z <- c(21, 13, NA, 58, NA)

# do it piecemeal
is.na(z)

# ! negates the above
!is.na(z)

# can use the T-F vector to select
# only the non-NA values in the vector
z[!is.na(z)]
y <- z[!is.na(z)]

# creates (or re-creates) an object y which will 
# contain the non-missing values of z, in the
# same order. Note that if z has missing values,
# y will be shorter than z.

#### Can filter indexes with vector of positive values 

# In this case the values in the index vector must lie
# in the set {1, 2, . . . , length(x)}. 
 
# The index vector can be of any length and the
# result is of the same length as the index vector. 

# create some numbers
(aa <- rnorm(20, mean=30, sd=10))
length(aa)
mean(aa)
sd(aa)

# select elements 7 through 17, 4 through 10
# and 15 through 20 from aa
aa[c(7:17,4:10,15:20)]

# or, another extreme example
c(1,2,2,1)
c("x","y")
rep(c(1,2,2,1), times=4)
c("x","y")[rep(c(1,2,2,1), times=4)]

# produces a character vector of length 16 
# consisting of "x", "y", "y", "x" repeated four times.

##### Index can be a vector of values to exclude 

# Such an index vector specifies the values to be
# excluded rather than included. Thus
(v <- 20:1)
y <- v[-(1:5)]
v   # note that y is unchanged
y   # y excludes first 5 elements of v

##### Indexes can be vector of character strings. 
# Only possible with named attributes

# can use a sub-vector of the names vector
fruit <- c(5, 10, 1, 20)
fruit
class(fruit)
names(fruit) # the names attribute is NULL
# put in names
names(fruit) <- c("orange", "banana", "apple", "peach")
fruit
# can index them now by the name of the element
fruit["orange"]
# here we subset fruit according to names
(lunch <- fruit[c("apple","orange")])

# An indexed expression can also appear on the
# receiving end of an assignment, in which case
# the assignment operation is performed only on 
# those elements of the vector. 

# For example
z <- c(21, 13, NA, 58, NA)
z
z[is.na(z)] <- 0
z
# Another example
y <- -10:10
# y goes from -10 to +10
y
# rearrange y with same elements
yy <- sample(y)
# mixes it up randomly
yy
# which elements are negative?
yy < 0 # by TRUE or FALSE by index
# what are values of negative elements
yy[yy < 0]
# we reverse those values
-yy[yy < 0]
# yy is still unchanged
yy
# copy yy to zz
zz <- yy
yy
zz
# can also check by
identical(yy,zz)
# replaces any negative values in yy by positive values
yy[yy < 0] <- -yy[yy < 0]
yy
zz
# has the same effect as
zz <- abs(zz)

# DATA: OBJECTS AND CLASSES
a <- 1 # Create an object "a" and
# assign to it the value 1.
a <- 1.5 # Wipe out the 1 and make it 1.5 instead.
class(a) # What class is it?
# [1] "numeric"
class(a) <- "character" # Make it a character
class(a) # What class is it now?
# [1] "character"
a
# [1] "1.5"
a <- "Andrew" # Wipe out the 1.5 and make it "Andrew" instead.
b <- a # Create an object "b" and assign to it
# whatever is in object a.
a <- c(1,2,3) # Wipe out the "Andrew" and make it a vector
# with the values 1, 2, and 3.
# Never make c an object!
b <- c(1:3) # Wipe out the "Andrew" and make it a vector
# with the values 1, 2, and 3.
b <- mean(a) # Assign the mean of the object a to the object b.
ls() # List all user-created objects
# [1] "a" "b"

rm(b,lunch,x,s5) # Remove b
# A couple of points are noteworthy: we didn't 
# have to declare the variables as being any particular
# class. R coerced them into whatever was appropriate. 

# Also we didn't have to declare the length of the
# vectors. That is convenient for the user.


##### Classes of Data

# There are two fundamental kinds of data: 
# numbers and strings (anything that is not a
# number is a string). There are several types
# of strings, each of which has unique properties.

# R distinguishes between these different 
# types of object by their class.

# R knows what these different classes are 
# and what each is capable of. You can find
# out what the nature of any object is using 
# the class() command. 

# Alternatively, you can ask if it is a 
# specific class using the is.className() command. 

# You can often change the class too, 
# using the as.className() command. 

# This process can happen by default, in which case 
# it is called coercion.

##### Numeric
# A number can be an integer or a real number. 

# R can generally tell the difference between them 
# using context. 

# But you check the class by is.numeric() and 
# you can change the class with as.numeric(). 

# R also handles complex numbers but we will ignore them. 

# We can do all the usual things with numbers:
a <- 2 # create variable a, assign the number 2 to it.
class(a) # what is it?
# [1] "numeric"
is.numeric(a) # is it a number?
# [1] TRUE
b <- 4 # create variable b, assign the number 4 to it.
a + b # addition
# [1] 6
a - b # subtraction
# [1] -2
a * b # multiplication
# [1] 8
a / b # division
# [1] 0.5
a ^ b # exponentiation
# [1] 16
(a + b) ^ 3 # parentheses
# [1] 216
a == b # test of equality (returns a logical)
# [1] FALSE
a < b # comparison (returns a logical)
# [1] TRUE
max(a,b) # largest
# [1] 4
min(a,b) # smallest
# [1] 2


### String

# A string is a collection of one or more alphanumerics, 
# denoted by double quotes. We check whether or not our
# object is a string by is.character() and change to by 
# as.character(). 

# R provides numerous string manipulation functions, 
# including search capabilities.
a <- "string" # create variable a, assign the value "string" to it.
class(a) # what is it?
# [1] "character"
is.numeric(a) # is it a number?
# [1] FALSE
is.character(a) # is it a string?
# [1] TRUE
b <- "spaghetti" # create variable b, assign the value "spaghetti" to it.
paste(a, b) # join the strings
# [1] "string spaghetti"
paste(a, b, sep="") # join the strings with no gap
# [1] "stringspaghetti"
d <- paste(a, b, sep="")
substr(d, 1, 4) # subset the string
# [1] "stri"


##### Factor

# Factors represent categorical variables. They can be
# ordered categories (ordered factors "ordinal") or
# just plain categories ("nominal" like male-female).

# In practice, factors are not that different from strings, 
# except they can take only a limited number of values,
# which R keeps a record of, and R knows how to do very
# useful things with them. 

# We can check whether or not an object is a factor 
# using is.factor() and change it to a factor
# using factor().

# Even though R reports the results of operations upon
# factors by the levels that we assign to them, R
# represents factors internally as an integer. 

# Therefore, factors can create considerable heartburn
# unless they're closely watched. 

# This means: whenever you do an operation involving a 
# factor you must make sure that it did what you wanted,
# by examining the output and intermediate steps. 

# For example, factor levels are ordered alphabetically
# by default. This means that if your levels start 
# with numbers, as many plot identifiers do, you 
# might find that R thinks that plot 10 comes 
# before plot 2. 

# Not a problem, if you are aware of it!
a <- c("A","B","A","B") # create vector a
class(a) # what is it?
# [1] "character"
is.character(a) # is it a string?
# [1] TRUE
is.factor(a) # is it a factor?
# [1] FALSE
a <- factor(a) # make it so
levels(a) # what are the levels?

# [1] "A" "B"
table(a) # what are the counts?
a
# A B
# 2 2
a <- factor(c("A","B","A","B"), levels=c("B","A"))
a

# Sometimes it will be necessary to work with
# a subset of the data, perhaps for convenience, 
# or maybe because some levels of a factor 
# represent irrelevant data. 

# If we subset the data then it will often be
# necessary to redefine any factors in the dataset,
# to let R know that it should drop the levels that
# are missing.


# We will discuss factors much more when we start
# manipulating vectors (Section 6.3.1).

##### Logical

# A special kind of factor, that has only two levels: 
# True and False. Logical variables are set apart from
# factors in that these levels are interchangeable
# with the numbers 1 and 0 (respectively) via coercion.

# The output of several useful functions are logical
# (also called boolean) variables. We can construct 
# logical statements using the and (&), or (j), 
# not (!) operators.
a <- 2 # create variable a, assign the number 2 to it.
b <- 4 # create variable b, assign the number 4 to it.
d <- a < b # comparison
class(d) # what is it?
# [1] "logical"
e <- TRUE # create variable e, assign the value TRUE to it.
d + e # what should this do?
# [1] 2
d & e # d AND e is True
# [1] TRUE
d | e # d OR e is also True
# [1] TRUE
d & !e # d AND (NOT e) is not True
# [1] FALSE
# We can ask for the vector subscripts of all objects
# for which a condition is true via which().


##### Missing Data

# The last and oddest kind of data is called a 
# missing value (NA). This is not a unique class, 
# strictly speaking. They can be mixed in with all
# other kinds of data. It's easiest to think of them 
# as place holders for data that should have been there, 
# but for some reason, aren't. 

# Unfortunately their treatment is not uniform in 
# all the functions. Sometimes you have to tell 
# the function to ignore them, and sometimes you
# do not. 

# And, there are different ways of telling the 
# function how to ignore them depending on who
# wrote the function and what its purpose is.

# There are a few functions for the manipulation
# of missing values. We can detect missing values by
# is.na().
a <- NA # assign NA to variable A
is.na(a) # is it missing?
#[1] TRUE
class(a) # what is it?
# [1] "logical"
a <- c(11,NA,13) # now try a vector
mean(a) # argh!
# [1] NA
mean(a, na.rm=TRUE) # Phew! We've removed the missing value
# [1] 12
is.na(a) # is it missing?
# [1] FALSE TRUE FALSE


# We can identify the complete rows 
# (ie rows that have no missing values) from
# a two-dimensional object with
# complete.cases() command.


########################################################
##### If we have time to spare, we will continue
##### This next section is a preview on data structures.

##### Structures for Data

# Having looked at the most important data types,
# let's look at the mechanisms that we have for 
# their collective storage and manipulation. 

# This is just a preview: Some data structures are 
# (matrix, list) very useful.

##### Vector

# A vector is a one-dimensional collection of atomic
# objects (atomic objects are objects which can't be
# broken down any further) of the same class. 

# Vectors can contain numbers, characters, factors, 
# or logicals. 

# All the objects that we created earlier were vectors,
# although some were of length 1. The key to vector
# construction is that all the objects must be of
# the same class. 

# The key to vector manipulation is in using subscripts,
# or indices (elements in a vector may also be named).

# subscripts are accessed with the square brackets [ ].

a <- c(11,12,13) # a is a vector
a[1] # the first object in a
# [1] 11
a[2] # the second object in a
# [1] 12
a[-2] # a, but without the second object
# [1] 11 13
a[c(2,3,1)] # a, but in a different order
# [1] 12 13 11
a + 1 # Add 1 to all the elements of a
# [1] 12 13 14
length(a) # the number of units in the vector a
# [1] 3
order(c(a,b)) # return the indices of a and b in increasing order
# [1] 4 1 2 3
c(a,b)[order(c(a,b))] # return a and b in increasing order
# [1] 4 11 12 13
a <- c(11,NA,13) # a is still a vector
a[!is.na(a)] # what are the elements of a that aren't missing?
# [1] 11 13
which(!is.na(a)) # what are the locations of the non-missing elements of a?
# [1] 1 3

# Notice that in a[!is.na(a)], for example, we were
# able to nest a vector inside the subscript mecha-
# nism of another vector! 

# This example also introduces a key facility in R 
# for efficient processing: vectorization.

##### Vectorization

# The concept underlying vectorization is simple: 
# to make processing more efficient. Recall that when
# we applied the is.na() function to the vector a 
# it resulted in the function being applied to
# each element of the vector, and the output
# itself being a vector, without the user 
# needing to intervene.


# This is vectorization.

# Imagine that we have a set of 1,000,000 tree 
# diameters and we need to convert them all to 
# basal area.

# In C or Fortran we would write a loop. 

# The R version of the loop would look 
#  like this (wrapped in a timer).

diameters <- rgamma(n=1000000, shape=2, scale=20)
basal.areas <- rep(NA, length(diameters))
system.time(
  for (i in 1:length(diameters)) {
    basal.areas[i] <- diameters[i]^2 * pi / 40000
  }
)

# user system elapsed
# 5.621 0.038 5.917

# That took just over three seconds on my quite
# old computer. However, if we vectorize the operation,
# it becomes considerably faster.

system.time(
  basal.areas <- diameters^2 * pi / 40000
)

# user system elapsed
# 0.070 0.021 0.092

# It's about forty to fifty times faster. 
# Of course, had we programmed this function
# in C or Fortran, the outcome would have been
# much faster still. The R programming mantra 
# might be: compile only if you need to, loop only
# if you have to, and vectorize all the time.

# Vectorization only works for some functions; 
# e.g. it won't work for mean(), because that would 
# make no sense; we want the mean of the numbers 
# in the vector, not the mean of each individual unit. 

# But, when vectorization works it makes life easier, 
# code cleaner, and processing time faster.

# Note that pi is a single value, and not of 
# length 106, and R assumed that we would like it
# repeated 106 times. This is called recycling.

##### Recycling

# You may have noticed above that R provided a 
# convenience for the manipulation of vectors. 

# When we type
a <- c(11, 12, 13)
a + 1
# [1] 12 13 14
# R assumed that we wanted to add 1 to each 
# element of a. This is called recycling, and 
# is usually very useful and occasionally very
# dangerous. R recycled 1 until it had the same 
# length as a. interpreted the function as:
a + c(1, 1, 1)
# [1] 12 13 14
# For a further example, if we want to convert
# all the numbers in a vector from inches to 
# centimeters, we simply do
(a <- a * 2.54)
# [1] 27.94 30.48 33.02

# Recycling can be dangerous because sometimes
# we want the dimensions to match up exactly, 
# and mismatches will lead to incorrect computations.

# If we fail to line up our results exactly
# for example, because of some missing values,
# R will go ahead and compute the result anyway. 

# The only way to be sure is to watch for warnings, 
# examine the output carefully, and keep in mind 
# that most of the time this facility is helpful.

a + c(1, -1)
# [1] 28.94 29.48 34.02