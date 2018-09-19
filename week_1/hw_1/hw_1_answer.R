
# Task1

iris
dim(iris)
head(iris)
tail(iris)
str(iris)
summary(iris)

# Task 2

x <- 1:9

for (i in x){
  for (j in x){
    print (i*j)
  }
}

# Task 3

nums <- sample(10:100,10)
nums
str(nums)
nums[1]

for (n in nums){
  if (n == 66){
    print("太66666666666了")
    break
  }
  else if (n >= 50 && n %% 2 == 0)
    cat("偶數且大於50:", n, "\n")
}


# Task 4

year <- 2016
  
if ((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)){
  print("閏年")
}
  else {
    print("平年")
  }
  





