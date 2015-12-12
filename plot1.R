data <- read.table("household_power_consumption.txt", header = TRUE, sep =";", na.strings ="?")

data2 <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')

png("plot1.png")
hist(data2$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
