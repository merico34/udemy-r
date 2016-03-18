##########################################
##### Answers to Functions Exercises #####
##########################################

# Functions Exercise 1. (a)
tmpFn1 <- function(xVec)
{
  # works due to vectorization:
  xVec^(1:length(xVec))
}

# Always try out your functions on simple
# examples where you know the answer: 
# tmpFn1(1:3) should return
# the vector [1]  1  4 27
tmpFn1(1:4)

# tmpFn1(3:1) should return
# the vector [1] 3 4 1
tmpFn1(3:1)

# tmpFn1(2:5) should return
# the vector [1]   2   9  64 625
tmpFn1(2:5)

# second function
tmpFn2 <- function(xVec)
{
  # also works due to vectorization
  n <- length(xVec)
  (xVec^(1:n))/(1:n)
}

# tmpFn2(1:3) should return
# the vector [1] 1 2 9
tmpFn2(1:3)

# tmpFn2(3:1) should return
# the vector [1] 3.0000000 2.0000000 0.3333333
tmpFn2(3:1)

# tmpFn2(2:5) should return
# the vector [1] 2.00000  4.50000  21.33333 156.25000
tmpFn2(2:5)

# Functions Exercise 1. (b)
tmpFn3 <- function(x, n)
{
  1 + sum((x^(1:n))/(1:n))
}

# tmpFn3(1, 2) should return
# [1] 2.5
tmpFn3(1, 2)

# tmpFn3(3, 2) should return
# [1] 8.5
tmpFn3(3, 2)

# tmpFn3(2, 4) should return
# [1] 11.66667
tmpFn3(2, 4)

# Functions Exercise 2. 
# this is how book author solves it:
tmpFn <- function(xVec) {
  n <- length(xVec)
  (xVec[-c(n-1,n)] + xVec[-c(1,n)] + xVec[-c(1,2)] )/3
}

# I think that solution above is too "opaque"
# It is not evident how it directly maps to
# the problem space. This is how I would address
# the problem in R code:
tmpFn <- function(xVec) {
  n <- length(xVec)
  # create vector object to hold solutions:
  answer <- vector(n-2,mode="numeric")
  for (i in 1:(n-2)) {
    answer[i] <- ((xVec[i]+xVec[i+1]+xVec[i+2])/3)
  }
  # return that vector with the answers
  return(answer)
}

# Note that tmpFn(c(1:5,6:1)) should 
# return the vector:
# [1] 2.000000 3.000000 4.000000 5.000000 5.333333 5.000000 4.000000
# [8] 3.000000 2.000000
tmpFn(c(1:5,6:1))


