#Histogram of Frequency vs Global Active Power

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

# Filter data based on dates
sub_data = subset(data,as.Date(data$Timestamp) >= "2007-02-01" 
                  & as.Date(data$Timestamp) < "2007-02-03")

#png
png(filename="plot1.png", height=480, width=480, bg="transparent")

# Plot the histogram
hist(sub_data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

# Save the figure
dev.off()