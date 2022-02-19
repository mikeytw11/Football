install.packages("tidyverse", type = "binary")
install.packages("ggrepel", type = "binary")
install.packages("ggimage", type = "binary")
install.packages("nflfastR", type = "binary")

library(tidyverse)
library(ggrepel)
library(ggimage)
library(nflfastR)
options(scipen = 9999)

data <- load_pbp(2019)

dim(data)
str(data[1:10])
names(data)
View(data)
data %>%
  select(home_team, away_team, posteam, desc) %>%
  head()

data%>%
  select(posteam, defteam, desc, rush, pass) %>%
  head()

data %>%
  filter(rush == 1 | pass == 1) %>%
  select(posteam, desc, rush, pass, name, passer, rusher, receiver) %>%
  head()

data %>%
  filter(special == 1) %>%
  select(down, ydstogo, desc)%>%
  head()

data %>%
  filter(down == 4) %>%
  select(down, ydstogo, desc) %>%
  head()

data %>%
  filter(down == 4 & special == 0)%>%
  select(down, ydstogo, desc) %>%
  head()

pbp_rp <- data %>%
  filter( rush == 1 | pass ==1, !is.na(epa))

