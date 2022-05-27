                            ############
                            #### Ex. 4.5
                            ############
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

# finding all perfect squares from 1 to 10,000
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








