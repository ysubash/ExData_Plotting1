remove(list=ls())

fileName = 'household_power_consumption.txt'

#Reading the data
data = read.table(fileName,header = T,sep=";",stringsAsFactors=FALSE,na.strings ="?")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Extracting Feb-01 and Feb-02 2007 data
sub.data = subset(data, as.Date(DateTime) >= '2007-02-01' & as.Date(DateTime) <= '2007-02-02')

png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(sub.data$Global_active_power,xlab='Global Active Power (kilowatts)',col='red',main='Global Active Power')
dev.off()






