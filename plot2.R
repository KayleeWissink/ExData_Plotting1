## Load Data
data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

## Subsetting the data 
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

## Converting dates 
date_time <- paste(as.Date(data_subset$Date), data_subset$Time) 
data_subset$Datetime <- as.POSIXct(date_time) 

## Create Plot
with(data_subset, plot(Global_active_power~Datetime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l"))

## Saving to file 
dev.copy(png, file="plot2.png", height=480, width=480) 
dev.off() 
