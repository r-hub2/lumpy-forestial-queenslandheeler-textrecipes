library(testthat)
library(textrecipes)

old <- setwd("testthat")
for (f in sort(list.files(".", pattern = "^test.*[.][Rr]$"))) {
  a <- proc.time()
  try(test_file(f, reporter = "silent"), silent = TRUE)
  d <- proc.time() - a
  cat(sprintf(
    "TIMING %-32s cpu=%7.2f elapsed=%7.2f ratio=%6.2f\n",
    f, sum(d[-3L]), d[3L], sum(d[-3L]) / max(d[3L], 0.001)
  ))
}
setwd(old)
