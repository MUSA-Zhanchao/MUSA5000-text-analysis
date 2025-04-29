# Text Analysis

47 classical novel at Gutenberg project (text analysis)
Utiliziation: Analyzing Amazon review & survey

## Step 1: Bring in the text
read url

## Step 2: Data pre-processing (clean text)
read them in line, and put the text into Corpus. A text corpus is a large and unstructured set of texts used to statistical analysis

- Since R is case sensitive, you need to convert all the text into lower case
- look at the first document lines not including table of contents (20 lines)
- Remove special character (function `to_space`)
- remove apostrophe (another functions), not meaningful
- recheck the corpus
- there are some pre-built function, but not comprehensive
- remove stop words (frequent use words, not provide useful information) (e.g., as, and, down, into, until) depending on your analysis purpose
- remove personal defined stopwords, depending on your analysis purpose (few terms remains)
- stemming: (`ed`, `s`, `-ing` will be removed), problem (e.g. `swimming`-> `swimm` second `m` doesn't remove) (unintention remove `s`)
- Alterntive to stemming, lemmatization, groups together different inflected forms of the smae word (can be done in R)

## Term Document Matrix
see how often different terms appear in the document line  (sparse metrix)

- filter the word only in the scrabble dirctionary (using `words` package in R  (but may removed name or other terms not in the dictionary)

## Document term Matrix

Every documents are rows, every terms in colomn (variables). look distribution of terms

- visulization: word cloud (larger fonts, more frequency, specify minimum frequency)
- filter the words frequency, get rid of unnecessary data (too much)

## Text Clustering

k-means analysis (distribution)

## Sentiment Analysis

Sentiment lexicon: predefined sentiment (source, trained)

1. NRC Lexicon: list of words listed different sentiment categories: positive, negative, anger, fear, etc. (assigned words into 1 categories)
2. AFINN Lexicon: everyword give a scores between -5 and 5, negative -> negative, positive-> positive
3. Bing Lexicon: positive and negative
4. Syuzhet: flow of text, how emotional intensity change over time (temporal dynamics)

- Try words in different lexicon (crowd source, same words, change a little bit may be different scores)
- Some words in one dictionary but not in another
