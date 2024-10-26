#First let us extract the data from the file
data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE)
#Now let us extract the data for the dates 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Now let us convert the Date column to Date format, Based on the instructions
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime((paste(data$Date, data$Time, sep = " ")),
                      format = "%Y-%m-%d %H:%M:%S")

#Now let us plot the data as per the requirements
#First let set Graphics device
png("plot4.png", width = 480, height = 480)
#Second let us Plot the graph on the device
par(mfrow = c(2, 2))
#First plot
plot(data$Time, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
#Second plot
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Third plot
plot(data$Time, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.6, lty = 1, col = c("black", "red", "blue"), bty = "n")
#Fourth plot
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()
