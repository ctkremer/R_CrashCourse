###########################################################################
###########################################################################
###########################################################################

# Crash course on programming in R

# Colin T. Kremer, 5/28/12
# kremerco@msu.edu

# Prepared for 'Maximum Likelihood Analysis in Ecology', ELME course 2012.

# Updated: 12/10/12, fixed frog data

##########################################################################

# Introduction:

# This script is intended to present you with a quick and dirty introduction to computer programming and specifically programming in R. A lot of basic R functions and information are presented, but certainly it's nowhere near comprehensive. As with most things, you'll find that if you try things out and mess around with your own examples, you'll learn and retain more of the information. The single best thing you can do to pick up any programming language really, including R, is to get your hands dirty and try things, even if you don't know if they will work. The chances that you'll break something are quite slim, and there's every chance that you'll discover something new for yourself.

# If you've done some programming before, some of the concepts may be review; skip what you'd like, but I'd encourage you to at least skim most of the material. In several places I try to explain things that are peculiar quirks of R that can trip up even relatively experienced programmers not used to working in R.

# There are a number of sections where I indicated 'Digressions' from the topic at hand. My intention in these sections is primarily to explain smaller, but still useful features or quirks of programming in R. Rather than providing bookmarks for sections to skip reading, my hope was to retain the flow of developing ideas and concepts by noting branching topics treated only briefly in this tutorial. Use them as you see fit.

# Please feel free to share this with friends and colleagues, but do try to retain my name on the document. I'd be grateful if you notify me of any mistakes you catch, or share comments on the contents/explanations.


###########################################################################
#
#    Contents:   
#
###########################################################################


### Running commands in R

### Arithmetic in R

	# +,-,*,/,^
	# sqrt() 
	# exp()
	# log()
	# %%

### Assignment of variables (<-,->,=)

	# <-, ->, =

### Logical statements 

	# ==, !=, >, <, >=, <=, |, &

### Data manipulation (Intro):

	# Kinds of variables
		# class()

	# Variable names

### Data structures:

	# Vectors:
		# c(), append(), and []
	
	# Generating patterned data
		# seq(), rep() and sample()
	
	# Matrices
		# matrix() and [,]

	# Data frames
		# data.frame()

	# Facts about data structures:
		# length(), dim(), nrow(), ncol(), 
		# str(), head(), tail()
		# names(), colnames(), rownames()

### Functions

	# ? and ?? (ie, getting help)
	# function()

### Decision and Control statements 

	# Conditional statements (ifs and elses)
		# if(){}else{} and ifelse()

	# Loops (for and while)
		# for(){}
		# print()
		# while(){}

### Advanced loops

	#apply(), sapply(), lapply(), tapply()

### Data manipulation (Advanced):

	# Importing data
		# read.csv() and read.table()
		# file.choose()

	# Working directory
		# getwd() and setwd()

	# Practice looking at data

	# Factors
		# unclass()
		# as.character(), as.numeric(), as.factor()
		# levels

	# Locating particular values in a vector
		# which()
		# X %in% Y

	# Accessing a subset of your data
		# subset()

### Data review/Descriptive statistics:

	# summary(), table()
	# mean(), median(), quantile(), var(), sd()

### Plotting data

	# plot(), boxplot()
	# abline(), segments(), points()

### R packages
	# install.packages(), library()
	# source()

##########################################################################
#
#    Beginning of Tutorial	#
#
##########################################################################


### Running commands in R

# to execute a command in R you can either type or paste it in to the command line in the R console (the space after a > ), or you can highlight the text in an R script and send it to the R console to be executed.  For example highlight the text below:
7*2*2
# and then hit apple+return if on a mac or (probably) ctrl+R if you're on a PC
# you should then see the line above appear in the R console, as well as the result of the multiplication, which we'll call the 'output':

#[1] 28

# 'Commenting' - every line that you see in this script that starts with the '#' symbol is considered to be a 'comment' line. You can send these lines to the R console to run, but they will have no effect or result.  Basically, it's a way to make notes or comments about the code that you're writing, without altering the function of the code or needing a separate file for your thoughts and explanations.  It can also be a really useful way of de-bugging code, as it's a quick and temporary way to turn off one line of code at a time, which is super handy when you're trying to isolate the source of a problem.


### Arithmetic in R

# The usual arithmetic symbols apply, with
# +,-,*,/,^ indicating addition, subtraction, multiplication, division, and exponentiation, respectively

# other useful arithmetic functions are
sqrt(49)	# square root of 49
exp(5)	# returns e^5
log(5)	# returns ln(5)
log(5,base=10)	# returns log(5) using base 10 instead of the default base e
# so does
log10(5)

6 %% 5	# calculates the modulus, or remainder of 6/5


### Assignment of variables (<-,->,=)

