################################################
#####         Arrays and Matrices          #####
################################################

########### EXERCISE FOR TODAY ###########
# See the BestFirstTutorial PDF in documentation.
# Read and Execute Matrix Scripts pages 6-8 and
# complete the exercises beginning on page 8.
##########################################

##### Left Overs from Session 3

# Suppose we have a sample of 30 tax accountants from 
# all the states and territories of Australia

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

# another example
substring("statistics", 1:10, 1:10)

# what is class?
class(substring("statistics", 1:10, 1:10))

# is a vector?
is.vector(class(substring("statistics", 1:10, 1:10)))

# note is has ten elements, not one
length((substring("statistics", 1:10, 1:10)))

# make it a factor vector
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

# drops the levels that do not occur
(anything. <- factor(ff))
anything.

# ff is still unchanged
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

# Suppose we have incomes of the same 
# tax accountants in another vector
incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69,
             70, 42, 56, 61, 61, 61, 58, 51, 48, 65,
             49, 49, 41, 48, 52, 46, 59, 46, 58, 43)
incomes

# calculate the sample mean income for each state we 
# can now use the special function tapply(): 
?tapply
incmeans <- tapply(incomes, state, mean)

# giving a means vector with the components labelled
# by the levels 
incmeans

# function tapply() is used to apply a function, 
# here mean(), to each group of components of the 
# first argument, here incomes, defined by the levels
# of the second component, here state, as if 
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
incster <- tapply(incomes, state, stderr)

# and the values calculated are then 
incster

###### ARRAYS

# An array is a multiply subscripted 
# collection of data entries, 
# for example numeric.

# A matrix is a specialized 2D array.
# The are 1D arrays, vectors, but only
# if they have a dimension vector as
# its dim attribute.

# Suppose z is a vector of 1500 elements. 
# The assignment
z <- c(1:1500)
z
dim(z) <- c(3,5,100)

# gives it the dim attribute so is treated 
# as a 3 by 5 by 100 array
attributes(z)
z

dim(z) <- c(3,5,10,10)
# gives it the dim attribute so is treated 
# as a 3 by 5 by 10 by 10 array
attributes(z)
z

# are other functions matrix() and array()
# that are more intuitive to use
?array
dim(as.array(letters))

# recycle 1:3 "2 2/3 times"
array(1:3, c(2,4))
#     [,1] [,2] [,3] [,4]
#[1,]    1    3    2    1
#[2,]    2    1    3    2

?matrix
# 1D matrix
as.matrix(1:10)

# is a 10 by 1 matrix
attributes(as.matrix(1:10))

# test if is a matrix
is.matrix(as.matrix(1:10))

# warpbreaks data
warpbreaks

# data.frame, NOT a matrix
!is.matrix(warpbreaks)
warpbreaks[1:10,]

# using as.matrix.data.frame(.) method
as.matrix(warpbreaks[1:10,])

# test it
is.matrix(as.matrix(warpbreaks[1:10,]))

# indexing matrices must be numerical
# or it is treated as an indexing vector
as.matrix(warpbreaks[1:10,])[27]

# this one is numerical
num.mat <- matrix(1:25, nrow=5)
num.mat
num.mat[4,5]
num.mat[24]

# array indexing and subsections
# Arrays are numeric objects with dimension attributes
array <- 1:25
is.matrix(array)
# [1] FALSE

dim(array)
# NULL

# The vector has no (i.e. NULL) dimensional attributes. So:
dim(array) <- c(5,5)
dim(array)
# [1] 5 5

is.matrix(array)
# [1] TRUE

array
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    6   11   16   21
# [2,]    2    7   12   17   22
# [3,]    3    8   13   18   23 
# [4,]    4    9   14   19   24
# [5,]    5   10   15   20   25

is.table(array)
# [1] FALSE

# Three dimensional array of letters
a <- letters[1:24]
dim(a) <- c(4,2,3)
a

# How do these expressions evaluate?:
a[,,1:2]
a[,,3]
a[3,,]

## Example of setting row and column names
dimnames = list(c("row1", "row2"),
                c("C.1", "C.2", "C.3"))
dimnames
mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, 
               byrow = TRUE, dimnames)
mdat

###### INDEX MATRICES

# matrix is a vector with two dimensions
A <- 1:6 # A is a vector at this point
print(A) # same as expressing, or evaluating, A
dim(A) <- c(2,3) # Force vector A to be 2 x 3
print(A) # Now A is a matrix, no longer a vector

# Are several way of making a matrix: 
x <- matrix(1:9,nrow=3)
x
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

# can populate a matrix rowwise
x <- matrix(1:9,nrow=3,byrow=TRUE)
x

# Are several way of making a matrix: 
x <- matrix(1:9,ncol=3)
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

# Make a matrix row-wise with byrow=T: 
vector <- c(1,2,3,4,4,3,2,1)
vector
v <- matrix(vector, byrow=T, nrow=2)
v
#      [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    4    3    2    1

