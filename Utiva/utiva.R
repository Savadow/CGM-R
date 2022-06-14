                      ###################
                      #### Libraries ####
                      ###################

# install.packages("readr")                      
library(readr)
# install.packages("dplyr")
library(dplyr)

                      ###########################
                      #### Data Manipulation ####
                      ###########################

# Reading file                      
path <- "CGM-R/Utiva/Brewery_data.csv"
df <- read_csv(path)
View(df)


# Creating a new column based on lingua franca of the countries
new_col <- ifelse(df$COUNTRIES == "Nigeria" | df$COUNTRIES == "Ghana", 
                  "Anglophone", "Francophone")

# Appending the column to the data frame
data <- df %>% mutate(TERRITORIES = new_col, .after = COUNTRIES)
View(data)


# Creating individual territorial data frames
anglo_terr <- data$TERRITORIES == "Anglophone"
franco_terr <- data$TERRITORIES == "Francophone"

anglo <- data[anglo_terr, ]
franco <- data[franco_terr, ]
View(anglo)
View(franco)

                        ###################
                        #### Section A ####
                        ###################
                            #### 1 ####
                            ###########

sum(df$PROFIT)

                            #### 2 ####
                            ###########

comparison <- data.frame(
  
  anglo = sum(anglo$PROFIT), 
  franco = sum(franco$PROFIT)
  
)

print(comparison)

                            #### 3 ####
                            ###########

# Creating a new data frame and grouping by the countries based on total profit
c2019 <- data[data$YEARS == 2019, ] %>% group_by(COUNTRIES) %>% 
  summarise(sum_profit = sum(PROFIT))

# Ordering in descending order
c2019[order(-c2019$sum_profit), ] %>% slice(1:1)

                            #### 4 ####
                            ###########

# Grouping by the years based on total profit
year_gb <- data %>% group_by(YEARS) %>% summarise(sum_profit = sum(PROFIT))
year_gb[order(-year_gb$sum_profit), ] %>% slice(1:1)

                            #### 5 ####
                            ###########

# Grouping by the months based on total profit
month_gb <- data %>% group_by(MONTHS) %>% summarise(sum_profit = sum(PROFIT))
month_gb[order(month_gb$sum_profit), ] %>% slice(1:1)

                          #### 6 ####
                          ###########

# Creating a new data frame
d2018 <- data[data$YEARS == 2018 & data$MONTHS == "December", ]
min(d2018$PROFIT)

                          #### 6 ####
                          ###########