# One fundamental component of using a computer language, like R, to perform calculations is being able to save (or store) things like numbers or characters (think letters) or other pieces of information. Just as important is being able to name the place where such information is stored, so we can find it again. In lower level programming languages, this process requires two steps: 1) create a 'box' for storing information, called a variable, and 2) actually storing/putting information in the 'box' or variable. In R we can do this in a single step.

# for example, in this line (run it in the console):
x <- 2

# we've created a variable named 'x', and stored a value in 'x' - specifically the number 2. This storage process is sometimes called 'assignment' as in, we're assigning a particular value to the variable named 'x'.

# this is a really powerful, handy thing to be able to do, because later we can recall the value of x and use it for calculations and other good things.  For example, go run this in the console
x

# spits back the following output:
# [1] 2

# (the [1] just tells us that we're on the first line of output, while 2 is the actual value that we assigned to variable 'x')

# The way that I remember the syntax (or combination of symbols) for assignment is that we're taking the value 2 and sticking it in the variable box 'x', accomplished by typing an arrow pointing from 2 to 'x', its destination.

# R will also let us perform assignments in the other direction, as long as we change the direction of the arrow, for example
3->x
x
# results in changing the value of x to be 3.

# finally, and this is the source of frequent confusion, R will let you use the equals sign to assign a value to a variable. So above, we could have said
x=2
x
# to assign the value 2 to x. The confusion that arises is potentially two-fold:
# 	1) The equals sign doesn't make it obvious which direction the assignment goes in.
#	So if we had two variables, x and y
x<-4
y<-3 

#	and we decide that we want to change the value of x to be that of variable y, it's clear how to #	proceed with the arrows:
x<-y
x

#	but much less clear if we write
x<-4
y<-3 
x=y
x

#	(is x taking the value of y, or is y taking the value of x?)  Basically, the direction of assignment is unclear. The default in R is that '<-' and '=' are the same, but it can be easy to get confused. For this reason, I prefer the use of '<-' and will try to use it in all of my examples.

#	2) Sometimes when programming, we want to assign a value to a variable, and sometimes we want to answer the question "is the value of this thing equal to the value of that other thing", which is a very different use of the equals sign, bringing us to our next topic.


### Logical statements (==,!=,>,<,>=,<=,|,&)

# let's take our example from above:
x<-3
y<-4

# We can now ask a bunch of questions about x and y, essentially comparing them and answering a true/false question.

# Are the values of x and y equal to each other?
x==y
#		Note here that we use TWO equals signs to test whether two things are equal to each other,
#		in contrast to the use of ONE equals sign described above, which assigns a value to a 
#		variable.

# Are x and y NOT equal to each other (in other words, are their values different)?
x!=y

# Is x > y? (or x < y)?
x > y
x < y

# IS x greater than or equal to y? (or, less than or equal)?
x>=y
x<=y

# finally, we can join together these logical statements to answer more complex questions:
z<-3

# For example, are x and z equal, AND is y greater than z?
(x==z) & (y>z)

#  Is x equal to y, or equal to z?
(x==y) | (x==z)

# there are several other, more arcane logical functions, but with just these you can get a long way.


###############

#### Data manipulation (Intro):

### Kinds of variables

# there are many different kinds of data. Numbers are data, but so are words (or 'strings' made up of multiple 'characters', individual letters or symbols). There are even many different kinds of numbers, such as integers (0,1,2,3,110,-7, etc) or decimal numbers. More on other sophisticated kinds of variables later.

# for example, we can save a character string as variable p
p<-"word"
p
# it's important to note that when we write character strings in R, they must fall within " " or ' ', otherwise R will think that we're trying to invoke the name of a variable.

# decimals
n<-3.77
n

# scientific notation
s<-10e3
s

# to find out what kind of information a variable holds, we can use a command called class()
class(x)
class(p)
class(n)


### Variable names

# Acceptable names for variables in R can be pretty extensive, but follow a few rules:
#	- they cannot start with numbers
#	- they can contain a mix of letters and numbers
#	- they can contain periods, '.' and underscores, '_'
#	- however, all other punctuation and symbols should be avoided.

# so this is an acceptable variable name: crazy.long_name1234
# but this wouldn't be: 4crazy.long@name


#### Data structures:

### Vectors:

# earlier, we learned how to assign a single value to a variable.
# it's also possible to assign a set of values to a single variable name, an essential property of working with data in R. 

# we can stick multiple values together using the concatenate command,
# c()
c(1,2,3)

# this set of numbers can be assigned to a single variable name
x<-c(1,2,3)
x

# this will prove quite useful, as often we have groups of numbers that share a common association. For example, maybe we measured the number of parasites on 5 different mice. These values all have something in common, an association that will come into play in analyzing and displaying this data.  It's way more efficient to be able to store these values as 
x<-c(4,7,8,5,9)
# than it would be to write
x1 <- 4
x2 <- 7
x3 <- 8
# and so on.

