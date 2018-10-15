drawboard <- function(x){
  cat(x[1],"|", x[2], "|", x[3],"\n")
  cat("_________\n")
  cat(x[4],"|", x[5], "|", x[6],"\n")
  cat("_________\n")
  cat(x[7],"|", x[8], "|", x[9],"\n")
}

blank = rep(" ", each = 9)
blank

drawboard(blank)

for (i in 1:9){
  cat("Round", i,"\n")
  if (i %% 2 == 1){
    print("Now is A's turn!")
    print("Player A input(1:9): ")
    a <- readline()
    if (a <= 9 && a >= 1)
      
    else
      print("Invalid input! Please re-enter!")
  }
}

if (blank[1] == blank[2] == blank[3] || blank[4] == blank[5] == blank[6] ||
    blank[7] == blank[8] == blank[9] || blank[1] == blank[4] == blank[7] ||
    blank[2] == blanl[5] == blank[8] || blank[3] == blank[6] == blank[9] ||
    blank[1] == blank[5] == blank[9] || blank[3] == blank[5] == blank[7]){
  
}


  