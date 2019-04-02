# The file is already in the directory. If you need to download it again, uncomment the lines below
# url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(url, destfile="household_power_consumption.zip", method="curl")

# Read the file:
powerConsumptionWhole <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";", na.strings = "?")
# Subset the dataframe:
powerConsumption <- powerConsumptionWhole[as.character(powerConsumptionWhole$Date) %in% c("1/2/2007", "2/2/2007"),]
# Create the plot:
png(filename="plot2.png",width=480,height=480,bg="transparent",units="px")

x<-paste(powerConsumption$Date,powerConsumption$Time)
with(powerConsumption,plot(strptime(x,"%d/%m/%Y %H:%M:%S"),Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))

dev.off()
