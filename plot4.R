
powerData <-read.csv("household_power_consumption.txt", header = TRUE, sep=";", na.strings=c("NA","?",""), )
powerData$Etime <- strptime(tz="",paste(powerData$Date,powerData$Time,sep=" "), format="%d/%m/%Y %H:%M:%S")
powerData$Date <- strptime(tz="",powerData$Date,"%d/%m/%Y")
tidyData <- subset(powerData, Date >= as.POSIXlt.date("2007-02-01") & Date <= as.POSIXlt.date("2007-02-02"))


png("plot4.png",width=480,height=480)

yrange <- range(tidyData$Sub_metering_1,tidyData$Sub_metering_2,tidyData$Sub_metering_3)

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(tidyData,{
  plot(tidyData$Etime, tidyData$Global_active_power, lwd=1 , ylim=range(tidyData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)" )
  plot(tidyData$Etime, tidyData$Voltage, lwd=1 , ylim=range(tidyData$Voltage), type="l", xlab="datetime", ylab="Voltage")
  plot(tidyData$Etime, tidyData$Sub_metering_1, type="l", ylim=yrange, xlab="",ylab="Energy sub metering")
  lines(tidyData$Etime, tidyData$Sub_metering_2, lwd=1, col="red")
  lines(tidyData$Etime, tidyData$Sub_metering_3, lwd=1, col="blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),
         col= c("black","blue", "red"))
  plot(tidyData$Etime, tidyData$Global_reactive_power, lwd=1 , ylim=range(tidyData$Global_reactive_power), type="l", ylab="Global_reactive_power" ,xlab = "datetime")
  
})

dev.off()
