# Load lubridate package
library(lubridate)

# Set graphics device to PNG
png(filename = "plot3.png")

# Read file into data variable
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$datetime <- dmy_hms(paste(data$Date,data$Time))

# Subset data by selecting only Feb 1 and Feb 2 of 2007
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plot chart
plot(data$datetime, y = data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$datetime, y = data$Sub_metering_2, col = "red")
lines(data$datetime, y = data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1), 
       lwd = c(1.5,1.5))
dev.off()