################################################Question 1######################################

setwd("C:/Users/KOLeary/Documents/GitHub/Getting and Cleaning Data")

readfile <- read.csv("2Fss06hid.csv", colClasses = "character")

valcol <- readfile[, 'VAL']
sum(valcol == 24)


###############################################Question 3######################################

install.packages("xlsx")
library(xlsx)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx" 
download.file(fileUrl, destfile = "./getdata-data-DATA.gov_NGAP.xlsx", mode="wb")

colIndex <- 7:15
rowIndex <- 18:23


dat <- read.xlsx("./getdata-data-DATA.gov_NGAP.xlsx", sheetIndex = 1,  colIndex = colIndex, rowIndex = rowIndex )
sum(dat$Zip*dat$Ext,na.rm=T) 

##you need the mode='wb' argument to download xlsx workbooks correctly. This downloads in binary mode.

##############################################Question 4#######################################


fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" 
download.file(fileUrl, destfile = "./restaurants.xml", mode="wb")

install.packages("XML")

library(XML)##load XML package
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" ##assign file url to fileUrl
doc <- xmlTreeParse(fileUrl,useInternal=TRUE) ##xmlTreeParse parses xml documents
rootNode <- xmlRoot(doc)##xmlRoot looks at the wrapper for the entire document

rootNode[[1]][[1]][[2]]##finds the second element (zipcode) in the first section of the entire document

zipcodes <- xpathSApply(rootNode,"//zipcode",xmlValue)
sum(zipcodes == 21231)## counts the number of 21231s in zipcodes

##you have to change https to http to read xml

###########################################Question 5##########################################

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
download.file(fileUrl, destfile = "./getdata-data-ss06pid.csv")
dateDownloaded <- date()
dateDownloaded

install.packages("data.table")
library(data.table)

readfile <- read.csv("getdata-data-ss06pid.csv", colClasses = "character")

DT = data.table(readfile)##converts readfile dataframe into a data table
str(DT)


option1 <- tapply(DT$pwgtp15,DT$SEX,mean)
file <- tempfile()
write.table(option1, file=file, row.names=FALSE, col.names=TRUE, sep="\t", quote=FALSE)
system.time(fread(file))

option1 <- tapply(DT$pwgtp15,DT$SEX,mean)

system.time(fread(file)))
            
tapply(DT$pwgtp15,DT$SEX,mean)

ptm <- proc.time()##start timer
g <- rnorm(10)## a list of ten random numbers
h <- rep(NA, 10)## an empty list of ten
for (i in 1:10){ ## for every i in the range
  h[i] <- g[i] + 2 ## the empty list is populated by g + 1
}
proc.time() - ptm ##end timer

