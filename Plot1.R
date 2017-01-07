# this package made loading the data faster, uncomment if they are not loaded
#install.packages("data.table")
#library(data.table)

#read in the file
alldata <- fread("household_power_consumption.txt", sep=";", na="?")

#pick out the 2 dates we want and set to numeric
subdata <- subset(alldata, alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007")
data <- as.numeric(subdata$Global_active_power)

#make histogram
hist(data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# send to png file
png("plot1.png", width=480, height=480)
hist(data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


