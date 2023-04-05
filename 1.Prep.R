library(fitdistrplus)
library(actuar)
library(DescTools)
library(dplyr)
library(data.table)
library(writexl)
library(readxl)
library(ggplot2)
library(yarrr)
library(moments)
# historical_data<-fread("C:/Users/miche/OneDrive/Desktop/Uni 2023/ACTL4001/Assignment/Clean-Historical-Hazard.csv") #this needs to be replaced with the normalised data
historical_data<-read_excel("C:/Users/miche/OneDrive/Desktop/Uni 2023/ACTL4001/Assignment/normalised_data.xlsx")



historical_data$log_property_loss_inflation_normalised<-ifelse(historical_data$property_loss_inflation_normalised==0,0,log(historical_data$property_loss_inflation_normalised))
historical_data$log_property_loss_inflation_pop_normalised<-ifelse(historical_data$property_loss_inflation_pop_normalised==0,0,log(historical_data$property_loss_inflation_pop_normalised))
historical_data$log_property_loss_inflation_pop_gdp_normalised<-ifelse(historical_data$property_loss_inflation_pop_gdp_normalised==0,0,log(historical_data$property_loss_inflation_pop_gdp_normalised))
historical_data$log_property_loss_original<-ifelse(historical_data$property_loss_original==0,0,log(historical_data$property_loss_original))

historical_data<-setDT(historical_data)

data_region1<-historical_data[region==1&property_loss_original>0,]
data_region2<-historical_data[region==2&property_loss_original>0,]
data_region3<-historical_data[region==3&property_loss_original>0,]
data_region4<-historical_data[region==4&property_loss_original>0,]
data_region5<-historical_data[region==5&property_loss_original>0,]
data_region6<-historical_data[region==6&property_loss_original>0,]

#Region 1 
par(mfrow=c(2,2))
hist(data_region1$log_property_loss_original, breaks=50, main="Property Damage Original")
hist(data_region1$log_property_loss_inflation_normalised, breaks=50, main="Property Damage Normalised By Inflation")
hist(data_region1$log_property_loss_inflation_pop_normalised, breaks=50, main="Normalised by Inflation and Population")
hist(data_region1$log_property_loss_inflation_pop_gdp_normalised, breaks=50, main="Normalised by Inflation, GDP & Population")

#Region 2
par(mfrow=c(2,2))
hist(data_region2$log_property_loss_original, breaks=50)
hist(data_region2$log_property_loss_inflation_normalised, breaks=50)
hist(data_region2$log_property_loss_inflation_pop_normalised, breaks=50)
hist(data_region2$log_property_loss_inflation_pop_gdp_normalised, breaks=50)


#Region 3
par(mfrow=c(2,2))
hist(data_region3$log_property_loss_original, breaks=50)
hist(data_region3$log_property_loss_inflation_normalised, breaks=50)
hist(data_region3$log_property_loss_inflation_pop_normalised, breaks=50)
hist(data_region3$log_property_loss_inflation_pop_gdp_normalised, breaks=50)


#Region 4
par(mfrow=c(2,2))
hist(data_region4$log_property_loss_original, breaks=50)
hist(data_region4$log_property_loss_inflation_normalised, breaks=50)
hist(data_region4$log_property_loss_inflation_pop_normalised, breaks=50)
hist(data_region4$log_property_loss_inflation_pop_gdp_normalised, breaks=50)


#Region 5
par(mfrow=c(2,2))
hist(data_region5$log_property_loss_original, breaks=50)
hist(data_region5$log_property_loss_inflation_normalised, breaks=50)
hist(data_region5$log_property_loss_inflation_pop_normalised, breaks=50)
hist(data_region5$log_property_loss_inflation_pop_gdp_normalised, breaks=50)


#Region 6
par(mfrow=c(2,2))
hist(data_region6$log_property_loss_original, breaks=50)
hist(data_region6$log_property_loss_inflation_normalised, breaks=50)
hist(data_region6$log_property_loss_inflation_pop_normalised, breaks=50)
hist(data_region6$log_property_loss_inflation_pop_gdp_normalised, breaks=50)




