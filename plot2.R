# Load lubridate package
library(lubridate)

# Set graphics device to PNG
png(filename = "plot2.png")

# Read file into data variable
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                   colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data$datetime <- dmy_hms(paste(data$Date,data$Time))

# Subset data by selecting only Feb 1 and Feb 2 of 2007
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plot chart
plot(data$datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()