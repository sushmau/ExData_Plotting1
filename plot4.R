#Obtain data
hpc <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#Filter data set from Feb. 1, 2007 to Feb. 2, 2007
cleandata <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Time format
cleandata$Time <- strptime(paste(cleandata$Date, cleandata$Time, sep =" ") ,"%d/%m/%Y %H:%M:%S")

#Create plot 4
par(mfrow = c(2,2))


plot(cleandata$Time,cleandata$Global_active_power, type = "l", main = " ", ylab = "Global Active Power", xlab = " ")

plot(cleandata$Time, cleandata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(cleandata$Time, cleandata$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab = " ")
lines(cleandata$Time, cleandata$Sub_metering_2, type = "l", col = "red")
lines(cleandata$Time, cleandata$Sub_metering_3, type = "l", col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, bty = "n",
       col = c("black", "red", "blue"))

plot(cleandata$Time, cleandata$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")



#Save as PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480) 
dev.off() 




par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))