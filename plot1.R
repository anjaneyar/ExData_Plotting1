dataa <-  read.table(file="household_power_consumption.txt", sep=";", header=T,na.strings = "NA",col.name=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), colClasses = c("character","character","character","character","character","character","character","character","character"))
subdata1 <- dataa[dataa$Date == "1/7/2007" |dataa$Date == "2/7/2007" ,]
subdata1 <- subdata1[subdata1$Global_active_power != '?',3]
subdata1 <- as.numeric(subdata1)
hist(subdata1,main = "Global Active Power",col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,file = "plot1.png",width=480,height=480)
dev.off()
