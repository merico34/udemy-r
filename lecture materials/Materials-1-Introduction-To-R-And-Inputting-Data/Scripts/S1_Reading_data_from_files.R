#########################################
#####        Reading in Data        #####
#########################################

# Can read in data from .txt and .csv files on 
# your computer, from the keyboard, from the 
# Internet, from databases, from R itself, 
# from other R packages, from proprietary
# files (SAS, SPSS), and from most connections.

# Can also EXPORT files, reversing most of the
# above capabilities

##### FROM FILES

# read.table() and read.csv() are the 'workhorse functions'.
# also scan() ... some say is more primitive, but is
# actually quite versatile.

# file.choose() is a handy complementary 
# function for reading in data.

# read.table() function: For reading in external files
# works for any connection....external hard drive....
# over the Internet.....anywhere data can be accessed

# read.table() is designed to read space-separated
# external text (ASCII) files with free-formatted
# data and to create a data frame
?read.table

# The read.table function will let you read in any 
# type of delimited ASCII file. It can read in both
# numeric and character values. This is by far the 
# easiest and most reliable method of entering data into R.

# NOTE: Some examples from http://www.ats.ucla.edu/stat/r/modules/raw_data.htm

# complete data, space delimited, variable names in first row

test <- read.table("http://www.ats.ucla.edu/stat/data/test.txt", header = TRUE)
test

##    prgtype gender  id ses schtyp level
## 1  general      0  70   4      1     1
## 2   vocati      1 121   4      2     1
## 3  general      0  86   4      3     1
## 4   vocati      0 141   4      3     1
## 5 academic      0 172   4      2     1
## 6 academic      0 113   4      2     1
## 7  general      0  50   3      2     1
## 8 academic      0  11   1      2     1

# The default delimiter in read.table() is the space 
# delimiter, but this could create problems if there 
# are missing data. The function will not work 
# unless every data line has the same number of 
# values. Iff there are missing data, the data lines
# will have different number of values, and you will
# receive an error. 

# If there are missing values the easiest way to 
# fix this problem is to change the type of delimiter. 
# In the read.table() function the sep argument is 
# used to specify the delimiter.

# showing the file with missing values, space delimited (test_missing.txt data file)
# prgtype  gender  id  ses schtyp  level
# general       0  70    4      1      1
# vocati        1 121    4             1
# general       0  86                  1
# vocati        0 141    4      3      1
# academic      0 172    4      2      1
# academic      0 113    4      2      1
# general       0  50    3      2      1
# academic      0  11    1      2      1

# throws errors:
test.missing <- read.table("http://www.ats.ucla.edu/stat/data/test_missing.txt",
                           header = TRUE)

## Error: line 2 did not have 6 elements

# showing the file with missing data, comma delimited (test_missing_comma.txt data file)
# prgtype,  gender,  id,  ses, schtyp,  level
# general,       0,  70,    4,      1,      1
# vocati,        1, 121,    4,       ,      1
# general,       0,  86,     ,       ,      1
# vocati,        0, 141,    4,      3,      1
# academic,      0, 172,    4,      2,      1
# academic,      0, 113,    4,      2,      1
# general,       0,  50,    3,      2,      1
# academic,      0,  11,    1,      2,      1

# tell it there is a comma separatpr
test.missing <- read.table("http://www.ats.ucla.edu/stat/data/test_missing_comma.txt",
                            header = TRUE, sep = ",")
test.missing
?read.table
##     prgtype gender  id ses schtyp level
## 1   general      0  70   4      1     1
## 2    vocati      1 121   4     NA     1
## 3   general      0  86  NA     NA     1
## 4    vocati      0 141   4      3     1
## 5  academic      0 172   4      2     1
## 6  academic      0 113   4      2     1
## 7   general      0  50   3      2     1
## 8  academic      0  11   1      2     1

# file.choose() lets you interactively drill down
# onto your hard drive and choose a file path
file.choose()

