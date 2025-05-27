library(jsonlite)

N <- 300000L
collected <- list()
count     <- 0L

con <- file("data/yelp_academic_dataset_review.json", "r")

# This handler grabs only as many rows as needed, then stops the stream
handler_fn <- function(df_chunk) {
  remaining <- N - count
  if (remaining > 0) {
    take      <- seq_len(min(nrow(df_chunk), remaining))
    collected <<- c(collected, list(df_chunk[take, , drop = FALSE]))
    count     <<- count + length(take)
  }
  if (count >= N) {
    # Close the connection and throw an interrupt to break out
    close(con)
    stop("Reached 300k rows—streaming halted.")
  }
}

# Launch the stream (pagesize can be tuned)
tryCatch(
  stream_in(con,
            handler  = handler_fn,
            pagesize = 5000,
            flatten  = TRUE,
            verbose  = FALSE),
  error = function(e) {
    if (!grepl("Reached 300k rows", e$message)) stop(e)
  }
)

# Combine into one data.frame
df_first300k <- do.call(rbind, collected)

text<- df_first300k%>%
  select(text)

# export to txt
write.csv(text, "data/yelp_academic_dataset_review_first300k.csv", row.names = FALSE)

# 1. Read in your CSV (assumes one column + header)
df <- read.csv("data/yelp_academic_dataset_review_first300k.csv", stringsAsFactors = FALSE, header = TRUE)

# 2. Write out the first column as plain text, one line per entry
#    This drops the header automatically
writeLines(df[[1]], "comments.txt")