# these sets of variables accessed via the name of a single variable are often called vectors, or arrays.

# Occasionally, it's useful to be able to add values on to the end of a list.  This can be accomplished using the append() function.
# This adds the number 42 to the end of x, and saves the result as x:
x<-append(x,42)
x

# sometimes we want to look at the whole vector:
x

# and sometimes we want to extract a particular value from x:
x[1]
x[2]

# here the brackets, [], indicate that we want to access just a part of x. The number(s) that we put in the bracket indicate the position in the vector x that we want to get a value from (think of it like a numerical address. x is like the name of a street with a bunch of houses. each house is numbered 1, 2, 3, and so on down the street. In in each house there's a value or number or some piece of data that we can look up, given the name of the street and the house number)

# so, x[3] will return the 3rd value in the vector x, in this case
x[3]
# 8

# we can also grab a few values at a time:
x[3:5]		# values 3 through 5
x[-1]		# everything but the first value
x[c(2,4)]	# the second and fourth values

# We can even ask for just the values in x that meet a certain logical criteria, like
x[x>5]

# this works because inside the brackets, 'x > 5' checks each element of the vector x to see if its greater than five, returning a list of TRUE or FALSE.
x > 5

# So, these have the same effect:
x[c(FALSE,TRUE,TRUE,FALSE,TRUE,TRUE)]
x[x>5]

# note that if we ask for a value that doesn't exist in x, for example, asking what x[10] is when x only has 5 values, R tells us that it doesn't know what the value is.
x[10]

# another way of thinking of a vector is to imagine it as a single column in a spreadsheet of data. The name of the column, your header, is like the name of the variable, and the contents of the column corresponds to the set of values stored in your vector.

# vectors can contain only a single kind of data. So if we try to mix together different kinds of information and save it in one variable, some unexpected things can happen:
x<-c(1,"bob",3)
x
class(x)

# here, we tried to save numbers and character strings (words) in the same vector x. The character string has no convenient numerical representation (ie, we can't convert it into a number meaningfully), whereas the numbers, 1 and 3, can be considered as character strings of one character each, "1" and "3". Consequently, R automatically converts the values we're trying to save in vector x so that they are all the same kind of data, without losing information about the identity of the values. Or, as the help menu writes, R respects a coercion hierarchy (see Details under ?matrix ).


### Generating patterned data

# sometimes it is convenient to be able to generate vectors of data patterned in some way, and, as usual, R has some handy functions for doing this.

# seq(...) - creates a sequence of values, from the first number, to the second number, with jumps the size of the third number
seq(1,10,1)
seq(2,7,0.5)
seq(30,10,-10)

# rep(...) - repeats the first value it is sent the number of times specified by the second number
rep(5,3)
rep(2.2,4)

# sample() - randomly samples values from a list supplied to the function, a specified number of times, with or without replacement
sample(20,size=5)	# here specifying just 20 leads sample to infer that it's working with a list of integers from 1 to 20.


### Matrices

# sometimes we want to create more complicated objects representing multiple dimensions of data. Drawing on the analogy to a spreadsheet above, where we pictured vectors as the column of a spread sheet, we can introduce a new structure called a matrix, which is the equivalent of multiple columns of data all of the same type

# for example, we might have counted the number of insects observed on 5 different plants over 8 observation periods. Each plant might get its own column in the spreadsheet, and each observation period might get its own row. The contents of any given cell in the spreadsheet would contain the actual piece of data, namely, the number of insects observed on a particular plant during a particular observation period.  In R, this structure is called a matrix, and might look something like this:

x<-matrix(sample(20),nrow=8,ncol=5)
x

# matrix() creates a matrix. sample(20) just grabs a bunch of integers between 1 and 20 for us to fill up our matrix with ('cause I'm too lazy to type them all out), and nrow=8 and ncol=5 specifies the size of the matrix that we want (one with 8 rows and 5 columns, respectively)

# just like a vector, a matrix can only contain one kind of data, which can be surprising sometimes (see section on 'coercion hierarchy' above).

# Accessing data:

# 	- easiest way to understand this is to think about playing battleship (maybe you've even seen the recent movie)
#	- before, to get data out of a vector, we specified the integer corresponding to the position in the vector that we wanted data from (eg, x[5] yields the 5th element in the list of items comprising vector x)
#	- to get data out of a matrix, we have to specify 2 positions (or 'indices'): one providing the row that the piece of data is in, and the other providing the column
#	- this is just like battleship, where you call out coordinates like "A5" or "D7", except instead of using letters and numbers, we just use two numbers, separated by a comma.

# examples:

x[1,1]	# first row, first column
x[6,3]	# sixth row, third column

x[1,]	# first row, all columns (we don't provide column numbers)
x[,3]	# all rows, third column
x[,]	# all rows, all columns (equivalent to just x)

x[,-2]	# everything except the second column
x[-4,]	# everything except the fourth row

