#1. Read the dataset.
#2. Read dataset description. -- See 'Flight Delays Dataset Description' text file.

df = read.csv(file.choose())

View(df)


#3. Understand the data.
str(df)


#4. Find out the null values.
colSums(is.na(df))


#5. Install packages.
library(dplyr)
library(ggplot2)


#6. Understand the summary of descriptive statistics.
summary(df)


#7. Plot the histograms to understand the relationships between scheduled time, carrier, destination, origin, weather, and day of the week.
ggplot(df, aes(x = schedtime)) + geom_histogram(binwidth = 10) + ggtitle("Scheduled Time Distribution")
ggplot(df, aes(x = carrier)) + geom_bar() + ggtitle("Carrier Distribution")
ggplot(df, aes(x = dest)) + geom_bar() + ggtitle("Destination Distribution")
ggplot(df, aes(x = origin)) + geom_bar() + ggtitle("Origin Distribution")
ggplot(df, aes(x = weather)) + geom_bar() + ggtitle("Weather Impact on Delays")
ggplot(df, aes(x = dayweek)) + geom_bar() + ggtitle("Flights by Day of the Week")


#8. Plot the scatter plot for flights on time and delayed.
ggplot(df, aes(x = schedtime, y = delay, color = delay > 0)) +
  geom_point() + ggtitle("On-Time vs Delayed Flights")


#9.	Plot the box plot to understand how many days in a month flights are delayed by what time.
ggplot(df, aes(x = factor(dayweek), y = delay)) + 
  geom_boxplot() + ggtitle("Delays by Days of the Month")


#10. Define the hours of departure.
df$deptime = floor(df$schedtime / 100)

#11. Create a categorical representation using a table.
table(df$carrier, df$delay)

#12. Redefine the delay variables.
df$delay = ifelse(df$delay == "delayed", 1, 0)

#13. Understand the summary of major variables.
summary(select(df, schedtime, delay, deptime))

#14. Plot histograms of major variables.
ggplot(df, aes(x = factor(delay))) + 
  geom_bar() + ggtitle("Flight Delay Frequency") +
  xlab("Delay Status (0 = On Time, 1 = Delayed)")

#15. Plot a pie chart to see how many flights were delayed.
df = table(df$delay)
pie(df, labels = c("On Time", "Delayed"), main = "Proportion of Delayed Flights")


