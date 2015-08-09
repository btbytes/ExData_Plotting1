# Plot 4
hpc = read.csv2("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
data <- subset(hpc, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

png(filename="plot4.png", bg="transparent", width=480, height=480)

par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$DateTime, data$Sub_metering_1,col="black", xlab= "", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", bty="n", col=c("black", "red", "blue"),
      c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      lwd=1)
plot(data$DateTime, data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab=colnames(data)[4])
dev.off()