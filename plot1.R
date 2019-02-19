library(data.table)
library(dplyr)
library(lubridate)
data <- fread(file = "household_power_consumption.txt", sep = ";", 
              skip = c("1/2/2007"), nrows = 2880, na.strings = "?", data.table = TRUE)
colnames(data) <- names(fread("household_power_consumption.txt", sep = ";", nrows = 1))
data <- mutate(data, datetime = dmy_hms(paste(Date, Time)))
# convert the Date and Time variables to Date/Time classes in a new variable
# or using as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     col = "red", main = "Global Active Power")
dev.off()