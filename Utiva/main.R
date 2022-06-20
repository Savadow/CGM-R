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
terr_col <- ifelse(df$COUNTRIES == "Nigeria" | df$COUNTRIES == "Ghana", 
                  "Anglophone", "Francophone")

# Appending the column to the data frame
df <- df %>% mutate(TERRITORIES = terr_col, .after = COUNTRIES)
View(df)


# Creating individual territorial data frames
anglo_terr <- df$TERRITORIES == "Anglophone"
franco_terr <- df$TERRITORIES == "Francophone"

anglo <- df[anglo_terr, ]
franco <- df[franco_terr, ]
View(anglo)
View(franco)

quat_col <- case_when(
  df$MONTHS %in% c("January", "February", "March") ~ "Q1", 
  df$MONTHS %in% c("April", "May", "June") ~ "Q2",
  df$MONTHS %in% c("July", "August", "September") ~ "Q3",
  df$MONTHS %in% c("October", "November", "December") ~ "Q4",
)

df <- df %>% mutate(QUARTER = quat_col, .after = MONTHS)
View(df)
                        #############################
                        #### Function Definition ####
                        #############################

make.new.df <- function(dataframe = df, column1, column2 = NULL, val1, 
                        val2 = NULL, operation = "or"){
  
  if (is.null(column2) == TRUE){
    
    if (is.null(val2) == FALSE){
      
      if (operation == "or"){
        condition <- dataframe[column1] == val1 | dataframe[column1] == val2
        
      } else if (operation == "and"){
        condition <- dataframe[column1] == val1 & dataframe[column1] == val2
        
      } else if (operation == "not"){
        condition <- dataframe[column1] != val1 & dataframe[column1] != val2
        
      } else {
        return ("Operation not allowed")
      }
      
    } else {
      condition <- dataframe[column1] == val1
    }
    
  } else {
    
    if (operation == "or"){
      condition <- dataframe[column1] == val1 | dataframe[column2] == val2
      
    } else if (operation == "and"){
      condition <- dataframe[column1] == val1 & dataframe[column2] == val2
      
    } else if (operation == "not"){
      condition <- dataframe[column1] != val1 & dataframe[column2] != val2
      
    } else {
      return ("Operation not allowed")
    }
    
  }
  
  new_df <- dataframe[condition, ]
  return (new_df)
}

grouping <- function(dataframe, groupby_column, aggregate_column, value){
  value_aggregate <- c()
  
  for (val in value){
    term <- dataframe[groupby_column] == val
    val_df <- dataframe[term, ]
    
    value_aggregate <- c(value_aggregate, sum(val_df[aggregate_column]))
  }
  
  grouped_df <- tibble(
    GROUP = value,
    AGGREGATE = value_aggregate
  )
}

                        ###################
                        #### Section A ####
                        ###################
                            #### 1 ####
                            ###########

total <- 0
for (profit in df$PROFIT){
  total <- total + profit
}
print(total)

                            #### 2 ####
                            ###########

anglo_prof <- 0
franco_prof <- 0

for (profit in anglo$PROFIT){
  anglo_prof <- anglo_prof + profit
}

for (profit in franco$PROFIT){
  franco_prof <- franco_prof + profit
}

comparison <- tibble(
  
  anglo = anglo_prof, 
  franco = franco_prof
  
)

print(comparison)

                            #### 3 ####
                            ###########

# Creating a new data frame and grouping by the countries based on total profit
c2019 <- make.new.df(column1 = "YEARS", val1 = 2019)
c2019_countries <- unique(c2019$COUNTRIES)

country_profit <- c()
for (country in c2019_countries){
  # Creating a data frame to hold values for each unique country
  cdf <- make.new.df(c2019, "COUNTRIES", val1 = country)
  
  # Summing profit for each unique country
  country_profit <- c(country_profit, sum(cdf$PROFIT))
}

c2019 <- tibble(
  COUNTRY = c2019_countries,
  PROFIT = country_profit
)

# Ordering in descending order
c2019[order(-c2019$PROFIT), ] %>% top_n(1)

                            #### 4 ####
                            ###########

# Grouping by the years based on total profit
years <- unique(df$YEARS)
year_gb <- grouping(df, "YEARS", "PROFIT", years)
year_gb[order(-year_gb$AGGREGATE), ] %>% top_n(1)

                            #### 5 ####
                            ###########

# Grouping by the months based on total profit
months <- unique(df$MONTHS)
month_gb <- grouping(df, "MONTHS", "PROFIT", months)
month_gb[order(month_gb$AGGREGATE), ] %>% top_n(1)

                          #### 6 ####
                          ###########

# Creating a new data frame based on 2018 and December
d2018 <- make.new.df(column1 = "YEARS", column2 = "MONTHS", val1 = 2018, 
                     val2 = "December", operation = "and")

min_val <- d2018$PROFIT[1]
for (profit in d2018$PROFIT){
  if (profit < min_val){
    min_val <- profit
  }
}

print(min_val)

                          #### 7 ####
                          ###########

# Creating a new data frame based on 2019 and grouping months
m2019 <- make.new.df(column1 = "YEARS", val1 = 2019)
months <- unique(m2019$MONTHS)
month_profit <- c()

