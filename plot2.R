# Plot 2
hpc = read.csv2("household_power_consumption.txt", header=TRUE, sep=";")
hpcSubset <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]
dateTime <- strptime(paste(hpcSubset$Date, hpcSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(hpcSubset$Global_active_power)
png("plot2.png", bg="transparent", width=480, height=480)

plot(dateTime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
