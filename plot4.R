## Plot 4

## Read data
file="./exdata_data_household_power_consumption/household_power_consumption.txt"
data<-read.table(file, sep=";", nrows=2880, skip=66637, na.strings="?", 
                 stringsAsFactors=FALSE)

## Reduce the characters of titles
par(cex=0.8, cex.axis=0.8, cex.lab=0.8, family="sans",
mfrow = c(2, 2), mar = c(4, 4, 4, 2), oma = c(1, 1, 0, 0),
bg="transparent")

## Convert the Date and Time variables to Date/Time classes
data$V2<-strptime(paste(data$V1,data$V2), format="%d/%m/%Y %H:%M:%S")

## Ghange language settings
my_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

## Draw the plots
plot(data$V2, data$V3, type="l", ylab="Global Active Power", xlab="")

plot(data$V2, data$V5, type="l", ylab="Voltage", xlab="datetime")

plot(data$V2, data$V7, type="l",  
     ylab="Energy sub metering", xlab="")
lines(data$V2, data$V8, col="red")
lines(data$V2, data$V9, col="blue")
legend("topright",lty=1, cex=0.7, y.intersp=0.5, inset=-.05, text.width=75000,
       col = c("black","blue", "red"), bty="n", adj=0.1, seg.len=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$V2, data$V4, type="l", ylab="Global_Reactive_Power", xlab="datetime")

## Copy to .png file
dev.copy(png, file = "plot4.png")
dev.off()

## Restore language settings
Sys.setlocale("LC_TIME", my_lang)
