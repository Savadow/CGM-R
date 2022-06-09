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
                      
path <- "C:/Users/Trainee/Desktop/Savadow/R/Utiva/Brewery_data.csv"
df <- read_csv(path)
View(df)


new_col <- c()
for (country in df$COUNTRIES){
  
  if (country == "Nigeria" | country == "Ghana"){
    new_col <- c(new_col, "Anglophone")
    
  } else {
    new_col <- c(new_col, "Francophone")
  }
  
}

data <- df %>% mutate(TERRITORIES = new_col, .after = COUNTRIES)
View(data)


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

c2019 <- data[data$YEARS == 2019, ]
idx <- which.max(c2019$PROFIT)
c2019$COUNTRIES[idx]
