###########
#### 1 ####
###########

val <- c(8, 4, 6.6, 8, 10, 33)
len <- 0
add <- 0

for (i in val) {
  len <- 1 + len
}

for (i in val) {
  add <- i + add
}

mean <- add / len
print(mean)

###########
#### 2 ####
###########

dataset = c(1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, 9.9)

n <- 0
for (i in dataset) {
  n <- 1 + n
}

sum_data <- 0
for (i in dataset) {
  sum_data <- i + sum_data
}

mean <- sum_data / n

new_data = c()
for (i in dataset) {
  diff <- i - mean
  new_data <- c(new_data, (diff ** 2))
}

sum_new_data <- 0
for (i in new_data) {
  sum_new_data <- i + sum_data
}

std <- (sum_new_data / n) ** (1 / 2)
print(std)

###########
#### 3 ####
###########

val <- c(2, 6, 3, 0, 26, 5, 33, 1)

max_val <- val[1]
for (i in val){
  if (i > max_val){
    max_val <- i
  }
}

min_val <- val[1]
for (i in val){
  if (i < min_val){
    min_val <- i
  }
}

range_val <- max_val - min_val
print(range_val)

###################
#### Classwork ####
###################

a <- c(6, 10, 12, 3, 1)
b <- c(4, 13, 8, 9, 5)
c <- a - b

      #####
      # a #
      #####
# Standard Deviation
n <- length(c)

sum <- 0
for (i in c){
  sum <- i + sum
}

mean <- sum / n

new = c()
for (i in c){
  diff <- i - mean
  new <- c(new, (diff ** 2))
}

sum_new <- 0
for (i in new){
  sum_new <- i + sum_new
}

std <- (sum_new / n) ** (1 / 2)
print(std)


      #####
      # b #
      #####
len_a <- length(a)
len_b <- length(b)
sum_a <- 0
sum_b <- 0
max_a <- a[1]
max_b <- b[1]
min_a <- a[1]
min_b <- b[1]

# Getting sum, min and max for vector a
for (i in a){
  sum_a <- i + sum_a
  if (i > max_a){
    max_a <- i
  } else if (i < min_a){
    min_a <- i
  }
}

# Getting sum, min and max for vector b
for (i in b){
  sum_b <- i + sum_b
  if (i > max_b){
    max_b <- i
  } else if (i < min_b){
    min_b <- i
  }
}

# Getting mean for vector a and vector b
mean_a <- sum_a / len_a
mean_b <- sum_b / len_b

seq_one <- mean_a / max_b
seq_two <- mean_b / min_a
seq <- seq_one - seq_two
print(seq)

      #####
      # c #
      #####
sorted_a <- sort(a)
median_a <- sorted_a[ceiling(len_a / 2)]

denom <- ((min_b + min_a) ** 2) ** (1 / 2)
ans <- median_a / denom
print(ans)

