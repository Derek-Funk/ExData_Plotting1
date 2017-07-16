# import and format data
data_full <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data_use <- subset(data_full, Date == "1/2/2007" | Date == "2/2/2007")
data_use$Date <- as.Date(data_use$Date, "%d/%m/%Y")
data_use$DateTime <- as.POSIXct(paste(data_use$Date, data_use$Time))
data_use$Global_active_power <- as.numeric(as.character(data_use$Global_active_power))

# create plot
plot(data_use$Global_active_power ~ data_use$DateTime, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

# create image file
dev.copy(png, "plot2.png")
dev.off()