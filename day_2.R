###########
#### 1 ####
###########

names <- c("divine", "kennedy", "jones")
cap_names <- c()

for (i in names){
  first_letter <- substr(i, 1, 1)
  rem_letter <- substr(i, 2, nchar(i))
  
  cap <- toupper(first_letter)
  fullname <- paste(cap, rem_letter, sep = "")
  cap_names <- c(cap_names, fullname)
}

print(cap_names)

###########
#### 2 ####
###########

f_name <- c("Julius", "Abraham", "Bill")
l_name <- c("Caeser", "Lincoln", "Clinton")

if(length(f_name) == length(l_name)){
  for (i in 1:length(f_name)){
    fullname <- paste(f_name[i], l_name[i], sep = " ")
    print(fullname)
  }
} else {
  print("Can't join!!")
}

###########
#### 3 ####
###########

num_array <- c(2, 4, 5, 7, 9)
sorted_array <- sort(num_array)

if (length(sorted_array) %% 2 == 0){
  index <- ceiling(length(sorted_array) / 2)
  
  median <- (sorted_array[index] + sorted_array[index + 1]) / 2
  print(median)
} else {
  index <- ceiling(length(sorted_array) / 2)
  
  median <- sorted_array[index]
  print(median)
}