for (month in months){
  val <- m2019$MONTHS == month
  mdf <- m2019[val, ]
  
  month_profit <- c(month_profit, sum(mdf$PROFIT))
}


total_sum <- sum(month_profit)
new_col <- (month_profit / total_sum) * 100

temp <- tibble(
  MONTH = months,
  perc_profit = new_col
)
print(temp)

                          #### 8 ####
                          ###########

cSen <- make.new.df(column1 = "COUNTRIES", val1 = "Senegal")

max_val <- cSen$PROFIT[1]
for (profit in cSen$PROFIT){
  if (profit > max_val){
    max_val <- profit
  }
}

max_df <- cSen[cSen$PROFIT == max_val, ]
max_df["BRANDS"]

                      ###################
                      #### Section B ####
                      ###################
                          #### 1 ####
                          ###########

franco_last_two <- make.new.df(dataframe = franco, column1 = "YEARS", 
                               val1 = 2017, val2 = 2018)
brands <- unique(franco_last_two$BRANDS)

brands_quantity <- grouping(franco_last_two, "BRANDS", "QUANTITY", brands)
brands_quantity[order(-brands_quantity$AGGREGATE), ] %>% top_n(3)

                          #### 2 ####
                          ###########

ghana_df <- make.new.df(column1 = "COUNTRIES", val1 = "Ghana")
brands <- unique(ghana_df$BRANDS)

gb_quantity <- grouping(ghana_df, "BRANDS", "QUANTITY", brands)
gb_quantity[order(-gb_quantity$AGGREGATE), ] %>% top_n(2)

                          #### 3 ####
                          ###########

nigeria_df <- make.new.df(column1 = "COUNTRIES", val1 = "Nigeria")
nigeria_beer_df <- make.new.df(dataframe = nigeria_df, column1 = "BRANDS", 
                               val1 = "grand malt", val2 = "beta malt", 
                               operation = "not")
View(nigeria_beer_df)

                          #### 4 ####
                          ###########

fav_malt <- make.new.df(dataframe = anglo, column1 = "BRANDS", 
                        val1 = "grand malt", val2 = "beta malt")
fav_malt <- make.new.df(dataframe = fav_malt, column1 = "YEARS", 
                        val1 =  2018, val2 = 2019)

malt <- unique(fav_malt$BRANDS)
malt_quantity <- grouping(fav_malt, "BRANDS", "QUANTITY", malt)
malt_quantity[order(-malt_quantity$AGGREGATE), ] %>% top_n(1)

                          #### 5 ####
                          ###########

nig_2019 <- make.new.df(column1 = "YEARS", val1 = 2019, column2 = "COUNTRIES", 
                        val2 = "Nigeria", operation = "and")
brand <- unique(nig_2019$BRANDS)

highest_brand <- grouping(nig_2019, "BRANDS", "COST", brand)
highest_brand[order(-highest_brand$AGGREGATE), ] %>% top_n(1)

                          #### 6 ####
                          ###########

nig_ss <- make.new.df(column1 = "REGION", val1 = "southsouth", 
                      column2 = "COUNTRIES", val2 = "Nigeria", operation = "and")
brand <- unique(nig_ss$BRANDS)

popular_brand <- grouping(nig_ss, "BRANDS", "QUANTITY", brand)
popular_brand[order(-popular_brand$AGGREGATE), ] %>% top_n(1)

                          #### 7 ####
                          ###########

# Because I've created the data frame befoore
beer <- unique(nigeria_beer_df$BRANDS)
beer_df <- grouping(nigeria_beer_df, "BRANDS", "QUANTITY", beer)
beer_df

                          #### 8 ####
                          ###########

nig_bud <- make.new.df(nigeria_beer_df, "BRANDS", val1 = "budweiser")
region <- unique(nig_bud$REGION)
bud_df <- grouping(nig_bud, "REGION", "QUANTITY", region)
bud_df

                          #### 9 ####
                          ###########

nig_bud <- make.new.df(nig_bud, "YEARS", val1 = 2019)
region <- unique(nig_bud$REGION)
bud_df <- grouping(nig_bud, "REGION", "QUANTITY", region)
bud_df

                    ###################
                    #### Section C ####
                    ###################
                        #### 1 ####
                        ###########

country_beer <- make.new.df(column1 = "BRANDS", val1 = "grand malt", 
                            val2 = "beta malt", operation = "not")
country <- unique(country_beer$COUNTRIES)

country_df <- grouping(country_beer, "COUNTRIES", "QUANTITY", country)
country_df

                        #### 2 ####
                        ###########

bud_sen <- make.new.df(column1 = "BRANDS", val1 = "budweiser", 
                       column2 = "COUNTRIES", val2 = "Senegal", 
                       operation = "and")
sales <- unique(bud_sen$SALES_REP)

sales_df <- grouping(bud_sen, "SALES_REP", "PROFIT", sales)
sales_df[order(-sales_df$AGGREGATE), ] %>% top_n(1)

                        #### 3 ####
                        ###########

country_prof <- make.new.df(column1 = "YEARS", val1 = 2019, 
                            column2 = "QUARTER", val2 = "Q4", 
                            operation = "and")
country <- unique(country_prof$COUNTRIES)

prof_df <- grouping(country_prof, "COUNTRIES", "PROFIT", country)
prof_df[order(-prof_df$AGGREGATE), ] %>% top_n(1)