x[1,2:5]	# first row, columns 2 through 5
x[3:8,2]	# rows 3 through 8, second column
x[3:8,2:5]


### Data frames

# one of the awesome things about working with data in R is the introduction of more sophisticated data structures that allow you to keep different kinds of data together, associated with a single variable name. The objects that we use to do this are called data frames.

z<-data.frame(col1=c(4,6,7),col2=c("hit","and","sunk"),stringsAsFactors=F)
# this says, 'z is assigned to be a data frame, consisting of 2 columns, named col1 and col2, composed of c(4,6,7) and c("a","b","c") respectively.  For now, just ignore the last bit, 'stringsAsFactors=F', or see ?data.frame

# here's what z looks like
z

# and you can see that it contains two different classes of vectors.
class(z$col1)
class(z$col2)

# we can use all of the same tricks demonstrated above for matrices to extract bits and pieces of data from data frames, for example
z[1,2]
z[2:3,1]

# in addition, we can refer to the columns of data frame 'z' by name. Again, you can think of the syntax as providing a kind of address:
z$col1		# there's column 1
z$col2		# and column 2

# in some sense, these are analogous to the following:
z[,'col1']
z[,'col2']

# first we specify the name of the data frame (z), followed by a $ and then the name of the column that we're referring to. Each column behaves individually like a vector (ie, contains only one type of data, and can be indexed like a vector, for example z$col1[2] will spit out the second value of column 'col1' in data frame 'z')


### Facts about data structures:

# often we want to know the size of various data structures, and there are a number of handy commands to help us do this:

# length() tells us how long a vector is

length(z$col1)	# remember, a column of a data frame is just like a vector

# dim() tells us what the dimensions of a data frame or matrix is
dim(z)		# 3 rows, 2 columns
dim(x)		# 8 rows, 5 columns

# more specifically, we can just find out the number of rows or columns:
nrow(x)
ncol(x)

# we can get more details about the contents and kinds of data found in a given data frame by using the str() command - think of it like you're inquring about the structure of a data frame:
str(z)

# displays the name of each column in z, the kind of data in each column, and the first few values in each column.  This is a super useful command for quickly getting a sense of the kinds of data available in a big data set. It can also help uncover problems that arise in analyzing data due to confusion over what class of values particular columns contain.

# another way of quickly examining data frames, especially useful when working with large data frames:
z2<-data.frame(col1=sample(20,100,replace=T),col2=seq(1,100))
z2		# this displays quite a long bit of output
head(z2)	# show just the first 6 rows
head(z2,10) # show first 10 rows
tail(z2)	# show the last 6 rows
tail(z2,10) # last 10 rows

head(x)		# can be applied to matrices as well.

# extract the names of columns and rows in data frame z
names(z)
colnames(z)
rownames(z)

########

### Functions

# Functions are an essential part of a programming language, allowing you to create sophisticated/complicated computations, and summon them quickly and tidly to do your bidding.

# we've actually already sneakily been introduced to functions earlier in this crash course, without specifically recognizing what we were doing.  Things like length(), head(), rep(), seq(), and class() are all functions.

# they all follow R rules for naming variables, and they're all followed by () which indicates that they are functions rather than variables.

# The () are also important because they allow you to send data and information to a function.

# A function takes the information that you send it in the parentheses, uses it to perform a set of computations or other tasks, and then (usually) returns a number or object to you.

# R has a wealth of functions that people have already written that serve as tools for doing all kinds of computations, manipulations, and analyses. 

###### Digression - getting help

# to find out how a pre-built R function works (ie, to access the help menu), you can type a '?' in front of the name of the function
?rep

# sometimes there isn't a dedicated help file for the function/topic of your query, in which case you can cast a wider net by typing
??rep
# this locates all occurences of 'rep' in all the help pages of the basic R packages and any additonal packages that you've loaded.

#######  End digression

# Often it is faster and easier to use a function that has already been written and tested to perform a task, but it is also possible and useful to be able to make your own functions - especially in order to understand how functions work.  Here are some basic examples:

# this function is named 'add'.  It receives no information, and performs no calculations, but is still a properly defined function
hohum<-function(){
	# this is where we'd write the computations to be performed	
}

# if we run it,
hohum()
# NULL

# We see that it provides an empty/nonexistent result.

# Now let's make a function that does something

# first a clean version that's easy to see, the the same thing with comments describing each piece:
add<-function(b,c){
	sum.result<-b+c
	return(sum.result)
}

add<-function(b,c){		# this function will be named 'add', and needs to receive 2 values, which it will name b and c, when it is 'called' or asked to do its job.
	sum.result<-b+c		# inside of the function (everything that happens between the first { and the last } ), we can perform calculations, such as adding together b and c and saving them as a new variable, 'sum.result'
	return(sum.result)	# as a last step, if we want our function to send the results of its work back to us, we use the return() command to instruct the function what information to return.
}

