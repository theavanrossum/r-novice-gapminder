
# USING R AS A CALCULATOR

# here we are using R as a calculator
1+100
# when we use a hash tag, the line isn't run. This is called a "comment"

# simple math, note the order of operations
3+5*2
3+(5*2)

# look at really small and big numbers
2/100000
2^300
(1+1)^300

#comparing things
1 == 1 # are these equal
1 != 1 # are not equal
1 < 2
1 <= 2
1 > 2
1 > -9

# VARIABLES
prefersCats <- 2 # storing a value in a variable
prefersDogs <- 21
totalInClass <- 30

# variable naming in R
# possible structures
camelCase
to.use.dots
use_underscores
areNumbers123InMiddleOk <- 1

# CANNOT USE variables with these names 
# (no numbers, no dashes, no spaces, no special symbols besides underscore):
# 2bad 
# no-dashes
# no spaces
# specialSymbols? # this causes problems

# if you get a + in the console, 
# click in the console and press Esc

# doing math with variables
totalInClass - prefersCats - prefersDogs

# store the result of math in a variable
noPreference <- totalInClass - prefersCats - prefersDogs
noPreference

diffInPrefs <- prefersCats - prefersDogs
diffInPrefs

# the above hasn't changed the value of the noPreference variable
totalInClass <- 32

diffInPrefs

# FUNCTIONS
abs(diffInPrefs)
?abs # use the ? to get help on a function, note the lack of "()"
# parameters of a function can be a variable 
# or a number
abs(-10)

# DOWNLOADING DATA
# this is a function with named parameters
# we used named parameters to tell R specifically what to do 
# with each piece of information that we are giving it
download.file(url = "https://bit.ly/2pD8vEF", destfile = "../Data/feline-data.csv")
?download.file

# load data
cats <- read.csv(file = "../Data/feline-data.csv")
cats

# this data structure is called a data frame


# COFFEE BREAK
# This morning we saw:
# r as calculator
# variables
# functions

# Now:
# Data structures and data types
cats
class(cats)

# access different parts of dataframe
# using special character $
cats$weight
cats$coat

# this command increases all values in the column
# weight by 2
cats$weight + 2
# add columns
cats$weight + cats$likes_string

cats$weight + cats$coat

# CAUTION this will overwright (change) the weight values in the cats dataframe
cats$weight <- cats$weight + 2
cats

# DATA TYPES

3.14
typeof(3.14) # double is a number with decimal precision
typeof(2L) # use L to indicate integer (no decimals)
typeof(TRUE) # this is a "logical" value T/F
typeof("banana") # words are stores as "character" type

typeof(cats$weight)
typeof(cats$height)
cats$height + 2

cats$height

# VECTORS

# each column in a dataframe is a vector
# vectors must have the same type of data for all entries

myVector <- vector(mode = "character", length = 3)
myVector

typeof(myVector)
str(myVector) # get info on structure

str(cats$weight)

mySecondVector <- c(1,3,5)
mySecondVector
str(mySecondVector)

# we can make a vector with the c() function
# "c" stands for combine
combinedVector <- c('a',0) # lower case c()
combinedVector

# coersion: storing different values as the same type
# variables types are coerced from left to write
# for example: a logical value can be stored as an integer
# logical > integer > numeric > character

TRUE # this is a logical value
logicAndNumber <- c(TRUE,13)
logicAndNumber

# TRUE is stored as 1
# FALSE is stored as 0

charNum <- c('2','5')
charNum
str(charNum) # what is the structure
typeof(charNum) # what is the type

# force R to store these as numbers
as.numeric(charNum)
# coersion functions

cats$likes_string
# we want the likes_string column to represent logical values
cats$likes_string <- as.logical(cats$likes_string)
cats

# shortcut to create a series of numbers using ":"
seriesVector <- 1:10
seriesVector

#functions to see the begining or the end of a vector
head(seriesVector)
tail(seriesVector)

length(seriesVector)

# named elements in your vector
namedVector <- c(5,6,7,8)
namedVector
names(namedVector) <- c("a","b","c","d")
namedVector

