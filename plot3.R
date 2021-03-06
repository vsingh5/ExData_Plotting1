data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings ="?")

data2 <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

data2$DateTime <- as.POSIXct(paste(as.character(data2$Date), as.character(data2$Time)), format="%d/%m/%Y %H:%M:%S")

png("plot3.png")
with(data2, plot(c(DateTime, DateTime, DateTime), c(Sub_metering_1, Sub_metering_2, Sub_metering_3), type = "n", xlab = "", ylab = "Energy sub metering"))
with(data2, points(DateTime, Sub_metering_1, type = "l"))
with(data2, points(DateTime, Sub_metering_2, type = "l", col="red"))
with(data2, points(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()