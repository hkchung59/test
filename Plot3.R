## Working directory setting and dataset reading
setwd("D:\\Exploratory Data Analysis\\Data")
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

## Subsetting the data
dataforgraph <- subset(data_set, subset=c(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates and times
datetime <- paste(as.Date(dataforgraph$Date), dataforgraph$Time)
dataforgraph$Datetime <- as.POSIXct(datetime)

## Line graph with legend
with(dataforgraph, {
        plot(Sub_metering_1~Datetime, type="l",
             xlab="",ylab="Global Active Power (kilowatts)", col="Black")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving graph to a png file: plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

