# Additional Material & Data for: 

# Rationing Social Contact During the COVID-19 Pandemic: Transmission Risk and Social Benefits of US Locations

# Data 

### SafeGraph Data 

SafeGraph data access can be requested here: https://www.safegraph.com/covid-19-data-consortium

### Survey data and instrument

A sample survey instrument for a respondent is provided in the file "Survey.pdf". Note that every respondent saw a different version of this survey instrument since the single binary discrete choice experiments are randomly generated for each respondent.

Survey data is located in "Survey_data.xlsx". The first sheet "main" contains the following information:
zip: zipcode of respondent
choice_1 to choice_30: Each of the 30 choices selected in the single binary discrete choice experiments
choice_1.1, choice_1.2 to choice_30.1, choice_30.2: The choices shown to a respondent

The second sheet "location codes" contains the mapping between the numeric location codes and the name of the category.

### Economic Data

The economic data used in the analysis-- employment, payrolls, and receipts-- are directly retrieved from the US Census Bureau's 2017 Survey of US Businesses. Retrieved from https://www.census.gov/data/tables/2017/econ/susb/2017-susb-annual.html on April 22, 2020.

### Physical Proximity of Location Ocupations Data

The share of jobs in an industry requiring close physical proximity at different thresholds is derived from BLS OES employment by industry and O*NET job characteristics. Occupation required physical proximity is measured through the O*NET physical proximity (https://www.onetonline.org/find/descriptor/result/4.C.2.a.3) item: ``To what extent does this job require the worker to perform job tasks in close physical proximity to other people?'' Industry occupational employment is derived from the BLS OES May 2019 Release (https://www.bls.gov/oes/tables.htm). 

The BLS OES does not provide detailed employment breakdowns for every six digit NAICs industry.  For some location categories, this means that we match to industries at a higher level of aggregation. The categories for which an exact match to BLS OES data were not possible are: Hardware stores (44130) were given the occupational mix of 444100; Grocery stores (445100) were mapped to category 4450A1; Book stores (451211) were mapped to 451200; Museums (712110) were mapped to 712100; Department stores (452200) were mapped to 452000; General goods stores (452300) were mapped to 452000; Office supply stores (453210) were mapped to 452000; Pet stores (453910) were mapped to 453910; Liquor stores (453991) were mapped to 453900; Banks (522100, 523900, 523100) were mapped to 522200 and 523000; Fast food and Cafes, juice bars and dessert parlors (722513 and 722515) were both mapped to 722500. All other industries were perfectly matched. Note that this imprecise matching only applies to this supplementary figure -- economic census data used in the main text is perfectly matched by six digit NAICS. Data retrieved 4-22-20.

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


# Supplementary Figures & Materials

The file "Supplementary_Tables_and_Figures.pdf" includes:

- The supplementary table is a crosswalk from location categories to 6-digit NAICS codes and cumulative visits by location type in February 2020

- The supplementary figure has two panels ploting the share of employment in an industry which require close physical proximity to perform at two thresholds.

The file "Survey.pdf" 


# Inquiries

- If you have questions about the survey data collection and analysis, please contact Avinash Collis at: avinashg [at] mit [dot] edu

- If you have questions about the economic indexes data collection and analysis, please contact Seth G Benzell at: sbenzell [at] mit [dot] edu

- If you have questions about the SafeGraph data collection and analysis, please contact Christos Nicolaides at: chrisnic [at] mit [dot] edu
