## Load in data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

## Combine two date variables into one timedate variable
data <- within(data, { timestamp = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")})

## Select only relevant columns
data <- data[, 3:10]

## Select only relevant days
data <- subset(data, data$timestamp$year == 107 & data$timestamp$mon == 1 & data$timestamp$mday %in% c(1, 2))

## Create Plot 3
png("plot3.png", width = 480, height = 480, units = "px")
plot(data$timestamp, data$Sub_metering_1, type = "s", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$timestamp, data$Sub_metering_2, type = "s", col = "red")
lines(data$timestamp, data$Sub_metering_3, type = "s", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()