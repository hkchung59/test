## Working directory setting and dataset reading
setwd("D:\\Exploratory Data Analysis\\Data")
data_set <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?") 
data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

## Subsetting the data
dataforgraph <- subset(data_set, subset=c(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates and times
datetime <- paste(as.Date(dataforgraph$Date), dataforgraph$Time)
dataforgraph$Datetime <- as.POSIXct(datetime)

## Plotting line graph
plot(dataforgraph$Global_active_power~dataforgraph$Datetime, type="l",
     xlab="", ylab="Global Active Power (kilowatts)", col="Black")

## Saving graph to a png file: plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

