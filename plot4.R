datafile <- "./household_power_consumption.txt"
data <- read.table(datafile, header = TRUE, sep = ";", stringsAsFactors = FALSE,dec = ".")
HPCSubset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(HPCSubset$Date, HPCSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(HPCSubset$Global_active_power)
globalReactivePower <- as.numeric(HPCSubset$Global_reactive_power)
voltage <- as.numeric(HPCSubset$Voltage)
subMeter1 <- as.numeric(HPCSubset$Sub_metering_1)
subMeter2 <- as.numeric(HPCSubset$Sub_metering_2)
subMeter3 <- as.numeric(HPCSubset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMeter1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()