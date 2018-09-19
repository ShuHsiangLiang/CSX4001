random <- sample(1000:9999,1)

r.thou <- random %/% 1000
r.hund <- (random %/% 100) %% 10
r.tent <- (random %% 100) %/% 10
r.numb <- random %% 10

r.list <- c(r.thou, r.hund, r.tent, r.numb)

times <- c(1:9999)
counts <- 0

for (j in times)
{
  guess <- scan(nmax = 1)

  g.thou <- guess %/% 1000
  g.hund <- (guess %/% 100) %% 10
  g.tent <- (guess %% 100) %/% 10
  g.numb <- guess %% 10

  g.list <- c(g.thou, g.hund, g.tent, g.numb)
  
  x <- 1:4
  correct <- 0

  for(i in x)
  {
    if (r.list[i] == g.list[i]) {
      correct = correct + 1
      }
  }

  cat(correct, "A", 4-correct, "B")
  
if (guess == random){
  break
} else {
    counts = counts + 1
  }
}

cat("總共猜了:", counts + 1, "次")

