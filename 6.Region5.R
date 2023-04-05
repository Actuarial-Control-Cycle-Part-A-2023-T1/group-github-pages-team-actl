
#Fitting the Log Property Damage 

goodness_fit_region5<-list()

region5_logN <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "lnorm")
goodness_fit_region5[["region5_logN"]] <- gofstat(region5_logN)

region5_t <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "t", start=list(df=1))
goodness_fit_region5[["region5_t"]] <- gofstat(region5_t)

region5_N <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "norm")
goodness_fit_region5[["region5_N"]] <- gofstat(region5_N)

region5_weibull <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "weibull")
goodness_fit_region5[["region5_weibull"]] <- gofstat(region5_weibull)

region5_cauchy <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "cauchy")
goodness_fit_region5[["region5_cauchy"]] <- gofstat(region5_cauchy)

region5_exp <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "exp")
goodness_fit_region5[["region5_exp"]] <- gofstat(region5_exp)

region5_gamma <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "gamma")
goodness_fit_region5[["region5_gamma"]] <- gofstat(region5_gamma)

region5_logistic <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "logis")
goodness_fit_region5[["region5_logistic"]] <- gofstat(region5_logistic)

region5_pareto <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "pareto", start=list(shape = 1, scale = 50))
goodness_fit_region5[["region5_pareto"]] <- gofstat(region5_pareto)

region5_gompertz <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, distr = dGompertz, start=list(shape = 0.5, rate = 0.5))
goodness_fit_region5[["region5_gompertz"]] <- gofstat(region5_gompertz)

region5_gumbel <- fitdist(data_region5$log_property_loss_inflation_pop_gdp_normalised, "gumbel", start=list(alpha = 1, scale = 1))
goodness_fit_region5[["region5_gumbel"]] <- gofstat(region5_gumbel)

goodness_fit_region5

#loop test
set.seed(1)

# define number of years and days
num_years <- 60
num_days <- num_years * 360

# define damage distribution parameters
#the daily probability of the hazard occurring for the next n years will be the number of hazards in the last 10 years divided by the total days in the last n years
p_hazard<-as.numeric(count(historical_data[region==5&year>2020-num_years,]))/(num_years*360)

num_iterations <- 1000
output_df <- data.frame(matrix(NA, nrow = num_days, ncol = num_iterations))
colnames(output_df) <- paste0("Iteration_", 1:num_iterations)


for (i in 1:num_iterations) {
  # initialize loss amount vector for this iteration
  loss_amounts <- rep(NA, num_days)
  
  # simulate daily hazard occurrence and loss amount
  for (j in 1:num_days) {
    # simulate hazard occurrence for this day
    hazard<- rbinom(1, 1, p_hazard)
    # Generate loss amount from Weibull distribution
    if (hazard == 1) {
      loss <- rnorm(1, region5_N$estimate[1], region5_N$estimate[2])}
    # Check if loss exceeds cutoff, and if so, generate loss from lognormal distribution
    else{loss <- 0}
    loss_amounts[j] <- loss
  }
  # store loss amounts for this iteration in the output dataframe
  output_df[, i] <- loss_amounts
}

#clean the output dataset by removing the effect of logging the Property Damage 
output_df_clean <- matrix(0, nrow = nrow(output_df), ncol = ncol(output_df))
# Define a function that takes the exponent of each cell, or returns 0 if the cell is 0
exponent_or_zero <- function(x) {
  if (x == 0) {
    return(0)
  } else {
    return(exp(x))
  }
}

# Apply the function to each cell of the dataframe
output_df_clean <- apply(output_df, MARGIN = c(1, 2), FUN = exponent_or_zero)

#Count of Number of Disasters in n years. 
mean(colSums(output_df_clean != 0))
#Average Property Damage Size 
mean(colSums(output_df_clean)/colSums(output_df_clean != 0)) #check to ensure the avg property damage is reasonable

#total projected cost for n years
cost<-mean(colSums(output_df_clean))
cost 


#Count Number of Events 
n_rows<-20*360
counts <- apply(output_df_clean[1:n_rows, ], 2, function(x) sum(x != 0))
mean(counts)

