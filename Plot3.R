### Exploratory Data Analysis -- Week 1 Assignment
# Xinyi Zhao, November 2016

### Plot 3

setwd("C:/Users/Hitomi/Documents/GitHub/ExData_Plotting1")
dat <- read.table("C:/Users/Hitomi/Dropbox/coursera_week1_data/household_power_consumption.txt", 
                  header=TRUE, sep=";", stringsAsFactors=FALSE)

dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007")) # subset the data
dat$sub_metering_1 <- as.numeric(dat$Sub_metering_1) # correct the class
dat$sub_metering_2 <- as.numeric(dat$Sub_metering_2)
dat$datetime <- strptime(paste(dat$Date, dat$Time), format("%d/%m/%Y%H:%M:%S")) # add the date-time variable

# draw the plot 3
png("Plot3.png", width=480, height=480)
with(dat, plot(datetime, sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(dat, points(datetime, sub_metering_1, col="black", type="l"))
with(dat, points(datetime, sub_metering_2, col="red", type="l"))
with(dat, points(datetime, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
dev.off()


