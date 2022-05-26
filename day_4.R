###########
#### 1 ####
###########

a <- c("James", "John", "Olayinka")
b <- c("Daniel", "James", "Olayinka")

for (i in a[!(a %in% b)]){
  print(nchar(i))
}

###########
#### 2 ####
###########

arr <- c()
range_arr <- as.integer(readline("Enter length of vector: "))

for (i in 1:range_arr){
  val <- as.integer(readline("Enter values for vector: "))
  arr <- c(arr, val)
}

print(arr)

###################
#### Classwork ####
###################

name <- readline("Enter name: ")
lenght <- as.integer(nchar(name))
permutation <- 1

for (i in 1:lenght){
  permutation <- permutation * i
}

print(lenght)
print(permutation)
