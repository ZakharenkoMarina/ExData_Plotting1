## Plot 1

## Read data
file="./exdata_data_household_power_consumption/household_power_consumption.txt"
data<-read.table(file, sep=";", nrows=2880, skip=66637, na.strings="?", 
                 stringsAsFactors=FALSE)

## Reduce the characters of titles
par(cex=0.8, bg="transparent")

## Draw the histogram
hist(data$V3, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## Copy to .png file
dev.copy(png, file = "plot1.png")
dev.off()
