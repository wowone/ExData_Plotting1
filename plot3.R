data <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings = "?")
subindex <- which(data[,1] == '1/2/2007' | data[,1] == '2/2/2007')
data <- data[subindex, ]

xticks <- which(data$Time == '00:00:00')
xticks <- c(xticks, nrow(data))
png(filename='plot3.png')
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
dev.off()