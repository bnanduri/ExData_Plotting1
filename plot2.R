# Plot of Global Active Power vs day
data <- read.csv("household_power_consumption.txt",
                 sep=";",
                 colClasses=c(rep("character",2),rep("numeric",7)),
                 na.strings="?")

# Create timestamp
data$Timestamp <- strptime(paste(data$Date,data$Time),
                           format="%d/%m/%Y %H:%M:%S")

# Nullify date and time cols
data$Date=NULL
data$Time=NULL

# Filter on dates
sub_data = subset(data,as.Date(data$Timestamp) >= "2007-02-01" 
                  & as.Date(data$Timestamp) < "2007-02-03")

# png
png(filename="plot2.png", height=480, width=480, bg="transparent")

# Plot the line
plot(sub_data$Timestamp,
     sub_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

# Save the figure
dev.off()