# let's run our new function:
add(2,3)
# [1] 5

# Note that we have to send the function all of the values it is expecting to receive, otherwise an error will occur (digression: this happens unless you provide default settings for each of the values that the function is expecting to receive when you create your function)
add(3)

##### Digression

# Note also that the variable that we created inside of our function, 'sum.result' exists only within the little world of the function itself, so if we ask R what it thinks the value of sum.result is:
sum.result

# it won't know what we're talking about. Computer scientists would call sum.result a 'local variable', ie, a variable that is only defined/exists locally within a program - in contrast to a 'global variable' that is defined everywhere, both inside and outside of functions and loops and things. This is a pretty handy feature, because it can prevent functions and their variables/computations from interfering with each other and having unexpected results.

###### End digression


# So now we can use a function to add two numbers together. Woop-de-doo - couldn't we already do that by writing 2+3? What's the big fuss over functions?

# the beauty of functions is that there's no real limit to the number or complexity of computations that we can perform inside of the function, and the results that we can return

# here's a crazier function
crazy<-function(b,c,d){
	res1<-exp(5*b)
	res2<-c*res1+d
	res3<-log(res2)
	return(c(res1,res2,res3))
}

crazy(6,3,2.7)

# And we'll run into functions again.


### Decision and Control statements 

# these are the bread and butter of computations and algorithms.


# Conditional statements (ifs and elses)

# These statements allow you to implement different code (or have your code follow different directions depending on some criteria that can be determined to be TRUE or FALSE). Statements that test whether something is TRUE or FALSE are called logical statements and rely on operations like >, <, == or != (for more, see earlier portion of this tutorial)

# Say we have some value x having a value between 0 and 1, and we want to round it to be exactly 0 or 1, depending on whether or not it is larger than 0.5.
x<-0.67

# an if() statement can help us do this:
if(x >= 0.5){
	x<-1
}
x

# here, the syntax says: 
#
# if(this stuff is true){ 
# 	carry out all the steps inside of these curly brackets 
# }

# that works pretty well if x is greater than (or equal to) 0.5, but will have no effect on x if it's less than 0.5 (try it out!)

# the other side of the if() statement is providing instructions on what to do if the condition is false - we call this the else.
x<-0.2

if(x > 0.5){
	x<-1
}else{
	x<-0	
}
x

# here, the syntax says: 
#
# if(this stuff is true){ 
# 	carry out all the steps inside of these curly brackets 
# }else{
#	do all of these steps instead	
# }

# this is super handy and all, but what if x is a whole bunch of values instead of just one? (ie, x is a vector)

# Well, there's another version of this if/else set up that can operate on vectors or single values equally:

x<-0.67
ifelse(x >= 0.5, 1, 0)
# this says:
#	ifelse( if this is TRUE, return this value, otherwise return this value)

# one important difference in our code: our earlier examples of if/else actually changed the value of x, whereas the ifelse() statement above only returned what the new value of x should be.  If we check the value of x:
x
# it hasn't changed. To actually change x we would need to write
x<-ifelse(x >= 0.5, 1, 0)

# finally, we can apply ifelse to a vector of values:
x<-c(0.97,0.32,0.75,0.49,0.16)

x<-ifelse(x > 0.5, 1, 0)
x

# here the if/else operation is performed on each element of vector x individually, and the result is itself a vector.


# Loops (for and while)

# when programming, we frequently want to perform the same calculation repeatedly, or on each value of a vector (as in our use of ifelse() in the previous example). The structures that allow us to do this are called loops, and come in 2 primary kinds, the for() loop and the while() loop.

# the for() loop lets us perform a set of calculations a fixed number of times.

# the while() loop performs a set of calculations over and over again until a condition is met (ie, a logical statement goes from being TRUE to being FALSE)

# Examples:

x<-3
for(i in 1:4){
	print(i)
	x<-x+1
}
x

# what's happening here?

# syntax:
# for(i in 1:4){ stuff } says to repeatedly calculate the 'stuff' for as many steps as it takes i to go from i=1 to i=4 (by increments of 1 as a default)

# what's the stuff:
# 	print(i) tells the for() loop to print out what it thinks the value of i is each time it goes through the loop and repeats 'stuff'.  This is why we see

[1] 1
[1] 2
[1] 3
[1] 4

# in the output. Each time the loop executes the 'stuff', it increases the value of i by 1, starting with i initially equaling 1 and continuing until i equals 4.

# the second line in 'stuff' is x<-x+1
# this line says 'add 1 to the value of x and overwrite (or update) x to be this new value'.  This has the effect of increasing x by 1 every time the loop runs. Using a little math, we would expect then that after running the loop, x should equal its initial value plus 4 (the number of times the loop runs)
x==3+4