total_damage <- apply(output_df_clean[1:n_rows, ],2,FUN=sum)
mean(total_damage)
skewness(total_damage)
sd(total_damage)/mean(total_damage)

#Aggregates the Simulations by Year 
agg_output_yr_reg5<- matrix(0, nrow = 60, ncol = 1000)

# iterate through each column of the original matrix and calculate the sum of every 365 rows
for (i in 1:1000) {
  agg_output_yr_reg5[, i] <- apply(matrix(output_df_clean[, i], nrow = 360), 2, sum)
}
agg_output_yr_reg5<-as.data.frame(agg_output_yr_reg5)

# add a new column for years
Year_2 <- rep(2021:(2021+59))
agg_output_yr_reg5 <- cbind(Year_2, agg_output_yr_reg5)

write_xlsx(agg_output_yr_reg5,"C:/Users/miche/OneDrive/Desktop/Uni 2023/ACTL4001/Assignment/output/simulation_region5_yearly.xlsx")



######################################Impact of Voluntary Relocation#################################
#find the cutoff for highest % of values. 
percent<-0.01
cutoff <- as.numeric(quantile(historical_data[region==5,property_loss_inflation_pop_gdp_normalised], 1-percent))
cut_historical_data_reg5<-historical_data[property_loss_inflation_pop_gdp_normalised<cutoff&region==5&property_loss_inflation_pop_gdp_normalised>0,]

region5_N_cut <- fitdist(cut_historical_data_reg5$log_property_loss_inflation_pop_gdp_normalised, "norm")

#loop 
set.seed(10)

# define number of years and days
num_years <- 60
num_days <- num_years * 360

# define damage distribution parameters
#the daily probability of the hazard occurring for the next n years will be the number of hazards in the last 10 years divided by the total days in the last n years
p_hazard<-as.numeric(count(historical_data[region==5&year>2020-num_years,]))/(num_years*360)

num_iterations <- 1000
output_df_cut <- data.frame(matrix(NA, nrow = num_days, ncol = num_iterations))
colnames(output_df_cut) <- paste0("Iteration_", 1:num_iterations)


for (i in 1:num_iterations) {
  # initialize loss amount vector for this iteration
  loss_amounts <- rep(NA, num_days)
  
  # simulate daily hazard occurrence and loss amount
  for (j in 1:num_days) {
    # simulate hazard occurrence for this day
    hazard<- rbinom(1, 1, p_hazard)
    # Generate loss amount from Weibull distribution
    if (hazard == 1) {
      loss <- rnorm(1, region5_N_cut$estimate[1], region5_N_cut$estimate[2])}
    # Check if loss exceeds cutoff, and if so, generate loss from lognormal distribution
    else{loss <- 0}
    loss_amounts[j] <- loss
  }
  # store loss amounts for this iteration in the output dataframe
  output_df_cut[, i] <- loss_amounts
}

#clean the output dataset by removing the effect of logging the Property Damage 
output_df_cut_clean <- matrix(0, nrow = nrow(output_df_cut), ncol = ncol(output_df_cut))

# Apply the function to each cell of the dataframe
output_df_cut_clean <- apply(output_df_cut, MARGIN = c(1, 2), FUN = exponent_or_zero)
output_df_cut_clean <-as.data.frame(output_df_cut_clean)
#Count of Number of Disasters in n years. 
mean(colSums(output_df_cut_clean != 0))
#Average Property Damage Size 
mean(colSums(output_df_cut_clean)/colSums(output_df_cut_clean != 0)) #check to ensure the avg property damage is reasonable

#total projected cost for n years
mean(colSums(output_df_cut_clean))
#Count Number of Events 
n_rows<-5*360
counts <- apply(output_df_cut_clean[1:n_rows, ], 2, function(x) sum(x != 0))
mean(counts)

total_damage <- apply(output_df_cut_clean[1:n_rows, ],2,FUN=sum)
mean(total_damage)

#Yearly cost
#Aggregates the Simulations by Year 
agg_output_cut_yr_reg5<- matrix(0, nrow = 60, ncol = 1000)

