#loading dataset
info<-read.table("household_power_consumption.txt",skip=1 , sep = ";") 

#setting formats and constraints
info1 <- subset(info, Date %in% c("1/2/2007","2/2/2007"))
info$Time<-strptime(info$time,format="%H:%M:%S")
hist(as.numeric(as.character(info1$Global_active_power)),main='Global Active Power',xlab='Global Active Power (kilowatts)', col='red')

#Graph annotation
title(main="Global Active Power")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()