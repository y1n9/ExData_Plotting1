filename <- "household_power_consumption.txt"

# read data  
if(is.null(df)) {}
    df <- read.table(filename,
                 header=TRUE,
                 sep=";",
                 colClasses=c("character", "character", rep("numeric",7)),
                 na="?")
    # convert date and time variables to Date/Time class
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")
    # only use data from the dates 2007-02-01 and 2007-02-02
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)
}

# plot 1
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", axes=FALSE)
axis(side=1, at=seq(0, 8, by=2))
axis(side=2, at=seq(0,1400,200))
dev.off()