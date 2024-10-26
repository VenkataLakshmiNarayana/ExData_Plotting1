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
png("plot2.png", width = 480, height = 480)
#Second let us Plot the graph on the device
plot(data$Time, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
