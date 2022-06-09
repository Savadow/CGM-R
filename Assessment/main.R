                                  #################
                                  #### Ex. 4.5 ####
                                  #################
                                        # 1 #
                                        #####

sample(3:6, 50, replace = TRUE)

                                        # 2 #
                                        #####
                          
x <- sample(1:50, 1)
y <- sample(2:5, 1)
x ** y

                                        # 3 #
                                        #####

step <- sample(1:10, 1)
for (i in 1:step){
  print("Chinedum")
}

                                        # 4 #
                                        #####

observation <- runif(1, 1, 10)
round(observation, 2)

                                        # 5 #
                                        #####

for (i in 1:50){
  print(sample(1:i+1, 1))
}

                                        # 6 #
                                        #####

x <- as.numeric(readline("Enter a number: "))
y <- as.numeric(readline("Enter a number: "))

num <- x - y
if (num < 0){
  num <- num * -1
}

denom <- x + y
ans <- num / denom
print(ans)

                                        # 7 #
                                        #####









                                        # 8 #
                                        #####

time <- as.integer(readline("Enter a time in seconds: "))

minutes <- floor(time / 60)
seconds <- time %% 60
print(paste(time, "seconds is", minutes, "minutes", seconds, "seconds"))

                                        # 9 #
                                        #####

time <- as.integer(readline("Enter a time in hours: "))
future <- as.integer(readline("How many hours into the future do you wanna go?: "))

new_time <- time + future
if (new_time > 12){
  new_time <- new_time %% 12
}

print(paste(new_time, "o'clock"))

                                        # 10 #
                                        ######
# a #
#####

power <- as.numeric(readline("Enter a power: "))
eval <- 2 ** power
print(eval %% 10)

# b #
#####

power <- as.numeric(readline("Enter a power: "))
eval <- 2 ** power
print(eval %% 100)

# c #
#####

power <- as.numeric(readline("Enter a power: "))
digits <- as.integer(readline("Enter how many digits you want: "))

eval <- 2 ** power
reaminder <- 10 ** digits
print(eval %% remainder)

                                    # 11 #
                                    ######

weight <- as.numeric(readline("Enter a weight in kg: "))
pounds = weight * 2.205
print(paste, (round(pounds, 1)), pounds )

                                    # 12 #
                                    ######

number <- as.integer(readline("Enter a number: "))
fact <- 1

for (i in 1:number){
  fact <- fact * i
}

print(fact)

                                    # 13 #
                                    ######

number <- as.numeric(readline("Enter a number: "))

sine <- sin(number)
cosine <- cos(number)
tangent <- tan(number)

values <- c(sine, cosine, tangent)
func <- c("Sine", "Cosine", "Tangent")
names(values) <- func

print(values)

                                    # 14 #
                                    ######

number <- as.numeric(readline("Enter a number: "))
print(sin(number))


                            #################
                            #### Ex. 4.5 ####
                            #################
                                   # 1 #
                                   #####

# taking input from user
length <- as.numeric(readline("Enter length in cm: "))

if (length < 0){
    print("Entry is invalid")
} else{
    # converting to inches
    inch <- length * 2.54
    print(paste(length, "cm is", inch, "inches long.", sep = " "))
}

                                   # 2 #
                                   #####

# taking input from user
temp <- as.numeric(readline("Enter temperature: "))
unit <- tolower(readline("Enter unit of temperature (C/F): "))

if (unit == "f"){
    # converting to celsius
    C <- (5 / 9) * (temp - 32)
    print(paste("The temperature in Celsius is", C, "degrees"))
} else if (unit == "c"){
    # converting to fahrenheit
    F <- ((9 / 5) * temp) + 32
    print(paste("The temperature in Fahrenheit is", F, "degrees"))
}

                                   # 3 #
                                   #####

temperature <- as.numeric(readline("Enter temperature in Celsius: "))

