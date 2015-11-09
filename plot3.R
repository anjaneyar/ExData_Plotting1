dataa <-  read.table(file="household_power_consumption.txt", sep=";", header=T,na.strings = "NA",col.name=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), colClasses = c("character","character","character","character","character","character","character","character","character"))
subdata1 <- dataa[dataa$Date == "1/7/2007" |dataa$Date == "2/7/2007" ,]
s2 <- subdata1 [subdata1$Time != "?" & subdata1$Sub_metering_1 != "?",]
c2 <- strptime(paste(s2$Date,s2$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
c3 <- as.numeric(s2$Sub_metering_1)
c4 <- as.numeric(s2$Sub_metering_2)
c5 <- as.numeric(s2$Sub_metering_3)
plot(x=c2,y=c3,type="l",xlab="",ylab="Energy Sub metering",ylim=c(0,60)) 
lines(x=c2,y=c4,type="l",col="red")
lines(x=c2,y=c5,type="l",col="blue")
legend("topright",col=c("black","red","blue"),pch=NA,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=2)
dev.copy(png,file = "plot3.png",width=480,height=480)
dev.off()
