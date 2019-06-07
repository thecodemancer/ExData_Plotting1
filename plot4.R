setwd('D:/Coursera/DS')
dataset<-read.csv('household_power_consumption.txt',sep = ';', stringsAsFactors = FALSE)
dataset2<-subset(dataset,Date %in% c('1/2/2007','2/2/2007'))
dataset3<-transform(dataset2,
                    Date=strptime(dataset2$Date,format='%d/%m/%Y'),
                    Time=strptime(paste(Date,Time),format='%d/%m/%Y %H:%M:%S'),
                    Global_active_power=as.numeric(Global_active_power),
                    Global_reactive_power=as.numeric(Global_reactive_power),
                    Voltage=as.numeric(Voltage),
                    Global_intensity=as.numeric(Global_intensity),
                    Sub_metering_1=as.numeric(Sub_metering_1),
                    Sub_metering_2=as.numeric(Sub_metering_2),
                    Sub_metering_3=as.numeric(Sub_metering_3)
)
png(file='plot4.png')
par(mfrow=c(2,2))
#plot top left
plot( dataset3$Time, dataset3$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

#plot top right
plot( dataset3$Time, dataset3$Voltage, type='l', xlab='datetime', ylab='Voltage')

#plot bottom left
plot( dataset3$Time, dataset3$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
points(dataset3$Time, dataset3$Sub_metering_2, type='l', col='red')
points(dataset3$Time, dataset3$Sub_metering_3, type='l', col='blue')
legend("topright", pch='-', col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3') )

#plot bottom right
plot( dataset3$Time, dataset3$Global_reactive_power, type='l', xlab='datetime', ylab = 'Global_reactive_power')
dev.off()