#loads the data from the dates 2007-02-01 and 2007-02-02
data1 <- read.csv("data1.csv", stringsAsFactors = FALSE)

#converts the format of dates
data1$Date_time <- strptime(paste(data1$Date, data1$Time), "%d/%m/%Y %H:%M:%S")

#plot 2
plot(data1$Date_time, as.numeric(data1$Global_active_power),type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()