# you can assign a file path to a variable
# make it a .txt file
myfilepath <- file.choose()
# what is path
myfilepath
# put path as argument to read.table
read.table(myfilepath, header=TRUE)
# assign it to a variable
dat <- read.table(myfilepath, header = TRUE)
# look at file
dat

# or, more simply
dat <- read.table(file.choose(), header = TRUE)
dat
# How many rows and columns?
dim(dat)

# what is structure of file?
str(dat)

# to see just first six lines
head(dat)

# to see last six lines
tail(dat)

############################################

### the read.csv() function

# Another very common type of file is the comma delimited
# file. The next file has been saved out of Excel as a 
# comma delimited file. This file can be read in by the 
# read.table function by using the sep option, but it 
# can also be read in by the read.csv function which 
# was written specifically for comma delimited files.

# We use the print function to display the contents 
# of the object test.csv just to show its use.

test.csv <- read.csv("http://www.ats.ucla.edu/stat/data/test.csv", 
                     header = TRUE)

print(test.csv)
#same as
show(test.csv)
# really same command as
test.csv

# this is a bit different
View(test.csv)

##    prgtype gender  id ses schtyp level
## 1  general      0  70   4      1     1
## 2   vocati      1 121   4      2     1
## 3  general      0  86   4      3     1
## 4   vocati      0 141   4      3     1
## 5 academic      0 172   4      2     1
## 6 academic      0 113   4      2     1
## 7  general      0  50   3      2     1
## 8 academic      0  11   1      2     1

#can read same file, a .csv file with read.table()
test.csv1 <- read.table("http://www.ats.ucla.edu/stat/data/test.csv", 
                        header = TRUE, sep = ",")

print(test.csv1)

##    prgtype gender  id ses schtyp level
## 1  general      0  70   4      1     1
## 2   vocati      1 121   4      2     1
## 3  general      0  86   4      3     1
## 4   vocati      0 141   4      3     1
## 5 academic      0 172   4      2     1
## 6 academic      0 113   4      2     1
## 7  general      0  50   3      2     1
## 8 academic      0  11   1      2     1

# It is, of course, also possible to use the read.table 
# function for reading in files with other delimiters. 
# The next file has semicolon delimiters, followed by
# a dataset that uses the letter "z" as a delimiter, 
# both of which are acceptable delimiters in R.

test.semi <- read.table("http://www.ats.ucla.edu/stat/data/testsemicolon.txt",
                        header = TRUE, sep = ";")
print(test.semi)


##    prgtype gender  id ses schtyp level
## 1  general      0  70   4      1     1
## 2   vocati      1 121   4      2     1
## 3  general      0  86   4      3     1
## 4   vocati      0 141   4      3     1
## 5 academic      0 172   4      2     1
## 6 academic      0 113   4      2     1
## 7  general      0  50   3      2     1
## 8 academic      0  11   1      2     1

# next file has 'z' as delimiters

# "prgtype"z"gender"z"id"z"ses"z"schtyp"z"level"
# "general"z0z70z4z1z1
# "vocati"z1z121z4z2z1
# "general"z0z86z4z3z1
# "vocati"z0z141z4z3z1
# "academic"z0z172z4z2z1
# "academic"z0z113z4z2z1
# "general"z0z50z3z2z1
# "academic"z0z11z1z2z1

test.z <- read.table("http://www.ats.ucla.edu/stat/data/testz.txt", header = TRUE,
                     sep = "z")
print(test.z)


##    prgtype gender  id ses schtyp level
## 1  general      0  70   4      1     1
## 2   vocati      1 121   4      2     1
## 3  general      0  86   4      3     1
## 4   vocati      0 141   4      3     1
## 5 academic      0 172   4      2     1
## 6 academic      0 113   4      2     1
## 7  general      0  50   3      2     1
## 8 academic      0  11   1      2     1

### TO EXPORT (WRITE) FILES
?write.table
?write.csv

###########################################

# Reading in data from the console using the scan() function
?scan

# For very small data vectors it may be handy to read in 
# data directly from the prompt. You can do this with the 
# scan function from the command line. 

