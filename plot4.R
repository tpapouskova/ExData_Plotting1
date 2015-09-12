download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power_consumption.zip")
unzip("power_consumption.zip")

allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",na.strings = "?", 
                      colClasses = c("character", "character", rep("numeric", times = 7)), comment.char = "")

data <- subset (allData, (allData$Date == "1/2/2007") | (allData$Date == "2/2/2007"))

data <- within (data, {timestamp=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")})

png(filename = "plot4.png")
par(mfrow = c(2,2))

with (data, plot(timestamp, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

with (data, plot(timestamp, Voltage, type = "l", ylab = "Voltage", xlab = "datetime"))

with (data, plot(timestamp, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with (data, lines(timestamp, Sub_metering_2, type = "l", col="red"))
with (data, lines(timestamp, Sub_metering_3, type = "l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1, bty = "n")

with (data, plot(timestamp, Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime"))

dev.off()