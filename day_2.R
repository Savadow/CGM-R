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

num_arr <- c(3, 5, 1, 9, 2, 10, 11)
sorted_arr <- sort(num_arr)
mid <- length(sorted_arr)/2
index <- round(mid)
even_index <- index + 1
if (length(array)%%2!=0){
median <- sorted_arr[index]
print(sorted_arr)
print(paste("the median of the list is", median, sep=" "))
} else if (length(array)%%2==0) {
  median <- (sorted_arr[index] + sorted_arr[even_index]) / 2
  print(sorted_arr)
  print(paste("the median of the list is", median, sep=" "))
} else {
  print("array can't be manipulated!!")
}
