?tibble

z <- tibble(
  key = c(1,2,2,2),
  value = c("x1","x2","x3","x4")
)

z

a <- tibble(
  key = c(1,2),
  value = c("y1","y2")
)

a

z %>%
  left_join(a, by = "key" )

m <- tribble(
  ~key, ~value,
    1,  "x1",
    2,  "x2",
    2,  "x3",
    3,  "x4"
)

n <- tribble(
  ~key, ~value,
     1, "y1",
     2, "y2",
     3, "y3",
     4, "y4"
)

left_join(m,n, by = "key")