# For a more complicated example, we can use a for loop combined with if(){}else{} to accomplish the same task as the ifelse statement above:

# first, look at how we can use a for loop to focus on each individual element of vector x:
x<-c(0.97,0.32,0.75,0.49,0.16)
for(i in 1:length(x)){
	print(x[i])
}
# this for loop starts with i=1 and keeps going until i=length(x), or i = number of elements in vector x.  Each time the loop runs, it prints out the value of x[i]. The first time the loop runs, i = 1, so we see x[1], the first element in vector x. The next time the loop runs, i has been increased to i = 2, so we see x[2], the second element of x, and so on until i = length(x) and we see the last element of vector x.

# this loop is very similar, but instead of printing out the value of each element of x as we go through the loop, here we use an if(){}else{} statement to check each individual element of x to see if it is >= 0.5, and then change the value of that element accordingly.
x<-c(0.97,0.32,0.75,0.49,0.16)
for(i in 1:length(x)){
	if(x[i]>=0.5){
		x[i]<-1
	}else{
		x[i]<-0
	}	
}
x

# can you use a for loop and an if/else statement to determine if a list of values is even or odd? How about with the ifelse() function?


# while() loops

# sometimes we won't know ahead of time how many times we want to repeat a set of calculations. while loops can be useful in these situations, because they let us repeat calculations indefinitely, until a logical statement goes from being TRUE to being FALSE.

# for example, say that we want to keep drawing random numbers between 0 and 1, until we get a number greater than 0.8:

current.number<-0	# set this number to be less than 0.8 so that our loop will run at least the first time.
while(current.number<=0.8){
	current.number<-runif(1)	# runif(1) generates 1 random number from a uniform distribution ranging from 0 to 1 - don't sweat the details yet.
	print(current.number)
}

# syntax:
#	while(this statement is true){
#		run this stuff
#	}

# run that code several times, and observe its behavior. Each time it runs, it should spit out a list of a varying number of decimal numbers, where only the last number is greater than 0.8.  (It's different each time because we are generating different random numbers each time the loop executes).

# CAUTION: while loops can be super useful, but they are also dangerous, because they can lead to something called an 'infinite loop'. Basically, if the logical statement can never become false, then the loop will just keep on running forever and ever, until your computer/battery dies/gets shut off, or you close the program.  This is a pretty undesireable thing to have happen.

# here's an example of an infinite loop:

# BEFORE you run this, look over at the R console.  There should be a red stop sign in the upper left hand corner. When you get tired of the infinite loop running, hit this button to stop it - it won't stop on its own.

# alternatively, you can try typing ctrl+c (or apple+c on a mac?) to halt the evaluation of the loop in R.

# Note that these approaches won't always stop R from executing the code you've asked it to evaluate, depending on some technical details. For this reason, it's always a good idea to save your code, etc. before running a function that might get caught in an infinite loop, or otherwise take a really long time. Sometimes the only way to stop R is to close and restart it.

while(2>1){
	print("to infinity and beyond!")
}

# one way to prevent this is to set an upper limit on the number of times that the while loop can be executed:

counter<-1
current.number<-0
while(current.number<=0.99 & counter<=50){
	current.number<-runif(1)
	print(c(counter,current.number))
	counter<-counter+1
}

# run this a couple of times and see how it behaves. Sometimes the output will stop because the loop encounters a number greater than 0.99 before it tries 50 times. But sometimes the counter gets to 50 and our while loop is halted before we observe a number greater than 0.99.

# this can be super handy if we made a type-o when writing our loop

# without the counter, this loop would never stop, because our random numbers will always be less than 99.  With the counter, it will automatically stop after 50 attempts.
counter<-1
current.number<-0
while(current.number<=99 & counter<=50){
	current.number<-runif(1)
	print(c(counter,current.number))
	counter<-counter+1
}


### Advanced loops

# R has a set of functions that serve as alternatives to the classic for loop as it's used to perform calculations on the elements of a vector, with advantages in terms of how quickly they run, and how concisely they can be written. This tutorial will mention them only briefly, but they're welly worth learning more about:
?apply()
?sapply()
?lapply()
?tapply()

# let's return to our example of classifying numbers between 0 and 1 as either 0 or 1 exactly:

x<-c(0.97,0.32,0.75,0.49,0.16)

sapply(x, FUN=function(y) if(y>=0.5){y<-1}else{y<-0})

# this is equivalent to what we did before,
ifelse(x>=0.5,1,0)

# but far more flexible, because we could put any function that we want to after the FUN= part in the call to sapply().  This is a handy way of applying some general function to all of the elements of a vector.

# apply() works on the columns or rows of a matrix; lapply works on the elements of a 'list' - a kind of data structure in R that we haven't covered yet, but will run into shortly.

########

### Data manipulation (Advanced):


# Importing data

# NOTE: For this exercise you'll need the two data files found at 
# http://www.msu.edu/~kremerco/frog_pred.csv
# http://www.msu.edu/~kremerco/frog_pred.txt

