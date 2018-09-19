random <- sample(1000:9999,1)

r.thou <- random %/% 1000
r.hund <- (random %/% 100) %% 10
r.tent <- (random %% 100) %/% 10
r.numb <- random %% 10

r.list <- c(r.thou, r.hund, r.tent, r.numb)

guess <- scan(nmax = 1)

g.thou <- guess %/% 1000
g.hund <- (guess %/% 100) %% 10
g.tent <- (guess %% 100) %/% 10
g.numb <- guess %% 10

g.list <- c(g.thou, g.hund, g.tent, g.numb)
  
x <- 1:4
count <- 0

for(i in x)
{
  if (r.list[i] == g.list[i]) {
    count = count + 1
    }
}

cat(count, "A", 4-count, "B")