# iterate through each column of the original matrix and calculate the sum of every 365 rows
for (i in 1:1000) {
  agg_output_cut_yr_reg5[, i] <- apply(matrix(output_df_cut_clean[, i], nrow = 360), 2, sum)
}
agg_output_cut_yr_reg5<-as.data.frame(agg_output_cut_yr_reg5)

# add a new column for years
Year_2 <- rep(2021:(2021+59))
agg_output_cut_yr_reg5 <- cbind(Year_2, agg_output_cut_yr_reg5)

write_xlsx(agg_output_cut_yr_reg5,"C:/Users/miche/OneDrive/Desktop/Uni 2023/ACTL4001/Assignment/output/simulation_region5_yearly_cut.xlsx")


######################################IPCC Scenario Analysis#################################
ssp_factors<-read_excel("C:/Users/miche/OneDrive/Desktop/Uni 2023/ACTL4001/Assignment/ssp factors.xlsx")


num_years <- 20
num_days <- num_years * 360

p_hazard<-as.data.frame(matrix(0, nrow = nrow(ssp_factors), ncol = ncol(ssp_factors)))

for (i in 1:nrow(p_hazard)) {
  for (j in 1:ncol(p_hazard)) {
    # Calculate p_hazard for this cell using the formula
    p_hazard[i, j] <- as.numeric(count(historical_data[region == 5&year >2020-num_years, ]))*as.numeric(ssp_factors[i,j])/(num_years * 360)
  }
}
colnames(p_hazard)<-c("low","medium","high","vhigh")

#Loop
set.seed(10)
num_iterations <- 1000
ssp_scenario<-"vhigh"
assign(paste0("output_df_",ssp_scenario),data.frame(matrix(NA, nrow = num_days, ncol = num_iterations)))

for (i in 1:num_iterations) {
  # initialize loss amount vector for this iteration
  loss_amounts <- rep(NA, num_days)
  
  # simulate daily hazard occurrence and loss amount
  for (j in 1:num_days) {
    # determine the year index for the current day
    year_index <- ceiling(j / 3600)
    
    # simulate hazard occurrence for this day using the appropriate p_hazard value for the current year
    hazard <- rbinom(1, 1, p_hazard[year_index,ssp_scenario])
    
    # generate loss amount from Weibull distribution if hazard occurs, otherwise set loss to 0
    loss <- ifelse(hazard == 1, rnorm(1,region5_N_cut$estimate[1],region5_N_cut$estimate[2]), 0)
    
    # store loss amount for this day in the current iteration's column of output dataframe
    loss_amounts[j] <- loss
  }
  
  # store loss amounts for this iteration in the output dataframe
  output_df_vhigh[, i]<- loss_amounts
}

#clean the output dataset by removing the effect of logging the Property Damage 
output_df_vhigh_clean <- matrix(0, nrow = nrow(output_df_vhigh), ncol = ncol(output_df_vhigh))
# Define a function that takes the exponent of each cell, or returns 0 if the cell is 0

# Apply the function to each cell of the dataframe
output_df_vhigh_clean <- apply(output_df_vhigh, MARGIN = c(1, 2), FUN = exponent_or_zero)

#Yearly cost
#Aggregates the Simulations by Year 
agg_output_cut_yr_reg5_vhigh<- matrix(0, nrow = 20, ncol = 1000)

# iterate through each column of the original matrix and calculate the sum of every 365 rows
for (i in 1:1000) {
  agg_output_cut_yr_reg5_vhigh[, i] <- apply(matrix(output_df_vhigh_clean[, i], nrow = 360), 2, sum)
}
agg_output_cut_yr_reg5_vhigh<-as.data.frame(agg_output_cut_yr_reg5_vhigh)

# add a new column for years
Year_2 <- rep(2021:(2021+19))
agg_output_cut_yr_reg5_vhigh <- cbind(Year_2, agg_output_cut_yr_reg5_vhigh)

write_xlsx(agg_output_cut_yr_reg5_vhigh,"C:/Users/miche/OneDrive/Desktop/Uni 2023/ACTL4001/Assignment/output/simulation_region5_yearly_vhigh.xlsx")



