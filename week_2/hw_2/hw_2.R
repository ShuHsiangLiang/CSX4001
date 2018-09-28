library(rvest)
library(httr)

url <- read_html("http://www.op.gg/summoner/userName=hide+on+bush", encoding = 'utf-8')

opgg.selected <- html_nodes(url, ".Cell , .KDA , .Cell a , .tablesorter-headerUnSorted")
opgg.selected.content <- html_text(opgg.selected)

opgg.selected.content
