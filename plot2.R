remove(list=ls())

fileName = 'household_power_consumption.txt'

#Reading the data
data = read.table(fileName,header = T,sep=";",stringsAsFactors=FALSE,na.strings ="?")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Extracting Feb-01 and Feb-02 2007 data
sub.data = subset(data, as.Date(DateTime) >= '2007-02-01' & as.Date(DateTime) <= '2007-02-02')

day_of_week = format(sub.data$Date, format="%a")
sub.data = cbind(sub.data,day_of_week)
png(filename = "plot2.png",width = 480, height = 480, units = "px")
plot(sub.data$DateTime,sub.data$Global_active_power,type = "l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()