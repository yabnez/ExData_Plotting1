#
# plot 2
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

png(file="plot2.png", width=480, height=480)
plot(dateTime, as.numeric(ac$Global_active_power), 
     main="", type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()