#Obtain data
hpc <- read.table("household_power_consumption.txt", header = TRUE, 
                  sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#Filter data set from Feb. 1, 2007 to Feb. 2, 2007
cleandata <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

#Time format
cleandata$Time <- strptime(paste(cleandata$Date, cleandata$Time, sep =" ") ,"%d/%m/%Y %H:%M:%S")

#Create plot 1
hist(cleandata$Global_active_power, main = "Global Active Power",  
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red") 

#Save as PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480) 
dev.off() 