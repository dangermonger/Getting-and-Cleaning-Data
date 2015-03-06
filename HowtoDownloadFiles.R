setwd("C:/Users/KOLeary/Documents/GitHub/")

if (!file.exists("Getting and Cleaning Data")) {
  dir.create("Getting and Cleaning Data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv" 
codebook <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"

download.file(fileUrl, destfile = "./Getting and Cleaning Data/PUMSDataDict06.pdf")
download.file(codebook, destfile = "./PUMSDataDict06.pdf", mode="wb")

list.files("./Getting and Cleaning Data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx" 
download.file(fileUrl, destfile = "./getdata-data-DATA.gov_NGAP.xlsx", mode="wb")

##you need the mode='wb' argument to download xlsx workbooks and pdfs correctly. This downloads in binary mode.