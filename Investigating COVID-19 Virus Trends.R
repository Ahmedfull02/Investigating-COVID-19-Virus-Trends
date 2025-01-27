"""
Overview:

In this beginner-level R project, you'll step into the role of
a data analyst exploring the global COVID-19 pandemic
using real-world data. Leveraging R and the powerful dplyr library,
you'll manipulate, filter, and aggregate a comprehensive dataset
containing information on COVID-19 cases, tests, and hospitalizations 
across different countries. By applying data wrangling techniques such 
as grouping and summarizing,
you'll uncover which countries have the highest rates
of positive COVID-19 tests relative to their testing numbers.
This hands-on project will not only strengthen
your R programming skills and analytical thinking
but also provide valuable experience in deriving actionable insights
from real-world health data – a crucial skill in today'
s data-driven healthcare landscape.
"""

# Libraries
library('dplyr')
library('readr')
library('tibble')

# Load and explore the COVID-19 dataset
# using readr and tibble

# read data readr as tibble dataframe 
data = read_csv('data/worldometer_data.csv')
data = as_tibble(data)
data

# EDA (Exploratory Data Analysis)

# first 10 rows
head(data,1)

# data dimension
dim(data) # row x column

# show all columns
glimpse(data)

# Infos for each columns
summary(data)

# Automatic EDA
library(DataExplorer)
create_report(data)

# Filter and select relevant data
# using dplyr functions
# Selecting only relevent columns
data <- data %>% select(
  `Country/Region`,
  Population,
  TotalCases,
  TotalDeaths,
  TotalRecovered,
  `Tot Cases/1M pop`,
  `Deaths/1M pop`,
  TotalTests,
)

## Show data of morocco
data %>% filter(`Country/Region` == "Morocco") %>% select(Population,TotalCases,TotalDeaths,TotalRecovered)

## Order death tol descending
data %>% arrange(desc(`TotalDeaths`)) %>% select(`Country/Region`,TotalDeaths)

## Order death tol descending
data %>% arrange((`TotalDeaths`)) %>% select(`Country/Region`, TotalDeaths)

## Order death tol by 1 million
data %>% arrange(desc(`Deaths/1M pop`)) %>% select(`Country/Region`,`Deaths/1M pop`)

## Order death tol by 1 million
data %>% arrange((`Deaths/1M pop`)) %>% select(`Country/Region`,`Deaths/1M pop`)
