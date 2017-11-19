### Exploratory Data Analysis -- Week 1 Assignment
# Xinyi Zhao, November 2016

### Plot 1

setwd("C:/Users/Hitomi/Documents/GitHub/ExData_Plotting1")
dat <- read.table("C:/Users/Hitomi/Dropbox/coursera_week1_data/household_power_consumption.txt", 
                   header=TRUE, sep=";", stringsAsFactors=FALSE)

dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007")) # subset the data
dat$global_active_power <- as.numeric(dat$Global_active_power) # correct the class

# draw the plot 1
png("Plot1.png", width=480, height=480)
hist(dat$global_active_power, col="red", main="Global Active Power", 
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")
dev.off()























