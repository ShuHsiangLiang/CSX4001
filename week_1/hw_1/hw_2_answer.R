# 產生隨機四位數
random <- sample(1000:9999,1)

# 將四位數分為四個數字
r.thou <- random %/% 1000
r.hund <- (random %/% 100) %% 10
r.tent <- (random %% 100) %/% 10
r.numb <- random %% 10

# 將四個數字編為陣列
r.list <- c(r.thou, r.hund, r.tent, r.numb)

# 定義次數範圍
times <- c(1:9999)

# 計算總共猜了幾次
counts <- 0

for (j in times)
{
  # 自行輸入隨機四個數字
  guess <- scan(nmax = 1)

  # 將四位數分為四個數字 
  g.thou <- guess %/% 1000
  g.hund <- (guess %/% 100) %% 10
  g.tent <- (guess %% 100) %/% 10
  g.numb <- guess %% 10
  
  # 將四個數字編為陣列
  g.list <- c(g.thou, g.hund, g.tent, g.numb)
  
  # 將 r.list 與 g.list 中元素互相比對
  x <- 1:4
  correct <- 0

  for(i in x)
  {
    if (r.list[i] == g.list[i]) {
      correct = correct + 1
      }
  }

  cat(correct, "A", 4-correct, "B")

  # 當 guess 等於 random 時跳出迴圈，並輸出 counts
if (guess == random){
  break
} else {
    counts = counts + 1
  }
}

# 輸出 counts
cat("總共猜了:", counts + 1, "次")