# Another way is to provide vector two dimensions:
dim(vector) <- c(4,2)
vector

# Can check that vector is a matrix:
is.matrix(vector)
# [1] TRUE

# We transpose vector: 
t(vector)
#      [,1] [,2] [,3] [,4]
# [1,]    1    2    3    4
# [2,]    4    3    2    1

# We use rpois: 
x <- matrix(rpois(20,1.5), nrow=4)
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    0    2    5    3
# [2,]    1    1    3    1    3
# [3,]    3    1    0    2    2
# [4,]    1    0    2    1    0

x # NOTE: rpois will return a different set each time
rpois(20,1.5)

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
x
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
array
is.matrix(array)
# [1] FALSE

# Generate a 4 by 5 array.
x <- array(1:20, dim=c(4,5))   
x
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    5    9   13   17
# [2,]    2    6   10   14   18
# [3,]    3    7   11   15   19
# [4,]    4    8   12   16   20

# i is a 3 by 2 index array.
i <- array(c(1:3,3:1), dim=c(3,2))
i                            
#      [,1] [,2]
# [1,]    1    3
# [2,]    2    2
# [3,]    3    1

# extract elements
x[i]
# [1] 9 6 3

# Replace those elements by zeros.
x[i] <- 0   
x
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    5    0   13   17
# [2,]    2    0   10   14   18
# [3,]    0    7   11   15   19
# [4,]    4    8   12   16   20

# Negative indices are not allowed in index matrices. 
# NA and zero values are allowed: rows in the index 
# matrix containing a zero are ignored, and rows 
# containing an NA produce an NA in the result. 

# suppose we wish to generate an design 
# matrix for a block design defined by factors 
# blocks (b levels) and varieties (v levels). 
b <- 3
v <- 4

# Further suppose there are n plots in the 
# experiment. We could proceed as follows: 
n <- 5
Xb <- matrix(0, n, b)
Xb
Xv <- matrix(0, n, v)
Xv
ib <- cbind(1:n, blocks=b)
ib
iv <- cbind(1:n, varieties=v)
iv
Xb[ib] <- 1
Xv[iv] <- 1
X <- cbind(Xb, Xv)
X

# To construct the incidence matrix, N, we use 
N <- crossprod(Xb, Xv)
N

# a simpler direct way of producing this matrix
# is to use table():  
N <- table(blocks=b, varieties=v)
N

##### MORE ON ARRAY FUNCTION
# As well as giving a vector structure a 
# dim attribute, arrays can be constructed 
# from vectors by the array function
data_vector <- (1:24)
dim_vector <- c(3, 4, 2)
Z <- array(data_vector, dim_vector)
Z

# vector h has 22 elements
h <- 1:22
h

# if the vector h contains fewer than
# 24 numbers then the command 
Y <- array(h, dim=c(3,4,2))
Y

# begins to recycle the elements of h.

# but this throws an error
dim(h) <- c(3, 4, 2)

# makes an array of all zeros
W <- array(0, c(3,4,2))
W

## Outer product of two arrays
# The outer product of the arrays X and Y is 
# the array A with dimension c(dim(X), dim(Y)) 
# The default operator is 

# X %o% Y
# example
x <- 1:9; names(x) <- x
x

# Multiplication & Power Tables
x %o% x
y <- 2:8; names(y) <- paste(y,":", sep = "")
y

# function outer() does same as operator
outer(y, x, "^")

month.abb
1999:2003
outer(month.abb, 1999:2003, FUN = "paste")

## three way multiplication table:
x %o% x %o% y[1:3]

##### cbind() and rbind()
# matrices can be built up from other matrices
# using cbind() and rbind()
?cbind
?rbind

# the '1' (= shorter vector) is recycled
m <- cbind(1, 1:7) 
m

# insert a column
m <- cbind(m, 8:14)[, c(1, 3, 2)] 
m

# vector is subset -> warning
cbind(1:7, diag(3)) 

cbind(0, rbind(1, 1:3))

# use some names
cbind(I = 0, X = rbind(a = 1, b = 1:3)) 
xx <- data.frame(I = rep(0,2))
xx

# named differently
cbind(xx, X = rbind(a = 1, b = 1:3))  

# Warning (making sense)
cbind(0, matrix(1, nrow = 0, ncol = 4)) 

# 2 x 1
dim(cbind(0, matrix(1, nrow = 2, ncol = 0))) 

## deparse.level
dd <- 10

# middle 2 rownames
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 0)

# 3 rownames (default)
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 1) 

# 4 rownames
rbind(1:4, c = 2, "a++" = 10, dd, deparse.level = 2) 

########### EXERCISE FOR TODAY ###########
# See the BestFirstTutorial PDF in documentation.
# Read and Execute Matrix Scripts pages 6-8 and
# complete the exercises beginning on page 8.
##########################################