# so far, all of the 'data' that we've worked with in R we've either entered by hand, or generated using functions like seq(), rep(), and sample(). 

# for R to be useful in analyzing real data sets, we need to learn how to read in existing data sets from other files, as it would be a nightmare to have to enter data by hand into R.  Fortunately, this is quite easy to do, for a variety of file formats.

# my personal preference is to work with .csv, or comma separated value files (can be created in excel). So that's what I'll demonstrate first:


# read.csv("filepath") reads a .csv file located at "filepath" into R as a data frame.
# If you're trying this out on your own computer (as you should), you'll need to change the file path below to reflect the location of the frog_pred.csv file on your computer.
data<-read.csv("/Users/colin/Grad_School/Teaching/ELME/ELME 2014/labs/frog_pred.csv")

# alternatively, you can instruct R to let you browse through your file directories to select a particular file to load.
data<-read.csv(file=file.choose())
# this can be convenient, but also problematic, because it doesn't leave behind a permanent record of what data file you actually loaded, potentially making it hard to remember what you did later.

# if your data are structured in a format that's not a .csv file, you may still be able to load it in to R from a text file format (among others), .txt, using the read.table() command:
data<-read.table("/Users/colin/Grad_School/Teaching/ELME/ELME 2014/labs/frog_pred.txt",sep=",",header=T)

# here I've specified that the character used to separate different elements in the data is a comma, via sep=","
# I've also told read.table() that the file has a header, via header=T
# many many more options are available, so be sure to check out the help file at ?read.table()

# Working directory

# every time you open up R, it defaults to calling a particular directory directory on your computer its 'home' or its 'working directory'.  This becomes the first place that it looks when you tell it to read in data, and also the location where any files you tell R to create are saved.

# To find out what R thinks your working directory is right now, try:
getwd()

# Often, the default or initial directory isn't the one that you want to be working in for a particular project. It's important then to be able to change the current working directory. You can do this typically through the file menus in R, but also directly by setting the working directory via the command setwd():

setwd("/Users/colin/Grad_School/Teaching/ELME/ELME 2014/labs/")

# again, the advantage to doing this is that any files we create will be saved to this folder (unless we explicitly specify a different location when saving files).

# additionally, when it comes to loading data files, we can take a short cut and just write
read.csv("frog_pred.csv")
# avoiding the need to write out the complete file path, because R defaults to looking in the current working directory.


### Practice looking at data

# This particular data set describes the results of an experiment looking at predation on frogs as a function of frog size, and the density of frogs in a tank.

# functions that we learned earlier are quite useful for quickly looking at these data
dim(data)
names(data)
head(data)
str(data)


# str(data) shows us that this data consists of 5 columns, containing integers (density and surv columns), numbers (propsurv column), and lastly, these curious things called Factors, which we haven't run into before in this tutorial.

# Factors

# factors are a terrifically useful and terrible class of data. They exist simultaneously as both character data and numerical data, which can make them quite confusing to work with.

# to try to understand what this means, let's focus on the predation column first:
data$pred			# here's what the whole vector looks like if we ask for it directly
class(data$pred)	# the class of this vector is "factor"

# for whatever reason, to get a more informative view of what this factor data$pred consists of, it helps to apply a function called unclass()
unclass(data$pred)

# here we can see that the vector itself consists of 1's and 2's, but that the vector has an extra attribute attached to it called 'levels', which contain the labels (character strings) "no" and "pred".

# this factor implicitly matches
#		"no" 	to	 1
# and	"pred" 	to	 2

# On the surface this seems like a crazy scheme - why on earth would we want both numerical and character data mashed together in the same column and called a factor?

# Turns out that for many statistical models it is much more convenient to work with a vector of integers describing which treatment or category a particular data point is a member of - it's easier for computers to work with, and easier for performing computations. However, long lists of integers aren't meaningful to (most) humans - we remember what different treatments mean much more easily if they are referred to by a name than by a number.  Factors attempt to retain categorical data in a form that is convenient for use in statistical modeling but also easy for humans to look at and understand as well - a worthy goal.

# Factors can cause problems though if not handled carefully - we have to make sure that they give us characters when we want characters, and numbers when we want to work with the corresponding numerical codes.  For this reason, you will often see factors converted into other data classes, like character or numerical.

# for example:
data$pred.character<-as.character(data$pred)
data$pred.numeric<-as.numeric(data$pred)
# here we've added two new columns to our data frame, pred.character and pred.numeric, by forcing a factor, data$pred, into a character or numerical form.

# what's the result of this:
str(data)
# notice the addition of $pred.character and $pred.numeric to the data frame, and the class of variable that they have become (character and numeric, respectively)

# levels() can be a useful way of finding out what levels of a factor exist:
levels(data$pred)

