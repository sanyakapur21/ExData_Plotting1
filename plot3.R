#loading dataset
info<-read.table("household_power_consumption.txt",skip=1, sep = ";") 

#setting formats and constraints
info$Date<- as.Date(info$Date, format="%d/%m/%Y")
info$Time<-strptime(info$time,format="%H:%M:%S")
info1<- subset(info, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datm<-paste(as.Date(info1$Date), info1$Time)
info1$Datetime <- as.POSIXlt(datm)

#plotting graphs
plot(info1$Sub_metering_1 ~ info1$Datetime, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(info1$Sub_metering_2 ~ info1$Datetime,col='Red')
lines(info1$Sub_metering_3 ~ info1$Datetime,col='Blue')
legend("topright",col=c("black", "red", "blue"), lty=1,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2)

#Graph annotation
title(main="Energy sub-metering")
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()