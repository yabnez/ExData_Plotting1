#
# plot 1
#
#install.packages("data.table")
#library(data.table)

# read file
file<-"household_power_consumption/household_power_consumption.txt"
if (!exists("ac") & !exists("tb")) {
tb<-fread(file, header=TRUE, sep=";", encoding="UTF-8", 
            data.table=FALSE)
}
if (!exists("ac")) {
ac<-subset(tb, as.Date(strptime(Date, "%d/%m/%Y"))=="2007-02-01"|
                 as.Date(strptime(Date, "%d/%m/%Y"))=="2007-02-02")
rm(tb)
}

#

png(file="plot1.png", width=480, height=480)
hist(as.numeric(as.character(ac$Global_active_power)), col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()