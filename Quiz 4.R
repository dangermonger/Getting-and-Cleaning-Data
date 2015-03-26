## Replace the first occurrence of a pattern with sub or replace all occurrences with gsub.

##grep(pattern, x) - Search for a particular pattern in each element of a vector x.

################################################Question 1######################################

setwd("C:/Users/KOLeary/Documents/GitHub/Getting and Cleaning Data") ##set working directory

readfile <- read.csv("getdata-data-Fss06hid.csv", colClasses = "character") ##read file

splitNames = strsplit(names(readfile),"wgtp") ## splits column names that contain "wgtp"

splitNames[123] ##subsets the 123rd character of the list

################################################Question 2######################################

readgdp <- read.csv("getdata-data-GDP.csv", skip=4, nrows = 190) ## read file, skip top 4 rows and read the next 190

colofinterest = gsub("\\,","",readgdp$X.4, ) ## replace all occurances of "," with nothing in the X.4 column

mean(as.numeric(colofinterest)) ## convert the character vector to numeric and calculate the mean

################################################Question 3######################################

readgdp <- read.csv("getdata-data-GDP.csv", skip=4, nrows = 190) ## read file, skip top 4 rows and read the next 190

head(readgdp)

newgdp <- sub("X.3","countryNames",names(readgdp),) ## substitute countryNames for X.3 column label

colnames(readgdp) <- newgdp ##reassign the column names of readgdp with newdgp 

grep("^United",readgdp$countryNames) ##return a list of country names from countryNames column that begin with United

################################################Question 4######################################

readgdp <- read.csv("getdata-data-GDP.csv", skip=4, nrows = 190) ## read file, skip top 4 rows and read the next 190

readedata <- read.csv("getdata-data-EDSTATS_Country.csv") ## read csv

match_tables <- data.frame(matchcol = match(readedata[['CountryCode']], readgdp[['X']] ), Junend = readedata$Special.Notes) ##create a dataframe with matchcol and Junend columns where matchcol matches the country code columns of both data sets and Junend returns the Special.Notes column

length(grep("^Fiscal year end: June", match_tables$Junend)) ##return the length of vector where Junend begins with "Fiscal year end: June"

################################################Question 5######################################

install.packages("quantmod")
library(quantmod) ## package gets historical stock prices for publicly traded companies on the NASDAQ and NYSE
amzn = getSymbols("AMZN",auto.assign=FALSE) ##download data on Amazon's stock price
sampleTimes = index(amzn) ##assing the amazon index to sampleTimes handle

list2012 = grep("^2012",sampleTimes, value = TRUE) ##return the elements of sampleTimes that begin with 2012

length(list2012) ##how many elements in list2012

days2012 = wday(list2012, label = TRUE) ## convert the dates in list2012 to weekdays

mondays2012 = grep("^Mon",days2012, value = TRUE) ## return the elements of days2012 that begin with Mon

length(mondays2012) ##how many elements in mondays2012


