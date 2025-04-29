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


