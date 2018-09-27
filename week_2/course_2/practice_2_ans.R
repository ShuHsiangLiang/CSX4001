### dataframe practice - II

GetBmi <- function(my.height.cm, my.weight.kg){
  my.height.m <- my.height.cm / 100
  my.bmi <- my.weight.kg / (my.height.m) ^ 2
  return (my.bmi)
}

### Part I

df <- read.table('test_data.csv', sep = ',', header = T, stringsAsFactors = F)

dim(df)

head(df)

tail(df)

summary(df)

str(df)

df$School <- as.factor(df$School)
df$Sex <- as.factor(df$Sex)

### Part II

Height <- c(179, 165, 158, 165, 172, 170, 168, 163, 169, 155)
Weight <- c(69, 62, 46, 50, 72, 70, 52, 49, 63, 49)
Kobe <- c("Kobe", "A", "M", NA, 39, 198, 96)

df <- cbind(df, Height, Weight)

df <- rbind(df, Kobe)

str(df)

df$Grade[11] <- 990

df$Grade <- as.integer(df$Grade)
df$Age <- as.numeric(df$Age)
df$Height <- as.numeric(df$Height)
df$Weight <- as.numeric(df$Weight)
str(df)

df <- df[order(df$Grade, decreasing = T), ]

df <- subset(df, select = c(-Age))

names(df)[4] <- "ToeicGrade"

subset(df, Height > 170 & ToeicGrade > 900, select = c(Name, ToeicGrade, Height))

df[df$School == 'A', ]

### Part III

df.sport <- data.frame(Name = c("Ali", "Petty", "Kobe"), FavSport = c("basketball", "baseball", "baseketball"))


df$ToeicLevel <- cut(x = df$ToeicGrade,
                     breaks = c(0, 600, 700, 800, 900, Inf),
                     labels = c("E", "D", "C", "B", "A"))

df$Bmi <- mapply(GetBmi, df$Height, df$Weight)

df <- merge(df, df.sport, by = 'Name', all.x = T)
View(df)





