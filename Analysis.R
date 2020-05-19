library(haven)
library(rstudioapi)
library(ggplot2)
library(ggrepel)
library(wesanderson)
library(viridis)
library(RColorBrewer)
library(dplyr)

#Read Dataset
data_main <- read.csv("26_categories_dataset.csv")

###### 9 risk indicators #######

# - total_raw_visits_feb is the total number visits in each category for Feb 2020
# - total_raw_visitors_feb is the total number of visitors in each category for Feb 2020
# - Cum_Risk_Metric_low_dens_feb is the total person-hours during the times that there are 
# more than 1 people over 215 square feet in the location
# - Cum_Risk_Metric_high_dens_feb is the total person-hours during the times that there are 
# more than 1 people over 113 square feet in the location

# - over65* refers to the same metrics for people over 65 year old

# - median_distance_travel_fromhome is the average -- over the locations in a category --
# median distance that visitors travel to visit the location


###### 4 importance indicators #######
# - full_preferences

# - employement

# - annual_payroll

# - preliminary_receipts


# - log_visits_change_feb_to_mar is the log change in visits at the level of a category from
#February 2020 to March 2020

data_main$rank_visits_feb_tot <- rank(data_main$total_raw_visits_feb)
data_main$rank_visiors_feb_tot <- rank(data_main$total_raw_visitors_feb)
data_main$rank_low_dense_feb_tot <- rank(data_main$Cum_Risk_Metric_low_dens_feb)
data_main$rank_high_dense_feb_tot <- rank(data_main$Cum_Risk_Metric_high_dens_feb)

data_main$OLD_rank_visits_feb_tot <- rank(data_main$over65_total_raw_visits_feb)
data_main$OLD_rank_visiors_feb_tot <- rank(data_main$over65_total_raw_visitors_feb)
data_main$OLD_rank_low_dense_feb_tot <- rank(data_main$over65_Cum_Risk_Metric_low_dens_feb)
data_main$OLD_rank_high_dense_feb_tot <- rank(data_main$over65_Cum_Risk_Metric_high_dens_feb)

data_main$rank_mixing <- rank(data_main$median_distance_travel_fromhome)

data_main$rank_consumer_tot <- rank(data_main$full_preferences)
data_main$rank_employment <- rank(data_main$employement)
data_main$rank_payroll <- rank(data_main$annual_payroll)
data_main$rank_revenue <- rank(data_main$preliminary_receipts)


data_main <- data_main %>% mutate(danger_index_feb_total_9 = 
                                    1/9*(rank_visits_feb_tot+
                                           rank_visiors_feb_tot+
                                           rank_low_dense_feb_tot+
                                           rank_high_dense_feb_tot+
                                           OLD_rank_visits_feb_tot+
                                           OLD_rank_visiors_feb_tot+
                                           OLD_rank_low_dense_feb_tot+
                                           OLD_rank_high_dense_feb_tot+
                                           rank_mixing), importance_index_tot=
                                    1/6*(3*rank_consumer_tot+rank_employment+
                                           rank_payroll+rank_revenue))



#Fig 1
ds <- data_main %>% select(category_name_short, rank_visits_feb_tot,
                           rank_visiors_feb_tot,rank_low_dense_feb_tot,rank_high_dense_feb_tot,
                           OLD_rank_visits_feb_tot,OLD_rank_visiors_feb_tot,
                           OLD_rank_low_dense_feb_tot,OLD_rank_high_dense_feb_tot,
                           rank_mixing,
                           rank_consumer_tot,rank_employment,rank_payroll,rank_revenue)
M <- matrix(0,ncol = 26, nrow = 26)
colnames(M) <- ds$category_name_short
rownames(M) <- ds$category_name_short

for (i in c(1:26)){
  
  for (j in c(1:26)){
    
    if ((sum((ds[i,2:10] < ds[j,2:10]))==9) & (sum((ds[i,11:14] > ds[j,11:14]))==4)) {
      
      M[i,j] <- 1
      
    } else if ((sum((ds[i,2:10] > ds[j,2:10]))==9) & (sum((ds[i,11:14] < ds[j,11:14]))==4)) {
      M[i,j] <- (-1)
    } else {
      
      M[i,j] <- 0
      
    }
    
    
  }  
  
}
library(reshape2)
diag(M)=NA
melted_cormat <- melt(M)
# Heatmap
library(ggplot2)
ggplot(data = melted_cormat, aes(x=Var2, y=Var1, fill = value))+
  geom_tile(aes(fill = value), colour = "grey45")+
  #scale_fill_gradient(low = "navy",mid = "white", high = "darkorange") + 
  scale_fill_gradient2(low = "blue", high = "darkorange", mid = "white") +
  scale_y_discrete(limits = rev(levels(melted_cormat$Var2))) +
  coord_fixed()






# Fig 2A
ggplot(data = data_main, aes(x = danger_index_feb_total_9, y = importance_index_tot, label =category_name_short))+ 
  geom_point(aes(color = resid(lm(importance_index_tot~danger_index_feb_total_9, data = data_main))), size = 5, show.legend = F)+
  geom_text_repel(max.iter = 10^5,lineheight = .75,point.padding=0.5) +
  labs(x = "Cumulative Danger due to Proximity Index", y = "Cumulative Importance Index") +
  scale_x_continuous(breaks = round(seq(0, 30, by = 5),1)) +
  scale_y_continuous(breaks = round(seq(0,30, by = 5),1)) +
  #scale_color_viridis(option = "E",direction = 1)
  scale_color_gradientn(colors = rev(c('orange',wes_palettes$Darjeeling2[4], wes_palettes$Darjeeling2[2]))) +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=20))


# Fig 2B
model<-lm(importance_index_tot~danger_index_feb_total_9, data = data_main)
data_main$importance_tradeoff_residual_9 <- resid(model)

#####Figure 2B PNAS

# change 
ggplot(data = data_main, aes(x = importance_tradeoff_residual_9, y=log_visits_change_feb_to_mar*100, label =category_name_short, weight=total_raw_visits_feb))+ 
  #geom_vline(xintercept = 0,linetype = 'dashed', color = 'orange', size = 2) +
  geom_smooth (method= 'lm', alpha=0.3, size=1.1, span=0.5, color = 'orange') + 
  #stat_smooth (geom="line", alpha=0.3, size=3, span=0.5) +  
  geom_point(size = (data_main$total_raw_visits_feb/10^7)/3.5, alpha = 0.3)+#aes(color = log1p(data_main$total_raw_visits_tot_feb)), size = 4, show.legend = F)+
  #geom_point(aes(color = log1p(data_main$total_raw_visits_tot_feb)), size = 4, show.legend = F)+
  geom_text_repel(max.iter = 10^5,lineheight = .75,point.padding=0.55) +
  labs(x = "Importance-Risk Tradeoff Favorability", y = "% Change in Visits") +
  scale_x_continuous(breaks = round(seq(-15, 15, by = 5),1)) +
  scale_y_continuous(breaks = round(seq(-1,0.1, by = 0.2)*100,1)) +
  #scale_color_viridis(option = "E",direction = 1)
  scale_color_gradientn(colors = rev(c('orange',wes_palettes$Darjeeling2[4], wes_palettes$Darjeeling2[2]))) +
  theme(axis.text=element_text(size=14),
        axis.title=element_text(size=20))





