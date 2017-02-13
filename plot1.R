## Downloads and reads datasets into the worksplace.
wd <- "~/Documents/R_program/course4/"
if(!file.exists(wd)){dir.create(wd)}
setwd(wd)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "~/Documents/R_program/course4/household_power_consumption.zip")
dataDownloaded <- date() # records download time
unzip(zipfile="~/Documents/R_program/course4/household_power_consumption.zip",
      exdir=wd)

#Loads the data from the dates 2007-02-01 and 2007-02-02
library(data.table)
data0 <- fread("~/Documents/R_program/course4/household_power_consumption.txt")
good <- which(data0$Date == "1/2/2007" | data0$Date == "2/2/2007")
data1 <- data0[good,]
write.csv(data1, "data1.csv")

#plot 1
hist(as.numeric(data1$Global_active_power), col = "red",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()