################################################
#####    Arrays and Matrices Leftovers     #####
################################################


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

