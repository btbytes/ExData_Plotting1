# Plot 3
hpc = read.csv2("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
data <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))
png("plot3.png", bg="transparent", width=480, height=480)

plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()