## Plot 2

## Read data
file="./exdata_data_household_power_consumption/household_power_consumption.txt"
data<-read.table(file, sep=";", nrows=2880, skip=66637, na.strings="?", 
                 stringsAsFactors=FALSE)

## Convert the Date and Time variables to Date/Time classes
data$V2<-strptime(paste(data$V1,data$V2), 
                  format="%d/%m/%Y %H:%M:%S")

## Ghange language settings
my_lang <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English")

## Setting
par(bg="transparent")

## Draw the plot
plot(data$V2, data$V3, type="l",  
     ylab="Global Active Power (kilowatts)", xlab="")

## Copy to .png file
dev.copy(png, file = "plot2.png")
dev.off()

## Restore language settings
Sys.setlocale("LC_TIME", my_lang)
