library(bitops)
library(httr)
library(RCurl)
library(XML)
library(tm)

library(NLP)
library(tmcn)

library(jiebaRD)
library(jiebaR)

from <- 10010
to <- 10017

prefix = "https://www.ptt.cc/bbs/LoL/index"

data <- list()

for (id in c(from:to))
{
  url <- paste0(prefix, as.character(id), ".html")
  html <- htmlParse(GET(url))
  url.list <- xpathSApply( html, "//div[@class='title']/a[@href]", xmlAttrs )
  data <- rbind( data, as.matrix(paste('https://www.ptt.cc', url.list, sep='')))
}

data <- unlist(data)

head(data)

library(dplyr)

getdoc <- function(url)
{
  # url.test <- "https://www.ptt.cc/bbs/LoL/M.1542038314.A.3C1.html"
  html <- htmlParse(getURL(url))
  doc  <- xpathSApply( html, "//div[@id='main-content']", xmlValue )
  time <- xpathSApply( html, "//*[@id='main-content']/div[4]/span[2]", xmlValue )
  # temp <- gsub( "  ", " 0", unlist(time) )
  # part <- strsplit( temp, split=" ", fixed=T )
  # timestamp <- part[[1]][4]
  # timestamp <- strsplit( timestamp, split=":", fixed=T )
  # hour <- timestamp[[1]][1]
  name <- paste0("[PTT]", time, ".txt")
  write(doc, name)
}

sapply(data, getdoc)

d.corpus <- Corpus(DirSource("ptt"))
d.corpus <- tm_map(d.corpus, removePunctuation)
d.corpus <- tm_map(d.corpus, removeNumbers)
d.corpus <- tm_map(d.corpus, function(word) {
  gsub("[A-Za-z0-9]", "", word)
})

mixseg = worker()
jieba_tokenizer = function (d)
{
  unlist(segment(d[1], mixseg))
}

seg = lapply(d.corpus, jieba_tokenizer)

count_token = function(d)
{
  as.data.frame(table(d))
}

tokens = lapply(seg, count_token)

n = length(seq)
TDM = tokens[[1]]
colNames <- names(seg)
colNames <- gsub(".txt", "", colNames)
for( id in c(2:n) )
{
  TDM = merge(TDM, tokens[[id]], by="d", all = TRUE)
  names(TDM) = c('d', colNames[1:id])
}
TDM[is.na(TDM)] <- 0

library(knitr)

tf <- apply(as.matrix(TDM[,2:(n+1)]), 2, sum)

library(Matrix)

idfCal <- function(word_doc)
{ 
  log2( n / nnzero(word_doc) ) 
}
idf <- apply(as.matrix(TDM[,2:(n+1)]), 1, idfCal)

doc.tfidf <- TDM



