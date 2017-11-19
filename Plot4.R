### Exploratory Data Analysis -- Week 1 Assignment
# Xinyi Zhao, November 2016

### Plot 4

setwd("C:/Users/Hitomi/Documents/GitHub/ExData_Plotting1")
dat <- read.table("C:/Users/Hitomi/Dropbox/coursera_week1_data/household_power_consumption.txt", 
                  header=TRUE, sep=";", stringsAsFactors=FALSE)

dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007")) # subset the data
dat$sub_metering_1 <- as.numeric(dat$Sub_metering_1) # correct the class
dat$sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$global_active_power <- as.numeric(dat$Global_active_power)
dat$voltage <- as.numeric(dat$Voltage)
dat$global_reactive_power <- as.numeric(dat$Global_reactive_power)
dat$datetime <- strptime(paste(dat$Date, dat$Time), format("%d/%m/%Y%H:%M:%S")) # add the date-time variable

# draw the plot 4
png("Plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

# figure 4-1
with(dat, plot(datetime, global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
# figure 4-2
with(dat, plot(datetime, voltage, type="l", ylab = "Voltage"))
# figure 4-3
with(dat, plot(datetime, sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(dat, points(datetime, sub_metering_1, col="black", type="l"))
with(dat, points(datetime, sub_metering_2, col="red", type="l"))
with(dat, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
# figure 4-4
with(dat, plot(datetime, global_reactive_power, type="l", ylab = "Global_reactive_power"))

dev.off()