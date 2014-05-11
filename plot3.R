remove(list=ls())

fileName = 'household_power_consumption.txt'

#Reading the data
data = read.table(fileName,header = T,sep=";",stringsAsFactors=FALSE,na.strings ="?")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Extracting Feb-01 and Feb-02 2007 data
sub.data = subset(data, as.Date(DateTime) >= '2007-02-01' & as.Date(DateTime) <= '2007-02-02')

y1 = sub.data$Sub_metering_1
y2 = sub.data$Sub_metering_2
y3 = sub.data$Sub_metering_3
png(filename = "plot3.png",width = 480, height = 480, units = "px")
plot(sub.data$DateTime,y1,col='black',type = "l",xlab = "",ylab="")
par(new=T)
plot(sub.data$DateTime,y2,ylim=range(c(y1,y2)), axes = FALSE,col='red',xlab = "",ylab="",type = "l")
par(new=T)
plot(sub.data$DateTime,y3,ylim=range(c(y1,y2,y3)),col='blue',xlab = "",ylab = "Energy sub metering",type = "l")
legend("topright",lty=1, col=c('black', 'red', 'blue'), cex=.75,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()