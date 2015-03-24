################################################Question 1######################################

setwd("C:/Users/KOLeary/Documents/GitHub/Getting and Cleaning Data")

readfile <- read.csv("getdata-data-Fss06hid.csv", colClasses = "character")

splitNames = strsplit(names(readfile),"wgtp")

splitNames[123]

################################################Question 2######################################

readgdp <- read.csv("getdata-data-GDP.csv", skip=4, nrows = 190) 

colofinterest = gsub("\\,","",readgdp$X.4, )

mean(as.numeric(colofinterest))

################################################Question 3######################################

readgdp <- read.csv("getdata-data-GDP.csv", skip=4, nrows = 190) 

head(readgdp)

newgdp <- sub("X.3","countryNames",names(readgdp),)

colnames(readgdp) <- newgdp

grep("^United",readgdp$countryNames)

################################################Question 4######################################

readgdp <- read.csv("getdata-data-GDP.csv", skip=4, nrows = 190) 

readedata <- read.csv("getdata-data-EDSTATS_Country.csv")

match_tables <- data.frame(matchcol = match(readedata[['CountryCode']], readgdp[['X']] ), Junend = readedata$Special.Notes)

length(grep("^Fiscal year end: June", match_tables$Junend))

################################################Question 5######################################

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

