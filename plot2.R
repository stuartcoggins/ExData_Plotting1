## Load in data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Combine two date variables into one timedate variable
data <- within(data, { timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")})

## Select only relevant columns
data <- data[, 3:10]

## Select only relevant days
data <- subset(data, data$timestamp$year == 107 & data$timestamp$mon == 1 & data$timestamp$mday %in% c(1, 2))

## Create Plot 2
png("plot2.png", width = 480, height = 480, units = "px")
plot(data$timestamp, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()