library(ggplot2)
library(tidyverse)
library(ggplot2)
scatterplot <-ggplot(data = mtcars, aes(x =wt, y = mpg, col = cyl)) + geom_point()

scatterplot
set.seed(123)

beauty <- rnorm(1000, mean = 5, sd = 1.5)

talent <- rnorm(1000, mean =3, sd =1)

celebrity <- ifelse(beauty + talent > 8, "celeb", "not_celeb")

dat <- data.frame (beauty, talent, celebrity,stringsAsFactors = FALSE)

head(dat)

celebPlot <- ggplot(data =dat, aes(x =beauty, y = talent, col = celebrity)) + geom_point() + geom_smooth(method ="lm")

##confounder:

#rep is replicate
## as.numeric is 1. 
gender <- rep(c("male", "female"), each = 500)
shoesize <-rnorm(1000, 38, 2) + 4 * as.numeric(gender == "male")
income <- rnorm(1000, 25, 2) + 5 * as.numeric(gender == "male")

data <- data.frame(gender, shoesize, income, stringsAsFactors = FALSE)
head(dat)
tail(dat)



install.packages("ggdag")
library(ggdag)

##makes pretty pictures
##it shows x causes y

dagify(y ~ x) %>% ggdag()


dagify ( y ~~ x) %>%  ggdag()
##x causes y and y causes x (2 tildas)

dagify(y~x, d~x) %>%  ggdag()


smoking_dag <- dagify(cardiacArrest ~ cholestrol, cholestrol ~ smoking + weight, smoking ~ unhealthy, weight ~ unhealthy, labels =c(cardiac)) %>% ggdag(text = FALSE, use_labels="label")
