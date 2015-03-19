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

readgdp <- read.csv("getdata-data-GDP.csv", skip=4, nrows = 190) ##skip the top four rows and reads only the first 190 lines
readedata <- read.csv("getdata-data-EDSTATS_Country.csv")

match_tables <- data.frame(matchcol = match(readgdp$X, readedata$CountryCode), Country = readgdp$X.3) ##creates a dataframe of matched columns with a named column
na.omit(match_tables) ## results in 190 observations
tail(match_tables, 13)
match_tables <- arrange(match_tables, matchcol) 

################################################Question 4######################################

gdpave <- data.frame(matchcol = match(readedata$CountryCode, readgdp$X), CountryCode = readedata$CountryCode, IncomeGroup = readedata$Income.Group, CountryName = readedata$Short.Name) ##create a dataframe of revelant columns

library(dplyr)
convertbl <- tbl_df(gdpave) ## convert table to tbl
rm("gdpave") ## remove other handle
match_tables <- arrange(convertbl, matchcol) ##arrange convertbl by matchcol column
highink <- filter(convertbl, IncomeGroup == "High income: OECD") ##filter the rows by High Income
highinknon <- filter(convertbl, IncomeGroup == "High income: nonOECD") ##filter the rows by nonOECD
nonas <- na.omit(highinknon) ##remove nas from highinknon


mean(highink$matchcol) ##calculate mean of matchcol
mean(nonas$matchcol) ##calculate mean of matchcol

################################################Question 5######################################


nonatable <- na.omit(match_tables) ##remove nas from match_tables
headtable <- head(nonatable, 38) ##create table of the first 38 rows
howink <- filter(headtable, IncomeGroup == "Lower middle income") ##answer = 5


