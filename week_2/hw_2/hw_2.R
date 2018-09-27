library(rvest)
library(httr)

url <- read_html("http://www.op.gg/champion/statistics")

opgg.selected <- html_nodes(url, ".champion-index-table__header , .champion-index-table__position , .champion-index-table__name , .champion-index-table__cell--value , .champion-index-table__cell--rank , .tabHeader a , h2")

opgg.selected.content <- html_text(opgg.selected)

opgg.selected.content