if (temperature > 100){
    print("Temperature above boiling point")
} else if (temperature == 100){
    print("Temperature at boiling point")
} else if (temperature > 0 & temperature < 100){
    print("Temperature at normal range")
} else if (temperature == 0){
    print("Temperature at freezing point")
} else if (temperature > -273.15 & temperature < 0){
    print("Temperature is below freezing")
} else if (temperature == -273.15){
    print("Temperature is absolute zero")
} else{
    print("Temperature invalid, below freezing point")
}

                                   # 4 #
                                   #####

credits <- as.integer(readline("How many credits have you taken? "))

if (credits >= 84){
    print("You are a senior")
} else if (credits >= 54 & credits <= 83){
    print("You are a junior")
} else if (credits >= 24 & credits <= 53){
    print("You are a sophomore")
} else{
    print("You are a fresher")
}


                                    # 5 #
                                    #####

number <- as.integer(readline("Enter a number: "))
sum_div <- 0

# calculating the sum of divisors of a number
for (i in 1:number){
    if (number %% i == 0){
        sum_div <- sum_div + i
    }
}
print(sum_div)

                                 # 6 #
                                 #####

# finding all perfect numbers from 1 to 10,000
for (number in 1:10000){
    div <- c()
    for (divisor in 1:number){
        if (number %% divisor == 0){
            div <- c(div, divisor)
        }
    }
    
    total <- 0
    for (i in div){
        total <- total + i
    }
    
    if ((total - number) == number){
        print(number)
    }
} 

                                   # 7 #
                                   #####

number <- as.integer(readline("Enter number: "))
div <- c()
nsqn <- c(1)

# finding if a number is squarefree
for (i in 1:number){
    if (number %% i == 0){
        div <- c(div, i)
    }
}

for (n in div){
    check = floor(n ** (1 / 2))
    if ((check ** 2) != n){
        nsqn <- c(nsqn, n)
    }
}

if (length(div) == length(nsqn)){
    print("Squarefree")
} else{
    print("Not squarefree")
}

                                   # 8 #
                                   #####

x <- as.numeric(readline("Enter a number: "))
y <- as.numeric(readline("Enter a number: "))
z <- as.numeric(readline("Enter a number: "))

# swapping numbers
container <- x

x <- y
y <- z
z <- container

print(x)
print(y)
print(z)

                                   # 9 #
                                   #####


perfect_square <- 0
perfect_cube <- 0
perfect_fifth <- 0

for (i in 1:1000){
  square <- floor(i ** (1/2))
  cube <- floor(i ** (1/3))
  fifth <- floor(i ** (1/5))
  
  if ((square ** 2) != i){
    perfect_square <- perfect_square + 1
  }
  
  if ((cube ** 3) != i){
    perfect_cube <- perfect_cube + 1
  }
  
  if ((fifth ** 5) != i){
    perfect_fifth <- perfect_fifth + 1
  }
}

print(c(perfect_square, perfect_cube,perfect_fifth))


                                    # 10 #
                                    ######

scores <- c()
for (i in 1:10){
  unit <- as.numeric(readline("Enter score: "))
  scores <- c(scores, unit)
}

# a #
#####

# Getting the max and min scores
maximum <- scores[1]
minimum <- scores[1]

for (score in scores){
  if (score > maximum){
    maximum <- score
    
  } else if (score < minimum) {
    minimum <- score
  }
}

print(c("Maximum" = maximum, "Minimum" = minimum))

# b #
#####

len <- length(scores)

total <- 0
for (score in scores){
  total <- total + score
}

avg <- total / len
avg

# c #
#####

# Removing the maximum number from the vector
new_score <- scores[!scores %in% maximum]
new_max <- new_score[1]

for (score in new_score){
  if (score > new_max){
    new_max <- score
  }
}

new_max

# d #
#####

for (score in scores){
  if (score > 100){
    print("Value greater than 100 detected")
  }
}

# e #
#####

new_score <- scores[!scores %in% minimum]
new_min <- new_score[1]

for (score in new_score){
  if (score < new_min){
    new_min <- score
  }
}

final_score <- new_score[!new_score %in% new_min]
len <- length(final_score)

total <- 0
for (score in final_score){
  total <- total + score
}

avg <- total / len
avg