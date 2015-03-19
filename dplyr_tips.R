## EXAMPLE DATAFRAME df <- data.frame(x = 1:5, y = LETTERS[1:5])


library(dplyr) ##bring up dplr library
convertbl <- tbl_df(new) ## convert table to tbl
rm("new") ## remove other handle
convertbl ##print converted table
select(convertbl, column1, column2)## for columns THIS CAN RETURN IN THE ORDER SPECIFIED
filter(convertbl, column1 == "value1", column2 == "value2") ## for finding row information
