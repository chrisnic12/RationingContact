# Additional Material & Data for: 

# Rationing Social Contact During the COVID-19 Pandemic: Transmission Risk and Social Benefits of US Locations

# Data 

### SafeGraph Data 

SafeGraph data access can be requested here: https://www.safegraph.com/covid-19-data-consortium

### Survey data 

*AVI can you please add a desription to the dataset and the file name?

### Business Census

*SETH can you please add a desription to the dataset and the file name -- or just have a link to the dataset?

### BLS Data
*SETH can you please add a desription to the dataset and the file name -- or just have a link to the dataset?

### Derived statistics for the 26 categories 

Statistics regarding the 26 categories described in the main text are located in "26_categories_dataset.csv."

This includes the following information:

###### 9 risk indicators 

1. "total_raw_visits_feb" the total number visits in each category for Feb 2020
2. "total_raw_visitors_feb" the total number of visitors in each category for Feb 2020
3.  "Cum_Risk_Metric_low_dens_feb" is the cumulative over all locations within the category total person-hours during the times that there are more than 1 people over 215 square feet in the location
4. "Cum_Risk_Metric_high_dens_feb" is the cumulative over all locations within the category total person-hours during the times that there are more than 1 people over 113 square feet in the location

5. "over65_total_raw_visits_feb" the total number of visits by over 65 people in each category for Feb 2020 
6. "over65_total_raw_visitors_feb" the total number of over 65 age visitors in each category for Feb 2020
7. "over65_Cum_Risk_Metric_low_dens_feb" is the cumulative over all locations within the category total over 65 person-hours during the times that there are more than 1 people over 215 square feet in the location
8. "over65_Cum_Risk_Metric_high_dens_feb" is the cumulative over all locations within the category total over 65 person-hours during the times that there are more than 1 people over 113 square feet in the location

9. "median_distance_travel_fromhome" is the average -- over the locations in a category -- median distance that visitors travel to visit the location

###### 4 importance measures

1. "full_preferences" is the % of the time the category wins in the binary discrete choice survey
2. "employement"
3. "annual_payroll"
4. "preliminary_receipts"

2,3 & 4 important measures are all coming from here: https://www.census.gov/data/tables/2017/econ/susb/2017-susb-annual.html

All figures of the manuscript can be reproduced using that dataset and the "Analysis.R" script.  


# Supplementary Figures 

The file "sup_figures.pdf" includes:

S1
S2
S3


# Inquiries

- If you have questions about the survey data collection and analysis, please contact Avinash Collis at: avinashg [at] mit [dot] edu

- If you have questions about the economic indexes data collection and analysis, please contact Seth G Benzell at: sbenzell [at] mit [dot] edu

- If you have questions about the SafeGraph data collection and analysis, please contact Christos Nicolaides at: chrisnic [at] mit [dot] edu
