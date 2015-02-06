## Plot 3

## Read data
file="./exdata_data_household_power_consumption/household_power_consumption.txt"
data<-read.table(file, sep=";", nrows=2880, skip=66637, na.strings="?", 
                 stringsAsFactors=FALSE)

## Setting
par(cex=0.8, bg="transparent")

## Convert the Date and Time variables to Date/Time classes
data$V2<-strptime(paste(data$V1,data$V2), 
                  format="%d/%m/%Y %H:%M:%S")

## Ghange language settings
my_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

## Draw the plots
plot(data$V2, data$V7, type="l",  
     ylab="Energy sub metering", xlab="")
lines(data$V2, data$V8, col="red")
lines(data$V2, data$V9, col="blue")
legend("topright", lty=1, cex=0.9, inset=-.005, y.intersp=0.7, text.width=42000,
       col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy to .png file
dev.copy(png, file = "plot3.png")
dev.off()

## Restore language settings
Sys.setlocale("LC_TIME", my_lang)
