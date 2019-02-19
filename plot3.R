library(data.table)
library(dplyr)
library(lubridate)
data <- fread(file = "household_power_consumption.txt", sep = ";", 
              skip = c("1/2/2007"), nrows = 2880, na.strings = "?", data.table = TRUE)
colnames(data) <- names(fread("household_power_consumption.txt", sep = ";", nrows = 1))
data <- mutate(data, datetime = dmy_hms(paste(Date, Time)))
# convert the Date and Time variables to Date/Time classes in a new variable
# or using as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty=1, lwd=2.5, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()