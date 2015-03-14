##############################EXAMPLE DATAFRAME##################################

set.seed(13435) ## makes sample numbers below reproduceable
X <- data.frame("var1"=sample(1:5),"var2"=sample(6:10),"var3"=sample(11:15)) ##3 variables, 5 observations
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA ## rescramble the dataframe, then replace 1st and 3rd characters of var2 with NAs
X

##################################SUBSETTING#####################################

X[1,] ## subset the first row

X[,1] ## subset the first column

X[,"var1"] ## subset the first column by name

X[1:2,"var2"] ## subset the first two observations of variable 2

X[(X$var1 <= 3 & X$var3 > 11),] ## AND subset

X[(X$var1 <= 3 | X$var3 > 15),] ## OR subset

X[which(X$var2 > 8),] ## subsets without returning NAs

####################################SORTING#####################################

sort(X$var1) ##sort the first column

sort(X$var1,decreasing=TRUE) ##sort by decreasing values

sort(X$var2,na.last=TRUE) ##sort, leaving NAs to last

X[order(X$var1),] ##order dataframe by first column

X[order(X$var1,X$var3),] ##order by first column and then by third

################################ORDERING WITH PLYR##############################

library(plyr)
arrange(X,var1) ##arrange dataframe by first variable (column)

arrange(X,desc(var1)) ##arrange first variable in descending order

X$var4 <- rnorm(5) ##add fourth column
X 

Y <- cbind(X,rnorm(5)) ## bind a column to the right side of X (rbind to bind rows)
Y