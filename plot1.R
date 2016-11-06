## The dataset  2,075,259 rows and 9 columns
## I take a rough assumption that each data is numeric type and can be considered as a 
## double precision floating point number. It is stored using 8 bytes of memory
## 2,075,259 × 9 × 8 bytes/numeric
2075259 * 9 * 8
## = 149,418,648 bytes
## = 149,418,648 / 2^20 bytes/MB
149418648/2^20
## = 142.4967 MB
## check the memory limit
memory.limit()
## memory.limit = 3976 MB > 143 MB, so I can load the whole data frame in R
## Download and unzip the data

if(!file.exists("./project_1_data")){
    dir.create("./project_1_data")
    fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

    download.file(fileUrl, 
              destfile = "./project_1_data/household_power_consumption.zip", method = "curl")

    unzip(zipfile = "./project_1_data/household_power_consumption.zip",
      exdir = "./project_1_data")
}
files <- list.files("./project_1_data")

## printing "files" allows to know the name of the file containing the uncompressed data
files

##//////////////////////////////////////////////////////////////////////////////////
## Reading the data : 
## 1) We will only be using data from the dates 2007-02-01 and 2007-02-02
## 2) it useful to convert the Date and Time variables to Date/Time classes
##    in R using the strptime() and as.Date() functions.
## 3) Note that in this dataset missing values are coded as ?
## 4) our code file should include code for reading the data 
##    so that the plot can be fully reproduced
##//////////////////////////////////////////////////////////////////////////////////

initial <- read.table(paste("./project_1_data",files[1],sep = "/"), nrows = 4)
initial 
## the first 4 rows of the file reveal: a) that the separator is the character ";",  
## the first line contains the variable names
## In addition to that, the section "loading the data" of the "Course Project 1"
## instructionS indicates that in this dataset missing values are coded as "?"
## I'll use "read.csv2" because the separator by default is ";", with the argument
## na.strings = "?"

head_data <- read.csv2(paste("./project_1_data",files[1],sep = "/"),nrows = 4,
                       na.strings = "?")
names(head_data)

## the first two colons will be read as character and the last 7
colClasses_dataset = c("character","character",rep("numeric",7))
whole_data <- read.table(paste("./project_1_data",files[1], sep = "/"), header = TRUE, 
                         sep = ";", colClasses = colClasses_dataset, na.strings = "?")

str(whole_data)
library(lubridate)

whole_data$dmy_hms <- dmy_hms(paste(whole_data$Date,whole_data$Time, sep = " "))
str(whole_data)

## Note that we will only be using data from the dates 2007-02-01 and 2007-02-02
date1 <- as.POSIXlt(as.Date("2007-02-01"))
date2 <- as.POSIXlt(as.Date("2007-02-03"))

## checking the result of the subseting opperation
data <- subset(whole_data, whole_data$dmy_hms >= date1 & whole_data$dmy_hms < date2 )
str(data)
tail(data$Date)
tail(data$Time)

##/////////////////////////////////////////////////////////////////////////////////
## Creation of Histogram of "Global Active Power"
##////////////////////////////////////////////////////////////////////////////////
hist(data$Global_active_power, col = "orangered", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
## generation of the file
dev.copy(png, file = "plot1.png")
dev.off()
