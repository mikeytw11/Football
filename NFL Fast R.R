library(tidyverse)
standings <- read_csv("http://nflgamedata.com/standings.csv")
standings %>% head()
standings %>% filter(playoff == "WonSB") %>% group_by(seed) %>% summarize(count=n())

library(ggplot2)
#ggplot makes a plot, and standings is the data used to make it
#aes tells R to allow us to reference columns within standings here 
#x=scored, y=allowed indicated which columns are shown on the horizontal(x) and vertical(y) axes
ggplot(standings,aes(x=scored,y=allowed)) +
  # this sets up a bunch of great visual defaults in terms of how the plot appears 
  theme_minimal() +
  # this means each row in standings gets represented by a point or a dot (at its x,y values above)
  # each playoff value will be assigned a color (with legend to the right)
  # each row's point will be colored based on the playoff value of that point 
  geom_point(aes(color=playoff)) +
  # this label is what gets written at the bottom to explain what the x-axis represents
  xlab("Points Scored") +
  # this label is what gets written at the left to explain what the y-axis represents
  ylab("Points Allowed") +
  # this label is what gets written prominently at the top to explain the purpose of the overall plot
  labs(title="Points Scored vs. Points Allowed")

games <- read_csv("http://www.habitatring.com/games.csv")
games %>% select(season,week,location,away_team,away_score,home_team,home_score,result) %>% head()
home_games <- games %>% filter(location == "Home")
summary(home_games$result)

ggplot(home_games,aes(x=result)) +
  theme_minimal()+
  geom_histogram(binwidth=1) +
  xlab("Home Team Net Points") +
  ylab("Share of Games") +
  labs(title="Distribution of Home Team Net Points")