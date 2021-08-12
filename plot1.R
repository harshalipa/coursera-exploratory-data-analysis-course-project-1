library("data.table")
power <- data.table::fread(input = "household_power_consumption.txt")

power[, Global_active_power := lapply(.SD, as.numeric),
      .SDcols = c("Global_active_power")]

png("plot1.png", width=480, height=480)

hist(power[,power$Global_active_power], 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red")

dev.off()

