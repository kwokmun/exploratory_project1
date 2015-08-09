# Load lubridate package
library(lubridate)

# Set graphics device to PNG
png(filename = "plot4.png")

# Read file into data variable
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$datetime <- dmy_hms(paste(data$Date,data$Time))

# Subset data by selecting only Feb 1 and Feb 2 of 2007
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plot chart
par(mar = c(4,4,4,2), oma = c(4,3,2.5,3), mfcol = c(2,2), cex.lab = 0.8, cex.axis = 0.8)
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(data$datetime, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$datetime, y = data$Sub_metering_2, col = "red")
lines(data$datetime, y = data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), 
       lwd = c(1.5,1.5), bty = "n", cex = 0.78)
plot(data$datetime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(data$datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()