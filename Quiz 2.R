############################################# Question 1 ##############################################################

##WORK setwd("C:/Users/KOLeary/Documents/GitHub/Getting and Cleaning Data")
setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data")

library(httr)
##install.packages("jsonlite")
##install.packages("httpuv")
library(jsonlite)
library(httpuv)

############################################## UPDATING R ######################################
if(!require(installr)) {
  install.packages("installr"); require(installr)} #load / install+load installr

updateR()

################################################################################################

##remove.packages("Rcpp")
##install.packages("Rcpp")

##remove.packages("jsonlite")
##install.packages("jsonlite")

##remove.packages("httpuv")
##install.packages("httpuv")


oauth_endpoints("github")


myapp <- oauth_app("Coursera Instructor Repos",  "1b507cb194dd89792f4d", "5c983dee0199947cc13ef57171bfb423a1a49b0c")
                

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

json1 = content(req)
json2 = jsonlite::fromJSON(toJSON(json1))

str(json2)
json2
colnames(json2)

new <- json2[44:45]
str(new)
class(new)
colnames(new)
new

new[5,]


#################################################### Question 2 ######################################################

install.packages("sqldf")
library(sqldf)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 

download.file(fileUrl, destfile = "./getdata-data-06pid.csv")

acs <- read.csv("getdata-data-06pid.csv")

## select only the data for the probability weights pwgtp1 with ages less than 50?

##sqldf("select * from acs where AGEP < 50 and pwgtp1")
## sqldf("select * from acs where AGEP < 50")
## sqldf("select pwgtp1 from acs")
sqldf("select pwgtp1 from acs where AGEP < 50")

#################################################### Question 3 ######################################################

sqldf("select distinct AGEP from acs")
##sqldf("select AGEP where unique from acs")
##sqldf("select unique AGEP from acs")
##sqldf("select unique * from acs")

#################################################### Question 4 ######################################################

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con)
close(con)
htmlread <- htmlCode
str(htmlread)
nchar(htmlread[10])
nchar(htmlread[20])
nchar(htmlread[30])
nchar(htmlread[100])

#################################################### Question 5 ######################################################

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for" 

download.file(fileUrl, destfile = "./getdata-data-sst8110.for")


fwfread <- read.fwf("getdata-data-sst8110.for", 
                    skip=1257,
                    width=200)

fwfread ## count the widths


fwfread2 <- read.fwf("getdata-data-sst8110.for", 
            skip=4, ##skip first four lines
            widths=c(12, 7,4, 9,4, 9,4, 9,4))

head(fwfread2)

sum(fwfread2$V4)
