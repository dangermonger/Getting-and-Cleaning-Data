################################################Question 1######################################

setwd("C:/Users/KOLeary/Documents/GitHub/Getting and Cleaning Data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" 
download.file(fileUrl, destfile = "./getdata-data-Fss06hid.csv", mode="wb")

codebook <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(codebook, destfile = "./getdata-data-PUMSDataDict06.pdf", mode="wb")

readfile <- read.csv("getdata-data-Fss06hid.csv", colClasses = "character")

agricultureLogical <- readfile$AGS == 6 & readfile$ACR == 3 ##create logical vector

which(agricultureLogical) ##which rows of the logical vector are true

################################################Question 2######################################

install.packages("jpeg")

library(jpeg)

image <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(image, destfile = "./getdata-jeff.jpg", mode="wb")

imageview <- readJPEG("getdata-jeff.jpg", native = TRUE)

quantile(imageview,  probs = c(0.3, 0.8)) ##return the 30th and 80th quantile

################################################Question 3######################################

gdpdata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv" 
download.file(gdpdata, destfile = "./getdata-data-GDP.csv", mode="wb")

edata <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" 
download.file(edata, destfile = "./getdata-data-EDSTATS_Country.csv", mode="wb")

readgdp <- read.csv("getdata-data-GDP.csv", colClasses = "character", skip=4) ##skip the top four rows
readedata <- read.csv("getdata-data-EDSTATS_Country.csv", colClasses = "character")

match_tables <- data.frame(matchcol = match(readgdp$X, readedata$CountryCode)) ##creates a dataframe of matched columns with a named column
str(match_tables)
colnames(match_tables)

library(dplyr)
match_tables <- arrange(match_tables, desc(matchcol))
head(match_tables)

convertbl <- tbl_df(readgdp) ## convert table to tbl
rm("readgdp") ## remove other handle
convertbl ##print converted table
arrange(convertbl, X.1)


class(convertbl)
str(convertbl)










head(readgdp)

readgdp <- arrange(readgdp, desc(X.1))

## merge datasets and in descending order by GDP rank 


match(readedata$CountryCode, readgdp$X)

mergedData = merge(readgdp, readedata, by.x="X.4", by.y="Short.Name")

library(plyr)

join(readgdp, readedata, by = "Short.Name")
arrange(join(readgdp, readedata), Short.Name)

library(dplyr) ##bring up dplr library
convertbl <- tbl_df(new) ## convert table to tbl
rm("readgdp") ## remove other handle
convertbl ##print converted table
select(convertbl, column1, column2)## for columns
filter(convertbl, column1 == "value1", column2 == "value2") ## for finding row information

x <- c("a","b","c",4,5,6,8)
y <- c("a","b","c",4,8,9,0)
match(x, y)

bob <- data.frame(bob = c(3,2,1))
arrange(bob, bob$1)
tom <- data.frame(tom = c("UK", "AU", "US"))

match(tom$tom, bob$bob) ##order is important here!!

