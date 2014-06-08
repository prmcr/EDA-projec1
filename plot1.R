
powerData <-read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings=c("NA","?",""), )
powerData$Date <- strptime(tz="",powerData$Date,"%d/%m/%Y")
tidyData <- subset(powerData, Date >= as.POSIXlt.date("2007-02-01") & Date <= as.POSIXlt.date("2007-02-02"))

png("plot1.png",width=480,height=480)
hist(tidyData$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)",col="red")
dev.off()
