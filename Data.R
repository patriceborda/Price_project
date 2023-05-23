# Articles avec Maurice Billionnière, Differentiel de pris Outre-Mer
#date : 04/04/2023
# AUteur : Patrice BORDA

library(tidyverse)
library(lubridate)
library(dynamicTreeCut)
library(dtwclust)
library(corrplot)
library(Hmisc)
library(cowplot)    # Multiple plots with plot_grid()
library(cranlogs)   # For inspecting package downloads over time
library(corrr) 
library(TTR)
library(showtext)
library (readxl)
library(ggplot2)
library(ggpubr)
library(ggthemes)

# Tidy correlation tables and correlation plotting
# Annalyse de cluster pour les prix dans les DOM par famille de produits
# date : 14/06/2021
# Article : BORDA, Billionnière
# Lecture de la base de données pour les DOM et la France
# IPC Indice des prix  à la consommation Outremer /produits
# IPC Indice des prix  à la consommation France Base 2015 /produits
# IPC Indice générale des prix France base 2015

setwd("C:/Patrice/price_project")
#font_add_google("Ubuntu", "ubuntu")

IPC_Base2015_97 <- read_delim("Data/BD_IPC_Base2015_97.csv", ";", escape_double = FALSE, locale = locale(decimal_mark = ","), trim_ws = TRUE)
IPC_Fra_Base_2015 <- read_delim("Data/IPC_Fran_Base_2015.csv", ";", escape_double = FALSE, locale = locale(decimal_mark = ","), trim_ws = TRUE) 
IPC_Base2015_Fran <- read_delim("Data/BD_IPC_Base_2015_Fran.csv", ";", escape_double = FALSE, locale = locale(decimal_mark = ","), trim_ws = TRUE)   
IPC_Base2015_Fran1 <- read_delim("Data/BD_IPC_Base_2015_Fran1.csv", ";", escape_double = FALSE, locale = locale(decimal_mark = ","),trim_ws = TRUE)                            
roll1 <- read_delim("Data/roll1.csv", delim = ";", 
                    escape_double = FALSE, trim_ws = TRUE)
#date <- read_csv("Data/date.csv")
Int1 <- IPC_Base2015_97 %>%
  pivot_longer(-c(1:3), names_to = "date")
#Traitement des données de la France et de la Guadeloupe



# France
IPC_long_Fran <- IPC_Base2015_Fran %>%
  pivot_longer(-c(1:3), names_to = "date") %>%
  mutate(date = ym(date)) 
#filter(`Variables` %in% c("TOT", "AHT", "PF", "APA", "PM", "HC", "PS", "AMP", "E", "PP", "S","SS", "LE", "STC", "ASE", "PME", "MHH")) %>%
# France
IPC_long <- IPC_Base2015_97 %>%
  pivot_longer(-c(1:3), names_to = "date") %>%
  mutate(date = ym(date)) 
#filter(`Variables` %in% c("TOT", "AHT", "PF", "APA", "PM", "HC", "PS", "AMP", "E", "PP", "S","SS", "LE", "STC", "ASE", "PME", "MHH")) %>%
