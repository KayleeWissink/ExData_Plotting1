## Load Data
data<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

## Subsetting the data 
data_subset <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

## Converting dates 
date_time <- paste(as.Date(data_subset$Date), data_subset$Time) 
data_subset$Datetime <- as.POSIXct(date_time) 

## Create Plots
par(mfrow = c(2,2))
## Plot 1
with(data_subset, plot(Global_active_power~Datetime, ylab = "Global Active Power", xlab = "", type = "l"))
## Plot 2
with(data_subset, plot(Voltage~Datetime, ylab = "Voltage", xlab = "datetime", type = "l"))
## Plot 3
with(data_subset, plot(Sub_metering_1~Datetime, ylab = "Energy sub metering", xlab = "", type = "l"))
lines(data_subset$Sub_metering_2~data_subset$Datetime, col = "red")
lines(data_subset$Sub_metering_3~data_subset$Datetime, col = "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Plot 4
with(data_subset, plot(Global_reactive_power~Datetime, ylab = "Global_reactive_power", xlab = "datetime", type = "l"))

## Saving to file 
dev.copy(png, file="plot4.png", height=480, width=480) 
dev.off() 