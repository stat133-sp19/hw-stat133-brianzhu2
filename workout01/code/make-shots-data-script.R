# Make Shots Data
# This script makes shots-data.csv and writes some summary text files about the shot data
# Input: reads csv files on shot data by a few GSW players
# Output: creates a shots-data.csv file based on the combined data from each player
library("dplyr")
setwd("C:/Users/Brian/Documents/College/Fourth Year/Stat 133/workout01/code")
col_types <- c("factor", "character", "integer", "integer", "integer", "integer", "factor", "factor", "factor", "integer", "factor", "integer", "integer")
iguodala <- read.csv("../data/andre-iguodala.csv", colClasses = col_types)
iguodala$name <- factor(c("Andre Iguodala"))
iguodala$shot_made_flag <- recode_factor(iguodala$shot_made_flag, n = "shot_no", y = "shot_yes")
iguodala$minute <- iguodala$period * 12L - iguodala$minutes_remaining
sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

green <- read.csv("../data/draymond-green.csv", colClasses = col_types)
green$name <- factor(c("Draymond Green"))
green$shot_made_flag <- recode_factor(green$shot_made_flag, n = "shot_no", y = "shot_yes")
green$minute <- green$period * 12L - green$minutes_remaining
sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

durant <- read.csv("../data/kevin-durant.csv", colClasses = col_types)
durant$name <- factor(c("Kevin Durant"))
durant$shot_made_flag <- recode_factor(durant$shot_made_flag, n = "shot_no", y = "shot_yes")
durant$minute <- durant$period * 12L - durant$minutes_remaining
sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

thompson <- read.csv("../data/klay-thompson.csv", colClasses = col_types)
thompson$name <- factor(c("Klay Thompson"))
thompson$shot_made_flag <- recode_factor(thompson$shot_made_flag, n = "shot_no", y = "shot_yes")
thompson$minute <- thompson$period * 12L - thompson$minutes_remaining
sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

curry <- read.csv("../data/stephen-curry.csv", colClasses = col_types)
curry$name <- factor(c("Stephen Curry"))
curry$shot_made_flag <- recode_factor(curry$shot_made_flag, n = "shot_no", y = "shot_yes")
curry$minute <- curry$period * 12L - curry$minutes_remaining
sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

shots_data <- rbind(iguodala, green, durant, thompson, curry)
write.csv(x = shots_data, file = "../data/shots-data.csv", row.names = FALSE)
sink(file = "../output/shots-data-summary.txt")
summary(shots_data)
sink()