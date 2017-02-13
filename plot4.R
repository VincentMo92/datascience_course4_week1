#loads the data from the dates 2007-02-01 and 2007-02-02
data1 <- read.csv("data1.csv", stringsAsFactors = FALSE)

#converts the format of dates
data1$Date_time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

#plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 
with(data1, {
        plot(Date_time, Global_active_power,type = "l",
             ylab = "Global Active Power (kilowatts)", xlab = "")
        plot(Date_time, Voltage,type = "l", 
             ylab = "Voltage", xlab = "datetime")
        with(data1, plot(Date_time, Sub_metering_1, type = "l", col = "black",
                         ylab = "Energy sub metering", xlab = ""))
        with(data1, points(Date_time, Sub_metering_2, type = "l", col = "red"))
        with(data1, points(Date_time, Sub_metering_3, type = "l", col = "blue"))
        legend("topright", pch = "-", col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Date_time, Global_reactive_power, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "datetime")
})
dev.off()