# The scan function reads the fields of data in the file
# as specified by the 'what' option, with the default 
# being numeric. If the 'what' option is specified 
# to be what=character() or what=" " then all the 
# fields will be read as strings. 

# If the data are a mix of numeric, string or complex
# data, then a list can be used in the what option. 
# The default separator for the scan function is 
# any white space (single space, tab, or new line). 

# Because the default is space delimiting, you can 
# enter data on separate lines. When all the data 
# have been entered, just hit the enter key twice 
# which will terminate the scanning.

# Reading in numeric data
x <- scan()
# 1: 3 5 6
# 4: 3 5 78 29
# 8: 34 5 1 78
#12:
#  Read 11 items
x
# [1]  3  5  6  3  5 78 29 34  5  1 78

# what is type of data?
mode(x)
# [1] "numeric"

# Reading in string (character) data
# empty quotes indicates character input
y <- scan(what=" ")
# 1: red blue
# 3: green red
# 5: blue yellow
# 7:
#  Read 6 items
y
# [1] "red"    "blue"   "green"  "red"    "blue"   "yellow"

# what is type?
mode(y)
# [1] "character"

### Can also import data files with scan()

# Importing data files using the scan function

# The scan function is a flexible tool for importing data.  
# Unlike the read.table function, however, which returns 
# a data frame, the scan function returns a list or a vector. 

# This makes the scan function less useful for 
# inputting "rectangular" data. 

# Here we input a text file. For the what option, 
# we use list and then list the variables, and 
# after each variable, we tell R what type of 
# variable (e.g., numeric, string) it is. 

# In the first example, the first variable is age, 
# and we tell R that age is a numeric variable by 
# setting it equal to 0. The second variable is called name, 
# and it is denoted as a string variable by the 
# empty quote marks.  

# In the second example, we list NULL first, 
# indicating that we do not want the first variable
# to be read. After using the scan function, we
# use the sapply function, which makes a list out
# of a vector of names in x.

# inputting a text file and outputting a list
# file looks like below, one numeric column other character

# 12 bobby
# 24 kate
# 35 david
# 20 michael

# this command throws an error
x <- scan("http://www.ats.ucla.edu/stat/data/scan.txt")

# read it in as a list with first component numeric
# and second component character
x <- scan("http://www.ats.ucla.edu/stat/data/scan.txt", 
           what = list(age = 0, name = ""))
x

## $age
## [1] 12 24 35 20
## 
## $name
## [1] "bobby"   "kate"    "david"   "michael"

##### ACCESSING BUILT-IN DATASETS
# Around 100 datasets are supplied with R in 
# the package 'datasets', and others are available
# packages supplied with R. 

# To see the list of datasets
data()
?data

# Can also load datasets in specific packages
data("heptathlon") # not found

# need to specify the package
data("heptathlon", package = "HSAUR2")

# is now in workspace
# to assign it to a dataframe
dat <- heptathlon

########## PACKAGE "foreign"

library(foreign)
?read.spss
dat.spss <- read.spss(file.choose(), to.data.frame = T)
dat.spss

# allows you to load in data from SPSS, SAS, Stata
# excel, other proprietary packages

# Here are some of the read and write functions 
# for the foreign package

# read.arff()               Read Data from ARFF Files
# read.dbf()                Read a DBF File
# read.dta()                Read Stata Binary Files
# read.epiinfo()            Read Epi Info Data Files
# read.mtp()                Read a Minitab Portable Worksheet
# read.octave()             Read Octave Text Data Files
# read.spss()               Read an SPSS Data File
# read.ssd()                Obtain a Data Frame from a SAS Permanent
 
# Dataset, via read.xport
# read.systat()             Obtain a Data Frame from a Systat File
# read.xport()              Read a SAS XPORT Format Library
# write.arff()              Write Data into ARFF Files
# write.dbf()               Write a DBF File
# write.dta()               Write Files in Stata Binary Format
# write.foreign()           Write Text Files and Code to Read Them

