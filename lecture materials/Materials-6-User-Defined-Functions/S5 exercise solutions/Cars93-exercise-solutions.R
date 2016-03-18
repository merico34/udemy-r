############################################################
#####     TUHH COURSE ANSWERS TO CARS 93 EXERCISES     #####
############################################################

# can also gets Cars93 from MASS package:
library("MASS") # load MASS package
attach(Cars93) # move Cars93 to #2 position in search space
search()
# print (list) out entire Cars93 data frame
Cars93
 
# print out first 6 records
head(Cars93)
 
# variable names in Cars93
names(Cars93)

# show names, data types of every column in Cars93
str(Cars93)

# how many different data types?
# are 3 data types: int, Factor, numeric

# how many rows?
nrow(Cars93) # 93 rows

# how many columns ?
ncol(Cars93) # 27 columns

# Print (list) out first 28 rows, but only columns 1-8
Cars93[1:28,1:8]

# Appears to be sorted by Manufacturer, ascending from A to Z

# put the subset above in a 'my.car.data' data frame
my.car.data <- Cars93[1:28,1:8]
my.car.data

# Make subsets of Cars93 for Chevrolet, Dodge, Nissan
# How many rows in each one ?
Chevrolet <- Cars93[Manufacturer=="Chevrolet",]
Chevrolet
nrow(Chevrolet)
# eight rows

Dodge <- Cars93[Manufacturer=="Dodge",]
Dodge
nrow(Dodge)
# six rows

Nissan <- Cars93[Manufacturer=="Nissan",];Nissan;nrow(Nissan)
# four rows

# What Make & Model gets the best MPG on the highway? In the city?
head(Cars93[rev(order(MPG.city)),1:8]) # sorts by MPG.city from high to low
head(Cars93[rev(order(MPG.highway)),1:8]) # sorts by MPG.highway from high to low
# Geo Metro for both: 46 MPG City and 50 MPG Highway

# Print out 'Max.price' column from Cars93
Cars93[,6]
# Is a vector, it saves space, but vectors are actually columns in terms of their structure.

# What is Class of 'Max.price' column?
class(Cars93[,6])
# Is numeric

# What is Class of the sixth row of Cars93?
class(Cars93[6,])
# Is a data frame...columns must all be of the same data type,
# but a row has elements from different columns, each of which 
# may be a different data type. Also, if you strip out a row
# from a data frame object, or a subset of rows from a data
# frame object, the class of the resulting structure will also
# always be of data.frame class (unless you 'coerce' it otherwise).

## Use 'my.car.data' data frame for following questions
## Don't forget to detach Cars93
detach(Cars93)
search()
## attach my.car.data
attach(my.car.data)
search()

# note that my.car.data is now in #2 search position

# Print out the three price columns (columns 4, 5 and 6) but only
# Rows 1, 3, 5 and 6
my.car.data[c(1,3,5,6),4:6]

# OR

my.car.data[c(1,3,5,6),c(4,5,6)]

# Do it again but reverse the order of the columns
# And reverse the order of the rows
my.car.data[c(6,5,3,1),6:4]

# Print out exactly the first ten records of ‘my.car.data’ in reverse order, 
# randomly selecting and rearranging any 6 (and only 6) of the 8 total columns.
# what is going on here?
my.car.data[10:1,sample(1:8,6)]

# Is a random permutation of 6 of the 8 columns,
# putting them in a different order each time.
# Function sample() does this. For Manufacturer to show
# up first, it must first be selected in the six of eight,
# but then be the first column randomly selected in the 6 of 8.
# Probability of Manufacturer being selected at all is
# close to 75%, but probability of Manufacturer being
# selected as the first random choice of the 6 is smaller.
# Still, in ten tries, the probability that Manufacturer
# will show first at least once is pretty good, > 50%

# Print out my.car.data Z to A Manufacturer, 
# but low to high (worst to best) MPG.city
my.car.data[rev(order(Manufacturer,-MPG.city)),]

# Corvette is not the worst ! It is the Astro !

# select cars with City.MPG > 20...which one
# has highest maximum price?
# MPG.city > 20 with highest maximum price
d1 <- my.car.data[MPG.city > 20,]
d1[rev(order(d1$Max.Price)),]

# BMW 535i

# Highway MPG > 26 but cost more than mean of price ?
my.car.data[MPG.highway > 26 & Price > mean(Price),]

# BMW 535i and
# Buick Riviera

# attach 'my.car.data' again. What happens?

attach(my.car.data)
search()
# The attach() command puts ‘my.car.data’ in conflict 
# with itself, blocking its own variables in the search 
# path. This is because of: The database is not actually 
# attached. Rather, a new environment is created on the 
# search path and the elements of a list (including 
# columns of a data frame) or objects in a save file or 
# an environment are copied into the new environment. 
# If you use <<- or assign to assign to an attached database, 
# you only alter the attached copy, not the original object. 
# (Normal assignment will place a modified version in the user's 
# workspace: see the examples.) 
# For this reason attach can lead to confusion.

