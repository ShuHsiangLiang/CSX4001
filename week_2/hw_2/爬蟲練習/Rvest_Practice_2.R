library(rvest)
library(httr)

page.source <- read_html("https://en.wikipedia.org/wiki/R_(programming_language)", encoding = 'utf8')
version.block <- html_nodes(page.source, ".wikitable th+ td , th:nth-child(2) , .wikitable th:nth-child(1)")
head(version.block)
content <- html_text(version.block)
content
head(content)


page.source <- read_html("https://tw.yahoo.com/", encoding = 'utf-8')

hot.keywords <- html_nodes(page.source, ".keywords .Whs-nw")
html_text(hot.keywords)

news.title <- html_nodes(page.source, ".Va-tt")
html_text(news.title)


