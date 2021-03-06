################################################################
##
## E:/RCoursera/CourseraClass3/Exploratory-Data-Analysis/plot1.R
##  Exploratory Data Analysis
## Download a zip file and unzip it properly into specified
##   directories - produce some plots
## October 2014 
## This program shows steps to download and unzip the data into
##   a project folder. Those steps will be commented out and
##   not re-run for the plotting
## Each plot program will just read the data in from the text
##   file using the same read.csv.sql step
################################################################
### Clean out data and other functions first
#rm(list=ls())

################################################################
## Some libraries - 
################################################################
## load libraries
library(sqldf)
library(plyr)
library(Hmisc)
library(dplyr)
library(lubridate)
##############################################################
### get the data
###   For subsequent runs, comment out the data download!
##############################################################
#urlname<-"https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
#download.file(url=urlname, destfile="./projectClass3.zip")
#downLoaddate<-date()
filename<-"./projectClass3.zip"
if (!file.exists("projectdat")){
      dir.create("projectdat")
}
### UNZIP the data into projectdat
#unzip(filename, exdir="./projectdat")

##############################################################
## Useful way to scan directories and get a list of files
## This would not automate well in cases where you can add/modify
##   directories or files!! 
##############################################################
directories<-list.dirs(path="./projectdat",   full.names=TRUE)
num<-length(directories)
direct<-list.files(directories[1:num], full.names=TRUE)
direct
## I knew there was just one file but this is useful code to
##    keep - reinforce that I know how to scan diretories
##############################################################
## Keeping some code I did not use - it shows some important 
##  steps for reading in data
##############################################################
#tab100rows <- read.table(direct[1], header = TRUE, nrows = 100, sep=";")
#classes <- sapply(tab100rows, class)
## Use colClasses=classes option in read.table

dat <- read.csv.sql(direct[1], sql = "SELECT * from file
          WHERE Date in('1/2/2007','2/2/2007') ", sep = ";", 
                    header = TRUE)
#dat$Date<-as.Date(strptime(dat$Date, "%d/%m/%Y"))
## could not figure out how to use na.strings option
## in read.csv.sql
## there does not appear to be missing values
str(dat)
describe(dat)

############################################################
png(filename="./figure/plot1.png", width=480, height=480, units="px")
hist(dat$Global_active_power, col=c("red"), main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()
###########################################################
