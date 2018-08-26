#
# plot 4
#
#install.packages("data.table")
#library(data.table)
Sys.setlocale("LC_ALL", 'English')

# read file
file<-"household_power_consumption/household_power_consumption.txt"
if (!exists("ac") & !exists("tb")) {
  tb<-fread(file, header=TRUE, sep=";", encoding="UTF-8", 
            data.table=TRUE)
}
if (!exists("ac")) {
  ac<-subset(tb, as.Date(strptime(Date, "%d/%m/%Y"))=="2007-02-01" |
               as.Date(strptime(Date, "%d/%m/%Y"))=="2007-02-02")
  if(!exists("tb")) rm(tb)
}

#
dateTime<-strptime(paste(ac$Date, ac$Time, sep=" "),
                   "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)
#par(ps=10) # font size
par(mfrow =c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# 1
plot(dateTime, as.numeric(ac$Global_active_power),
     main="", type="l", xlab="", ylab="Global Active Power")

#2
plot(dateTime, as.numeric(ac$Voltage),
     main="", type="l", xlab="datetime", ylab="Voltage")


# 3
plot(dateTime, as.numeric(ac$Sub_metering_1),
     main="", type="n", xlab="", ylab="Energy sub metering")

lines(dateTime, as.numeric(ac$Sub_metering_1))
lines(dateTime, as.numeric(ac$Sub_metering_2), col="red")
lines(dateTime, as.numeric(ac$Sub_metering_3), col="blue")

legend("topright", lty=c(1,1,1), lwd=c(2,2,2),
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
# 4
#

plot(dateTime, as.numeric(ac$Global_reactive_power),
     main="", type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()