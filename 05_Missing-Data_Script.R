rm(list=ls()) #delete all objects in working memory 

## Tidyverse-Package is a collection of packages
## for dataimport, cleaning, manipulation and visualization 
## it has a really simple and logical syntax

## Install tidyverse-package and load it with library()
installed.packages("tidyverse")
library(tidyverse)


## Create dataset
## create the variables with the combine-function 
id = c(1, 2, 3, 4, 5, 6, 7, 8, 2, 9, 10)
height = c(NA, 1.85, 1.68, 1.74, 1.91, 1.82, 1.67, NA, 1.85, 1.76, 1.82)
weight = c(70, 90, NA, 69, 75, 76, 65, 82, 90, 65, 78)
gender = c("female", "male", NA, "female", "male", "female", "male", "male", "male", "female", NA)
income = c(35000, 42000, 48000, 26000, 52000, 29000, 45000, 68000, 42000, NA, 79000)
proglang = c("R", "Python", "R", "R", "C#", NA, "C++", "Python", "Python", "R", NA)
hobbies = c("Gaming", "Jogging", "Footbal", NA, "Tennis", "Gaming", NA, "Football", "Jogging", NA, "Chess")
tetrishighscore = c(NA, NA, NA, 100000, NA, NA, NA, NA, NA, NA, NA)


## save dataset as data and show it with the View()-argument
data <- data.frame(id, height, weight, gender, income, proglang, hobbies, tetrishighscore)
View(data)

## which datatype is the variable

str(data) ## "num" is the default datatype for numbers in R

## specific variable "gender"

class(data$gender) ## "character" In R, a piece of text is represented as a sequence 
                   ## of characters (letters, numbers, and symbols).

## What are the different values of the variable?
unique(data$gender)

## Define the variable as integer (height, weight, id) and factor (gender)

## Integer: Numbers that do not contain decimal values are called "integer"
## Factor: A factor in R is a variable used to categorize and store the data, 
## having a limited number of different values

data$weight <- as.integer(data$weight)
data$id <- as.integer(data$id)
data$gender <- as.factor(data$gender)
data$income <- as.integer(data$income)
data$hobbies <- as.factor(data$hobbies)
data$tetrishighscore <- as.integer(data$tetrishighscore)

str(data)

## which is level 1 and which is level 2?
levels(data$gender)
## change the level (here only for demonstration how to do this)
data$gender <- factor((data$gender), 
                       levels = c("male", "female"))

levels(data$gender)

## Next step: Select variables
data %>% 
  select(id, gender, income, proglang, ends_with("ght")) %>% 
  names()

## filter observations (Only programming languages R, Python and C++) and income<60k
unique(data$proglang)

data %>% 
  select(id, gender, proglang, income, ends_with("ght")) %>% 
  filter(proglang %in% c("R", "Python", "C++") & income < 60000) 

## Missing data
mean(data$height)
mean(data$height, na.rm = TRUE)

## na.omit to remove the NA's
data %>% 
  select(id, gender, proglang, income, ends_with("ght")) %>% 
  na.omit()

## complete cases (filter out some na's)
## Without "!" we would filter out observations, that has no missing data (same as na.omit)
## With "!" we see all variables with na's 
data %>% 
  select(id, gender, proglang, income, ends_with("ght")) %>% 
  filter(complete.cases(.)) ## the point inside the brackets stands for the dataset

data %>% 
  select(id, gender, proglang, income, ends_with("ght")) %>% 
  filter(!complete.cases(.))

## drop all na's from the variable gender for example
## we should only do this, if we need all values of a variable
data %>% 
  select(id, gender, proglang, income, ends_with("ght")) %>% 
  filter(!complete.cases(.)) %>%  
  drop_na(gender)
  

## Now we want to create the new variable "BMI" with the mutate-function
## BMI-Formula = weight (in kg) devided by height (in m) squared
  data %>% 
    select(id, gender, proglang, income, ends_with("ght")) %>% 
    filter(!complete.cases(.)) %>% 
    mutate(bmi = weight / (height*height))
  
  
## Duplicated data?
duplicated(data)

## The old way to find out the duplicated data...
data[duplicated(data), ]  ## Shows the duplicate
data[!duplicated(data), ] ## Observations that are not duplicats


### with tidyverse
data %>% 
  distinct() %>% 
  View()

## recoding variables with mutate-function
data %>% 
  select(gender) %>% 
  mutate(gender = recode(gender, 
                         "male" = 1,
                         "female" =2))