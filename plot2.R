#loading dataset
info<-read.table("household_power_consumption.txt",skip=1, sep = ";") 

#setting formats and constraints
info$Date <- as.Date(info$Date, format="%d/%m/%Y")
info$Time<-strptime(info$time,format="%H:%M:%S")
info1 <- subset(info,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
datm<- paste(as.Date(info1$Date), info1$Time)
info1$Datetime <- as.POSIXct(datm)
globalActivePower <- as.numeric(as.character(data1$Global_active_power))
plot(info1$Global_active_power~info1$Datetime, type="l",ylab="Global Active Power(kilowatts)", xlab="")

#Graph annotation
title(main="Global Active Power Vs Time")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
