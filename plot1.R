# Plot 1
hpc = read.csv2("household_power_consumption.txt", header=TRUE, sep=";")
hpcSubset <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007"), ]
gap <- as.numeric(hpcSubset$Global_active_power)
png("plot1.png", bg="transparent", width=480, height=480)

hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()

