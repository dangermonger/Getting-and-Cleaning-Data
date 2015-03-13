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

setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
download.file(fileUrl, destfile = "./getdata-data-ss06pid.csv")
dateDownloaded <- date()
dateDownloaded

install.packages("data.table")
library(data.table)

readfile <- read.csv("getdata-data-ss06pid.csv", colClasses = "character")
str(readfile)

convertDT <- data.table(readfile)##converts readfile dataframe into a data table
tables()

DT <- convertDT[, pwgtp15:=as.numeric(pwgtp15)]

# Example average pwgt15 by SEX
DT2 <- as.data.frame(DT[, mean(pwgtp15, na.rm = TRUE),by = SEX])

##WRONG slightly slower than 3 - option1 <- tapply(DT$pwgtp15,DT$SEX,mean)
##WRONG too slow - option2 <- DT[,mean(pwgtp15),by=SEX]
option3 <- sapply(split(DT$pwgtp15,DT$SEX),mean)
##WRONG, gives mean of both together - option4 <- mean(DT$pwgtp15,by=DT$SEX)
##WRONG, gives second result of expression only - option5 <- mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
#WRONG, gives no result, doesn't reference pwgtp15 - option6 <- rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

system.time( replicate(100000, DT2) ) 

system.time( replicate(1000000, option1) ) 
##system.time( replicate(100000, option2) ) 
system.time( replicate(1000000, option3) ) 



## option 3 correct

