##############################################
#####     Manipulation of Numbers and    #####
#####          Vectors Exercises         #####
##############################################

# Manipulation of Numbers and Vectors Exercises

# 1) You keep track of your mileage each time you 
# fill up your automobile. At your last 6 fill-ups 
# the mileage was: 65311  65624  65908  66219  66499
# 66821  67145  67447

# Enter these numbers into a vector using R. 
# Use the function diff() on the data. 
# What does it indicate?
?diff

miles = c(65311, 65624, 65908, 66219, 66499, 
          66821, 67145, 67447)
(diff.miles = diff(miles))

# You should see the number of miles between fill-ups. 
# Use the max() function to find the maximum number 
# of miles between fill-ups, the mean function to 
# find the average number of miles and the min() 
# function to get the minimum number of miles.

(big.diff = max(diff.miles))
(ave.diff = mean(diff.miles))
(min.diff = min(diff.miles))

# 2) Suppose you track your commute times for two 
# weeks (10 days) and you find the following times 
# in minutes: 17 16 20 24 22 15 21 15 17 22

# Enter this into R. Use the function max() to find 
# the longest commute time, the function mean to find
# the average and the function min to find the minimum.
(commute = c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22))

(long.comm = max(commute))
(ave.comm = mean(commute))
(min.comm = min(commute))

# What is the variance of this vector of commute times?
var(commute)

# The standard deviation?
sd(commute)

# Oops, the 24 was a mistake. It should have been 18. 
# How can you fix this? Do so, and then find the 
# new average.
mean(commute)

commute==24 # returns vectors of T and F
which(commute==24) # returns index of TRUE ones
commute[which(commute==24)] <- 18 # change value to 18
commute[4]  # check that one
commute     # look at vector again

# How many times was your commute 20 minutes or more? 
sum(commute >= 20) # performs logical arithmetic

# What do you get? 

# What percent of your commutes are less than 
# 17 minutes? How can you answer this with R?

round((sum(commute < 17)/length(commute))*100)

# 3) Your cell phone bill varies from month to 
# month. Suppose your year has the following 
# monthly amounts: 46 33 39 37 46 30 48 32 49 35 30 48

# Enter this data into a variable called bill. 

(bill = c(46, 33, 39, 37, 46, 30, 48, 32, 49, 35, 30, 48))

# Use the sum command to find the amount you spent this year
# on the cell phone. 
sum(bill)

# What is the smallest amount you spent in a month? 
min(bill)

# What is the largest? 
max(bill)

# How many months was the amount greater than $40? 
sum(bill>40)

# What percentage was this?
round(sum(bill>40)/length(bill)*100,2)

# 4) Try to guess the results of these R commands. 

# Suppose we assume:
x = c(1,3,5,7,9)
y = c(2,3,5,7,11,13)

# Guess the value first, than try it out in R:
# 1. x+1
x+1
# 2. y*2
y*2
# 3. length(x) and length(y)
length(x)
length(y)
# 4. x + y
x+y
# 5. sum(x>5) and sum(x[x>5])
sum(x>5)
sum(x[x>5])
# 6. sum(x>5 | x< 3) # read | as 'or', & and 'and'
# this just counts the indexes of TRUE:
sum(x>5 | x<3) # read | as 'or', & and 'and'
# this command adds the indexes:
sum(which(x>5 | x<3)) # read | as 'or', & and 'and'
# this adds the values:
sum(x[which(x>5 | x<3)]) # read | as 'or', & and 'and'
# 7. y[3]
y[3]
# 8. y[-3]
y[-3]
# 9. y[x] (What is NA?)
y[x]
# 10. y[y >= 7]
y[y >= 7]
