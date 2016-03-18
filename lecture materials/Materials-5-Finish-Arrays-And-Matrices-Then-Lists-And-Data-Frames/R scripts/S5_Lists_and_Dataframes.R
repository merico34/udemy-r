#################################################
#####         LISTS and DATAFRAMES          #####
#################################################

##### LISTS

# An R list is an object consisting of an ordered 
# collection of objects known as its components.

# Lists, as data structures, are probably the
# most useful and versatile object in R.

# Some unique features: 

# They are heterogeneous, means each component
# can be a different data structure AND type.

# They are recursive, means you can have
# a list within a list.

# For example, the following variable x is a list 
# containing copies of three vectors n, s, b, and
# a numeric value (in a vector) 3. 

n <- c(2, 3, 5) 
s <- c("aa", "bb", "cc", "dd", "ee") 
b <- c(TRUE, FALSE, TRUE, FALSE, FALSE) 
x <- list(n, s, b, 3)   # x contains copies of n, s, b 
x

# List Slicing

# We retrieve a list slice with the single 
# square bracket "[]" operator. The following 
# is a slice containing the second member of x, 
# which is a copy of s. 

x[2] 
# [[1]] 
# [1] "aa" "bb" "cc" "dd" "ee" 

# With an index vector, we can retrieve a slice
# with multiple members. Here a slice containing 
# the second and fourth members of x.

# note this returns a list of second
# and fourth component
x[c(2, 4)]
# [[1]] 
# [1] "aa" "bb" "cc" "dd" "ee" 

# [[2]] 
# [1] 3 

# List Member Reference

# In order to reference a list member directly, 
# we have to use the double square bracket "[[]]" 
# operator. The following object x[[2]] is the 
# second member of x. In other words, x[[2]] is
# a copy of s, but is not a slice containing s or its copy. 

x[[2]] 
# [1] "aa" "bb" "cc" "dd" "ee" 

# We can modify its content directly. 

x[[2]][1] = "ta" 
x[[2]] 
# [1] "ta" "bb" "cc" "dd" "ee" 

# s is unaffected
s 
# [1] "aa" "bb" "cc" "dd" "ee"

#### CRAN 'An Introduction to R' Manual:

# An R list is an object consisting of an ordered 
# collection of objects known as its components. 

# can be different mode, type and/or structure
  
Lst <- list(name="Fred", 
            wife="Mary", 
            no.children=3, 
            child.ages=c(4,7,9))
Lst

# Components are always numbered. So Lst is name of list,
# can refer to components as Lst[[1]], Lst[[2]], Lst[[3]] and Lst[[4]]. 
# If, further, Lst[[4]] is an array then Lst[[4]][1] is first entry. 

Lst[[1]]
Lst[[2]]
Lst[[3]]
Lst[[4]]
Lst[[4]][1]

Lst$name # the same as Lst[[1]] and is the string "Fred", 
Lst$wife # the same as Lst[[2]] and is the string "Mary", 
Lst$child.ages[1] # the same as Lst[[4]][1] and is the number 4. 

# can also do
Lst[["name"]]
Lst[["wife"]]

### Constructing and Modifying lists

x <- 1:10
y <- c("a","b","c")
z <- TRUE
x
y
z
# all different types
a <- list(x,y,z)
a

# another list
mat1 <- matrix(1:30,nrow=5,byrow=TRUE)
mat1
lst1 <- a
lst1
big.list <- list(mat1,lst1)

# lists are recursive
big.list

# and are of mode "list"
mode(big.list)

# can name the components
named.big.list <- list(first=mat1, second=lst1)

# second (lst1) was already a list
named.big.list

# this is a list
named.big.list[["second"]]

# can add a new component to any list

# is a matrix
named.big.list[[1]]

# is a list
named.big.list[[2]]

# get error because there is no third component
named.big.list[[3]]

# so we give it one
named.big.list[[3]] <- list(one=matrix(1:20,ncol=4),two=1:5)
named.big.list[[3]]
# now look at entire named.big.list
named.big.list

# add another component
named.big.list[["fourth"]] <- named.big.list[3]
named.big.list

# lists are very useful in all functions
# which can only return one object...so
# you build a list within the function
# and return the list....we will look at
# this later.

##### DATA FRAMES (dfs)

# A data frame is a list with class "data.frame".

# There are restrictions on lists that may be 
# made into data frames, namely:

# 1) The components must be vectors, factors but can
#    also be numeric matrices, lists or other dfs

# 2) Where matrices, lists and dfs provide as many
#    many variables to the new df as they have
#    columns, elements, variables, respectively.

# 3) Numeric vectors, logicals and factors are
#    included as is. Character vectors are coerced
#    into factors.

# 4) Vector structures appearing as variables of
#    the df must all have same length, and matrix
#    structures must all have the same row size.

### Making data frames

# Simplest way is with read.table() and read.csv()
# They read in tabular data and coerce a df

# Do 3) above first:

a <- letters
b <- 1:26
c <- rep(c(sample(c(rep(TRUE, 13),rep(FALSE,13)))))

# three vectors, all of different types
a;b;c

# include them as variables in a df
my.df <- data.frame(a,b,c)

# note df always has row names and column names
my.df

# vector a (first column) has been
# coerced in a factor vector w/ 26 levels
my.df[,1]

# a df is also a list
my.df[[1]]

# Do 4) above

# d is too short
d <- letters[1:24]

# get an error, does not recycle
my.df1 <- data.frame(a,d,c)

e <- 5:1
f <- 25:21
g <- 12:8

# more parlor tricks
my.df2 <- data.frame(e,f,g)
my.df2
my.df2[,1]
my.df2[,2]
my.df2[,3]
my.df2[[3]]
# make a matrix
my.df[[2]]
# just use 15 elements
my.df[[2]][1:15]
# make it a matrix with 3 columns
matrix(my.df[[2]][1:15], ncol=3)

# demonstrate rules 1) and 2) above

# add the matrix as the fourth 
# component of the data frame
my.df2[[4]] <- matrix(my.df[[2]][1:15], ncol=3)
my.df2
# add the above df as first component
my.df2[[1]] <- my.df2
my.df2

# similarly, could add a list but
# these tricks have little practical
# use or value

