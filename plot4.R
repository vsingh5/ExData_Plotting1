data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings ="?")

data2 <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

data2$DateTime <- as.POSIXct(paste(as.character(data2$Date), as.character(data2$Time)), format="%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))

plot(data2$DateTime, data2$Global_active_power, type = "l", ylab = "Global Active Power", xlab ="")

plot(data2$DateTime, data2$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

with(data2, plot(c(DateTime, DateTime, DateTime), c(Sub_metering_1, Sub_metering_2, Sub_metering_3), type = "n", xlab = "", ylab = "Energy sub metering"))
with(data2, points(DateTime, Sub_metering_1, type = "l"))
with(data2, points(DateTime, Sub_metering_2, type = "l", col="red"))
with(data2, points(DateTime, Sub_metering_3, type = "l", col="blue"))
legend("topright", bty = "n", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data2$DateTime, data2$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()