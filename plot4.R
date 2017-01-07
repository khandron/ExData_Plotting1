# this package made loading the data faster, uncomment if they are not loaded
#install.packages("data.table")
#library(data.table)

#read in the file
alldata <- fread("household_power_consumption.txt", sep=";", na="?")

#pick out the 2 dates we want and set to numeric
subdata <- subset(alldata, alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007")

#format date and data
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActive <- as.numeric(subdata$Global_active_power)
globalReactive <-as.numeric(subdata$Global_reactive_power)
voltage <- as.numeric(subdata$Voltage)



#make plot and send to png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, globalActive, type="l", ylab = "Global Active Power", xlab = "")

plot(datetime, voltage, type="l", ylab = "Voltage", xlab = "datetime")

plot(datetime, subdata$Sub_metering_1, type="l", xlab="", ylab="Enegry sub metering")
lines(datetime, subdata$Sub_metering_2, col="red")
lines(datetime, subdata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Submetering_2", "Sub_metering3"), box.col = "white", lty=1, col=c("black", "red", "blue"))

plot(datetime, globalReactive, type="l", ylab = "Global_Reactive_Power", xlab="datetime")

dev.off()
