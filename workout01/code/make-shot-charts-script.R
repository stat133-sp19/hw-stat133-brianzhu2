# Make Shot Charts
# This script creates shot charts for various players on the GSW.
# Input: reads shot data from each player
# Output: makes shot charts for each player
library("dplyr")
library("ggplot2")
library("jpeg")
library("grid")
setwd("C:/Users/Brian/Documents/College/Fourth Year/Stat 133/workout01/code")
col_types <- c("factor", "character", "integer", "integer", "integer", "integer", "factor", "factor", "factor", "integer", "factor", "integer", "integer", "factor", "integer")
shots <- read.csv("../data/shots-data.csv", colClasses = col_types)
iguodala <- filter(shots, name == "Andre Iguodala")
green <- filter(shots, name == "Draymond Green")
durant <- filter(shots, name == "Kevin Durant")
thompson <- filter(shots, name == "Klay Thompson")
curry <- filter(shots, name == "Stephen Curry")
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

iguodala_chart <- ggplot(data = iguodala) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Andre Iguodala (2016 season)") +
  theme_minimal()
iguodala_chart + ggsave("../images/andre-iguodala-shot-chart.pdf", width = 6.5, height = 5)

green_chart <- ggplot(data = green) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Draymond Green (2016 season)") +
  theme_minimal()
green_chart + ggsave("../images/draymond-green-shot-chart.pdf", width = 6.5, height = 5)

durant_chart <- ggplot(data = durant) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Kevin Durant (2016 season)") +
  theme_minimal()
durant_chart + ggsave("../images/kevin-durant-shot-chart.pdf", width = 6.5, height = 5)

thompson_chart <- ggplot(data = thompson) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Klay Thompson (2016 season)") +
  theme_minimal()
thompson_chart + ggsave("../images/klay-thompson-shot-chart.pdf", width = 6.5, height = 5)

curry_chart <- ggplot(data = curry) + 
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Chart: Stephen Curry (2016 season)") +
  theme_minimal()
curry_chart + ggsave("../images/steph-curry-shot-chart.pdf", width = 6.5, height = 5)

shot_charts <- ggplot(data = shots) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle("Shot Charts: GSW (2016 season)") +
  theme_minimal() +
  facet_wrap(~ name, ncol = 3)
shot_charts + ggsave("../images/gsw-shot-charts.pdf", width = 10, height = 7)
shot_charts + ggsave("../images/gsw-shot-charts.png", width = 10, height = 7)
