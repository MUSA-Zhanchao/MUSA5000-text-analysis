library(wordcloud)
library(text)
library(tm)
library(SnowballC)
library(words)
library(NbClust)
library(stringr)
library(dplyr)
library(syuzhet)




text<-"data/comments.txt"
# Load and preprocess all text documents
myCorpus <- tm::VCorpus(VectorSource(sapply(text, readLines)))

# Convert everything to lower case
myCorpus <- tm_map(myCorpus, content_transformer(tolower))

cat(content(myCorpus[[1]])[1:10], sep = "\n")

toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))
#     Defining the remApostrophe function
remApostrophe <- content_transformer(function(x,pattern) gsub(pattern, "", x))
#     Removing special characters
myCorpus <- tm_map(myCorpus, toSpace, "@")
myCorpus <- tm_map(myCorpus, toSpace, "/")
myCorpus <- tm_map(myCorpus, toSpace, "]")
myCorpus <- tm_map(myCorpus, toSpace, "$")
myCorpus <- tm_map(myCorpus, toSpace, "—")
myCorpus <- tm_map(myCorpus, toSpace, "‐")
myCorpus <- tm_map(myCorpus, toSpace, "”")
myCorpus <- tm_map(myCorpus, toSpace, "‘")
myCorpus <- tm_map(myCorpus, toSpace, "“")
myCorpus <- tm_map(myCorpus, toSpace, "‘")
myCorpus <- tm_map(myCorpus, remApostrophe, "’")

cat(content(myCorpus[[1]])[1:10], sep = "\n")

myCorpus <- tm::tm_map(myCorpus, removeNumbers)
myCorpus <- tm_map(myCorpus, removePunctuation)
cat(content(myCorpus[[1]])[1:10], sep = "\n")

myCorpus <- tm_map(myCorpus, removeWords, stopwords("english"))
cat(content(myCorpus[[1]])[1:10], sep = "\n")


fixNA <- content_transformer(function(txt) {
  if (is.na(txt)) "" else txt
})
myCorpus <- tm_map(myCorpus, fixNA)

myCorpus <- myCorpus[
  sapply(
    myCorpus,
    function(doc) nzchar(trimws(content(doc)))
  )
]


tdm <- TermDocumentMatrix(myCorpus)
tm::inspect(tdm)

m<- as.matrix(tdm)
dim(m)

tab <- as.matrix(table(cs))
wordcloud(myCorpus, min.freq=100)