library("rvest")

page.resource <- read_html("http://na.op.gg/champion/statistics")
heros.rank <- html_nodes(page.resource, ".champion-index-table__cell--value , .champion-index-table__header , .champion-index-table__cell--rank , .champion-index-table__cell--champion")
heros.rank %>% html_text()
