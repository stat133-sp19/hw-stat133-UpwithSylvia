###################################################################################################
#title: Make Shots Data Script
#description: aggregate player data
#input: stephen-curry.csv, klay-thompson.csv, kevin-durant.csv, draymond-green.csv, andre-iguodala.csv
#output: aggregated csv data file of player data 
###################################################################################################

data_types = c("team_name"="character", "game_date"="character", "season" = "integer", "period"="integer",
               "minutes_remaining"="integer", "seconds_remaining"="integer", "shot_made_flag"="character",
               "action_type"="factor", "shot_type"="factor", "shot_distance"="integer", "opponent"="character",
               "x"="integer", "y"="integer")

curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE, colClasses = data_types)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE, colClasses = data_types)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE, colClasses = data_types)
iguodala <- read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE, colClasses = data_types)

curry$name <- "Stephen Curry"
thompson$name <- "Klay Thompson"
durant$name <- "Kevin Durant"
green$name <- "Draymond Green"
iguodala$name <- "Andre Iguodala"

iguodala$shot_made_flag[iguodala$shot_made_flag == "n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag == "y"] <- "shot_yes"

green$shot_made_flag[green$shot_made_flag == "n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag == "y"] <- "shot_yes"

durant$shot_made_flag[durant$shot_made_flag == "n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag == "y"] <- "shot_yes"

thompson$shot_made_flag[thompson$shot_made_flag == "n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag == "y"] <- "shot_yes"

curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"


iguodala$minute = iguodala$period * 12 - iguodala$minutes_remaining
green$minute = green$period * 12 - green$minutes_remaining
durant$minute = durant$period * 12 - durant$minutes_remaining
thompson$minute = thompson$period * 12 - thompson$minutes_remaining
curry$minute = curry$period * 12 - curry$minutes_remaining

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()

aggregated <- rbind(curry,thompson,durant,green,iguodala)

write.csv(aggregated, file = "../data/shots-data.csv")

sink(file = "../output/shots_data_summary.txt")
summary(aggregated)
sink()