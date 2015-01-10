data <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings = "?")
subindex <- which(data[,1] == '1/2/2007' | data[,1] == '2/2/2007')
data <- data[subindex, ]

png(filename='plot4.png')
par(mfrow=c(2,2))
xticks <- which(data$Time == '00:00:00')
xticks <- c(xticks, nrow(data))

plot(data$Global_active_power,
     main='',
     type='l',
     xlab='',
     xaxt='n',
     ylab='Global Active Power')
axis(1, at=xticks, labels=c("Thu", "Fri", "Sat"))

plot(data$Voltage,
     main='',
     type='l',
     xlab='datetime',
     xaxt='n',
     ylab='Voltage')
axis(1, at=xticks, labels=c("Thu", "Fri", "Sat"))

plot(data$Sub_metering_1,
     main='',
     type='l',
     xaxt='n',
     xlab='',
     ylab='Energy sub metering'
     )
axis(1, at=xticks, labels=c("Thu", "Fri", "Sat"))
lines(data$Sub_metering_2, col='red')
lines(data$Sub_metering_3, col='blue')
legend("topright", legend=colnames(data)[7:9], lty=c(1,1,1),
       col=c("black", "red", "blue"))

plot(data$Global_reactive_power,
     main='',
     type='l',
     xlab='datetime',
     xaxt='n',
     ylab='Global Reactive Power')
axis(1, at=xticks, labels=c("Thu", "Fri", "Sat"))

dev.off()
