
powerData <-read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings=c("NA","?",""), )
powerData$Etime <- strptime(tz="",paste(powerData$Date,powerData$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
powerData$Date <- strptime(tz="",powerData$Date,"%d/%m/%Y")
tidyData <- subset(powerData, Date >= as.POSIXlt.date("2007-02-01") & Date <= as.POSIXlt.date("2007-02-02"))

png("plot2.png",width=480,height=480)

xrange <- range(tidyData$Etime)
yrange <- range(tidyData$Global_active_power)

plot(xrange, yrange, xlab="", ylab="Global Active Power (kilowatts)" )
lines(tidyData$Etime, tidyData$Global_active_power, lwd=1 )
legend("")
dev.off()
