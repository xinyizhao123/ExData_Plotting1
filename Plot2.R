### Exploratory Data Analysis -- Week 1 Assignment
# Xinyi Zhao, November 2016

### Plot 2

setwd("C:/Users/Hitomi/Documents/GitHub/ExData_Plotting1")
dat <- read.table("C:/Users/Hitomi/Dropbox/coursera_week1_data/household_power_consumption.txt", 
                  header=TRUE, sep=";", stringsAsFactors=FALSE)

dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007")) # subset the data
dat$global_active_power <- as.numeric(dat$Global_active_power) # correct the class
dat$datetime <- strptime(paste(dat$Date, dat$Time), format("%d/%m/%Y%H:%M:%S")) # add the date-time variable

# draw the plot 2
png("Plot2.png", width=480, height=480)
with(dat, plot(datetime, global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()