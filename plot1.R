download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power_consumption.zip")
unzip("power_consumption.zip")

setClass("consumption_date")
setAs ("character", "consumption_date", function (from) {as.Date(from, "%d/%m/%Y")})

setClass("consumption_time")
setAs ("character", "consumption_time", function (from){strptime(from, "%H:%M:%S")})

allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".",na.strings = "?", 
                   colClasses = c("consumption_date", "consumption_time", rep("numeric", times = 7)), comment.char = "")

data <- subset (allData, (allData$Date == "2007-02-01") | (allData$Date == "2007-02-02"))

png(filename = "plot1.png")
with (data, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.off()