# alternatively, we can take a character vector and convert it into a factor by doing something like this:
as.factor(data$pred.character)


# Locating particular values in a vector

# sometimes we have a vector of data and we know that it contains particular pieces of data, but we don't know where in the vector they occur. The function which() was made for this situation (probably literally)

# which() tells us the integers corresponding to the positions in a vector satisfying some logical condition. In otherwords, it tells us where in a vector particular values occur.

# for example:
which(data$density>10)	# which elements in data$density are larger than 10?

# if we save them we can use these integer locations to do some useful things
locations<-which(data$density>10)

# for example we can look at the proportion of frogs surviving predation (data$propsurv) when the density of frogs is > 10:
data$propsurv[locations]

data$density[locations]

# this is similar to an approach introduced earlier:
data$propsurv[data$density>10]

# this works because data$density>10 produces a logical vector (a vector consisting of TRUE and FALSE), and only the elements of data$propsurv where TRUE occurs are retained:
data$density>10

# it's also possible to use a short cut called %in% to figure out the intersection of lists of values, which can be really handy at times.

# Here's an example. Supposed we have a list of letters:
letters<-c("a","d","e","a","f","b","b")

# if we want to pull out every instance of the letter "a" we could do something like this: 
letters[letters=="a"]

# but maybe we're interested in more than one letter, perhaps "a" and "b" and we want to find all instances of either letter. We've got a few options:

# this works, but it's long, and gets longer with each additional case we're looking for.
letters[letters=="a" | letters=="b"]

# this is much shorter/more efficient:
letters[letters %in% c("a","b")]

# the code:
letters %in% c("a","b")

# checks each element of letters one at a time, to see if it appears in the list of interesting cases after %in%, returning TRUE or FALSE. The TRUE/FALSE list is then used to spit back only the entries of 'letters' that we're interested in.



# Accessing a subset of your data

# it is often desirable to be able to focus on a subset of your entire data set, rather than trying to analyze or work with the whole beast at once. The methods introduced above can be used to accomplish this:

# create a subset of data with only the rows in which data$density is equal to 10 (but including all columns):
data2<-data[data$density==10,]
data2

# only the rows where density equals 10 and size equals 'big'
data3<-data[data$density==10 & data$size=="big",]
data3

# the which() command can be used for these purposes as well:
locations<-which(data$density==10 & data$size=="big")
data4<-data[locations,]
data4

# finally, there's an explicit command called
# subset() that can be used as well:
data5<-subset(data,data$density==10 & data$size=='big')
data5


########

### Data review/Descriptive statistics:

# it can be helpful to be able to generate quick numerical summaries of different portions of your data.  Here are some relevant functions:

# summary() - provides basic summary statistics for different classes of data
summary(data)			# for entire data frames
summary(data$propsurv)	# or single vectors

# table() - reports the number of times each unique value can be found in a given vector
table(data$density)

# or for multiple vectors
table(data$density,data$pred)

# other self explanatory functions:
# mean, median, quantiles, var, sd
mean(data$propsurv)								# mean of data
median(data$propsurv)							# median of data
quantile(data$propsurv,probs=c(0.05,0.5,0.95))	# any given quantile
var(data$propsurv)								# variance
sd(data$propsurv)								# standard deviation


########

### Plotting data

# an essential part of understanding your data is visualizing it.  Here are some basic commands for plotting your data:

# plot() - scatter plot
plot(propsurv~density,data=data)
# plot(y values ~ x values, data=name.of.data.frame.containing.x.and.y)

# boxplot()
boxplot(data$propsurv)
boxplot(data$propsurv~data$pred)

# add lines, segments and points to a figure:
plot(propsurv~density,data=data)

# add a line with given intercept, slope
abline(0,0.03)

segments(15,0.2,30,0.8)

points(data$propsurv~data$density,col='red')

# much more on plotting can be found in upcoming lab activities, where we have more data to play with and visualize.

##############

### R packages

# as mentioned earlier, there's an enormous number of functions and tools that the R community has developed. Many of them are highly specialized, so the basic distribution of R comes with only a subset of all possible functions installed.

# To add in the functionality of other functions that people have written, there are 2 approaches:

# First, if the functions/tools are bundled together and available in a formal R package (like the maximum likelihood tools we'll be using, which are located in a package called 'bbmle'), you can download and install the desired package via the install.packages() command:
install.packages("bbmle")

# or also typically from the menus of your script editor..

# when you want to actually use a package that you have downloaded and installed, you have to load it - usually every time you restart R. This can be accomplished with the library() command:
library(bbmle)

# Second, often people will have written a couple of useful little functions that they haven't turned into a formal R package. This is something that you might even do yourself. If these extra functions are kept in an R script, you can instruct R to go and silently execute everything in that script - like loading up your own personal functions.  The command for this is:
source("name_of_script.R")




#########################################


# Hope this was helpful!


