#Obtain data
hpc <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#Filter data set from Feb. 1, 2007 to Feb. 2, 2007
cleandata <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Time format
cleandata$Time <- strptime(paste(cleandata$Date, cleandata$Time, sep =" ") ,"%d/%m/%Y %H:%M:%S")

#Create plot 3
plot(cleandata$Time,cleandata$Sub_metering_1, type = "l", main = "", 
     ylab = "Energy sub metering", xlab = "")
lines(cleandata$Time, cleandata$Sub_metering_2, type = "l", col = "red")
lines(cleandata$Time, cleandata$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save as PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480) 
dev.off() 

