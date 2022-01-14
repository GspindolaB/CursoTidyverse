library(tidyverse)

?merge

#     dplyr       ==           base
# inner_join(x,y) == merge(x,y)
# left_join(x,y)  == merge(x,y, all.x = TRUE)
# right_join(x,y) == merge(x,y, all.y = TRUE)
# full_join(x,y)  == merge(x,y, all.x = TRUE, all.y = TRUE)

#     dplyr       ==           SQL
# inner_join(x,y, by = "z") == SELECT * FROM x INNER JOIN y ON x."z"=y."z"
# left_join(x,y, by = "z")  == SELECT * FROM x LEFT JOIN y ON x."z"=y."z"
# right_join(x,y, by = "z") == SELECT * FROM x RIGHT JOIN y ON x."z"=y."z"
# full_join(x,y, by = "z")  == SELECT * FROM x FULL JOIN y ON x."z"=y."z"