library(XML)
library(RCurl)

## https 協定 使得原本只有 "www" 網域名稱而無法找到

data <- list()

for(i in 3671:3680){
  tmp <- paste(i, '.html', sep='')
  url <- paste('https://www.ptt.cc/bbs/StupidClown/index', tmp, sep='')
  html <- htmlParse(getURL(url))
  url.list <- xpathSApply(html, "//div[@class='title']/a[@href]", xmlAttrs)
  data <- rbind(data, paste('https://www.ptt.cc', url.list, sep=''))
}

data.chr <- unlist(data)
data.chr

getdoc <- function(address){
  start <- regexpr('https', address)[1]
  end <- regexpr('html', address)[1]
  
  if(start != -1 & end != -1){
    url <- substr(address, start, end+3)
    getURL(url)
    html <- htmlParse(getURL(url))
    doc <- xpathSApply(html, "//div[@id='main-content']", xmlValue)
    name <- strsplit(url, '/')[[1]][6]
    write(doc, gsub('html', 'txt', name))
  }      
}
sapply(data.chr, getdoc)

library(NLP)
library(tm)
library(tmcn)
library(rJava)



