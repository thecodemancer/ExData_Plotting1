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
png(file='plot3.png')
plot( dataset3$Time, dataset3$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
points(dataset3$Time, dataset3$Sub_metering_2, type='l', col='red')
points(dataset3$Time, dataset3$Sub_metering_3, type='l', col='blue')
legend("topright", pch='-', col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3') )
dev.off()