1:4
a:z # this doesn't work

# challenge: 
# Start by making a vector with the numbers 1 through 26. 
# Multiply the vector by 2, and 
# give the resulting vector names A through Z 
# (hint: there is a built in vector called LETTERS)

nums <- 1:26
nums <- nums * 2
names(nums) <- c(LETTERS)
nums

# Factors

str(cats$weight)
str(cats$coat)
cats
levels(cats$coat)
typeof(cats$coat)

cats$coat + cats$weight

str(cats)
?read.csv

charClasses <- c('character','character',
                 'numeric','character',
                 'character')

cats <- read.csv(file = "../Data/feline-data.csv",
         colClasses = charClasses)
cats
cats$likes_string <- as.logical(cats$likes_string)
cats
str(cats)

# LISTS
list_example <- list(1, 'a', TRUE)
list_example

typeof(cats)


# Recap
# R
# variables
# functions
# reading in data
# data types: numeric, character, factor, logical
# data structures: vector, list, data frame, (matrix)

# functions we've seen:
str()
typeof()
head()
tail()
list() # makes a list
c(1,2,3) # makes a vector of 3 numbers: 1,2,3
1:3 # makes a vector of 3 numbers: 1,2,3

# SUBSETTING

x <- c(41,42,43,44,45)
names(x) <- c('a','b','c','d','e')
x

x[1] # gives the first element
x[4]
x[c(1,4)]
length(x)
x[6]
x[0]

# everything but
x[-2]
x[c(-1,-4)]
x[1:3]
x[-1:3]
-1:3
-(1:3)
x[-(1:3)]

x

x <- c(5.4, 6.2, 7.1, 4.8, 7.5) 
names(x) <- c('a', 'b', 'c', 'd', 'e') 
print(x)
x[c(2,4)]
x[c(-1,-3,-5)]

# subsetting by name
x[c('b','d')]

# subsetting with logicals
x[c(FALSE,FALSE,TRUE,FALSE,TRUE)]
4 < 7
x < 7

x[ x < 7 ]

# combine logical tests
x
x[x < 6 & x > 4] # & is AND
x[x < 6 | x > 7] # | is OR

c(TRUE,TRUE) & c(TRUE,FALSE)

1 == 2 # == is equal
x == 4.8
1 != 2 # != is not equal
x != 4.8

# these two do the same thing
a <- 5 
a = 5


x <- c(5.4, 6.2, 7.1, 4.8, 7.5) 
names(x) <- c('a', 'b', 'c', 'd', 'e') 

#1. Write a subsetting command to return 
#the values in x that are greater than 4 
#and less than 7.
x[ x > 4 & x < 7 ]

#2. get the values for the letters a and d
x[c("a","d")]

x[-"a"] # error
names(x)
notA <- names(x) != "a"
x[notA]

names(x) != c('a','c')

# the in symbol
names(x) %in% c('a','c')
!(names(x) %in% c('a','c'))

# to get the values from x that are not called a or c
x[ ! (names(x) %in% c('a','c') ) ]

help('!')
help('%in%')

# List subsetting

myList <- list(a = "software",
               b = 1:10,
               dataF = cats)

myList
myList[2] # [ ] gives you a list with 1 element in it
myList[[2]] # [[ ]]  gives the object in a list
myList[-1]

myList[1:2]

myList[2] # this gives list
myList[[2]] # this gives vector

myList$b


xlist <- list(a = "Software Carpentry",
              b = 1:10, data = head(iris))
xlist
#Using your knowledge of both list and vector subsetting, 
#extract the number 2 from xlist. Hint: the number 2 
#is contained within the “b” item in the list.

xlist$b
val10 <- xlist[[2]]
val10
val10[2]

xlist[[2]][2]
xlist$b[2]

xlist[2][2] # ERROR

xlist$b <- 20:30
xlist

xlist$b * 2
xlist

myVec <- xlist$b
myVec
myVec[-3]
myVec[myVec != 22]
xlist$b
xlist$b <- myVec[-2]
xlist


  