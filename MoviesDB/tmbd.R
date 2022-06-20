# install.packages(c("readr", "stringr", "janitor", "dplyr"))
library(readr)
library(dplyr)
library(janitor)
library(stringr)
# install.packages("tidyr")
library(tidyr)

# Reading in the data frame
path <- "CGM-R/MoviesDB/tmdb-movies.csv"
df <- read_csv(path)
View(df)

str(df)

# Checking for NA values
sum(is.na(df))
for (i in colnames(df)){
    print(paste(i, sum(is.na(df[i]))))
}

# Since imdb_id is a unique field, it will be wise to drop rows based on NA
data <- subset(df, !is.na(imdb_id))
View(data)

# Successfully droppedthe 
for (i in colnames(data)){
  print(paste(i, sum(is.na(data[i]))))
}

# Splitting the cast column
data$cast[20]  # Size of the individual vectors

data[c("Cast1", "Cast2", "Cast3", "Cast4", "Cast5")] <- 
  str_split(data$cast, "\\|", n = 5, simplify = T)
data <- data %>% relocate(c("Cast1", "Cast2", "Cast3", "Cast4", "Cast5"), 
                          .after = original_title)
View(data)

# Removing the cast column
data <- data %>% select(-cast)
View(data)
colnames(data)
for (i in colnames(data)){
  count <- 0
  v <- 0
  for (j in data[i]){
    print(paste(i, "=", sum(j == "")))
  }
}
