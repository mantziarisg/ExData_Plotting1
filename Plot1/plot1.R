### -------------------- LOAD DATA -------------------------------

#Read text file into data frame
data_initial <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

#Subset the dates needed
data <- subset(data_initial, data_initial$Date=="1/2/2007" | data_initial$Date=="2/2/2007")

#Transform classes into numeric
data[,3:9] <- lapply(data[,3:9], as.numeric)

#Create new column Date_Time
data$Date_time <- NA

#Paste Date and Time values
data$Date_time <- paste(data$Date, data$Time, sep = " ")

#Convert Date and TIme variables
data$Date_time <-strptime(data$Date_time, format = "%d/%m/%Y %H:%M:%S")

### ------------------ CONSTRUCT PLOT ----------------------------------

png(file="plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()















