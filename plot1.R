data <- read.table("household_power_consumption.txt", sep=';', header=T, na.strings = "?")
subindex <- which(data[,1] == '1/2/2007' | data[,1] == '2/2/2007')
data <- data[subindex, ]

png(filename='plot1.png')
hist(data$Global_active_power,
     main='Global Active Power',
     col='red',
     xlab='Global Active Power (kilowatts)')
dev.off()