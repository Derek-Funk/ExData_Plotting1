# import and format data
data_full <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data_use <- subset(data_full, Date == "1/2/2007" | Date == "2/2/2007")
data_use$Date <- as.Date(data_use$Date, "%d/%m/%Y")
data_use$DateTime <- as.POSIXct(paste(data_use$Date, data_use$Time))
data_use$Global_active_power <- as.numeric(as.character(data_use$Global_active_power))
data_use$Global_reactive_power <- as.numeric(as.character(data_use$Global_reactive_power))
data_use$Sub_metering_1 <- as.numeric(as.character(data_use$Sub_metering_1))
data_use$Sub_metering_2 <- as.numeric(as.character(data_use$Sub_metering_2))
data_use$Sub_metering_3 <- as.numeric(as.character(data_use$Sub_metering_3))
data_use$Voltage <- as.numeric(as.character(data_use$Voltage))

# create plot in image file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(data_use$Global_active_power ~ data_use$DateTime, type = "l", xlab = "",
     ylab = "Global Active Power")
plot(data_use$Voltage ~ data_use$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data_use$Sub_metering_1 ~ data_use$DateTime, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(data_use$Sub_metering_2 ~ data_use$DateTime, col = "red")
lines(data_use$Sub_metering_3 ~ data_use$DateTime, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,
       col = c("black", "red", "blue"))
plot(data_use$Global_reactive_power ~ data_use$DateTime, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()