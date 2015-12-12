data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings ="?")

data2 <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

data2$DateTime <- as.POSIXct(paste(as.character(data2$Date), as.character(data2$Time)), format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(data2$DateTime, data2$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()
