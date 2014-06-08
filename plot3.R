
powerData <-read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings=c("NA","?",""), )
powerData$Etime <- strptime(tz="",paste(powerData$Date,powerData$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
powerData$Date <- strptime(tz="",powerData$Date,"%d/%m/%Y")
tidyData <- subset(powerData, Date >= as.POSIXlt.date("2007-02-01") & Date <= as.POSIXlt.date("2007-02-02"))

head(tidyData)

png("plot3.png",width=480,height=480)

xrange <- range(tidyData$Etime)
yrange <- range(tidyData$Sub_metering_1,tidyData$Sub_metering_2,tidyData$Sub_metering_3)

plot(tidyData$Etime, tidyData$Sub_metering_1, type="l", ylim=yrange, xlab="",ylab="Energy sub metering")
lines(tidyData$Etime, tidyData$Sub_metering_2, lwd=1, col="red")
lines(tidyData$Etime, tidyData$Sub_metering_3, lwd=1, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),
       col= c("black","blue", "red"))
dev.off()
