person.name <- c("Jiyuian", "Shawnroom", "Bigmoumou")
person.sex <- c("F", "M", "M")
person.id <- c("jiyuian520", "shawnn520", "moumou123")
person.days <- c(201, 37, 99)

person.df <- data.frame(person.name, person.sex, person.id, person.days)
str(person.df)
summary(person.df)
person.df
person.df[1, ]
person.df[2, 3]
person.df$person.id
days.postion <- order(person.df$person.days)
person.df[days.postion, ]
spirit.520 <- grepl("520", person.df$person.id)

person.df[spirit.520, ]R
