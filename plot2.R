# Sys.setlocale("LC_TIME", "en_US")
data <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings = "?")
subindex <- which(data[,1] == '1/2/2007' | data[,1] == '2/2/2007')
data <- data[subindex, ]

xticks <- which(data$Time == '00:00:00')
xticks <- c(xticks, nrow(data))
png(filename='plot2.png')
plot(data$Global_active_power,
     main='',
     type='l',
     xlab='',
     xaxt='n',
     ylab='Global Active Power (kilowatts)')
axis(1, at=xticks, labels=c("Thu", "Fri", "Sat"))
dev.off()

