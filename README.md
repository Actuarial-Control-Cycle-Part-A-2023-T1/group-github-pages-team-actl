# 2023 ACTL4001 SOA Challenge Showcase
The University of New South Wales

Team ACTL

Team Members: Ishraq Ifaz, Jim Kwon, Maria Zhang, Michelle Xie, Winnie Su


# Project Overview

This page showcases the process and results for developing a social insurance program for Storslysia in order to address the worsening climate situation. Our solution addresses both voluntary relocation costs through a buyback scheme and involuntary costs through a hazard insurance program. The showcase will provide comprehensive detail on the design of the program as well as the calculation of revenue and costs associated with the program. Moreover, due to the highly volatile nature of catastrophes and climate risk, the report also investigates further risks through a sensitivity analysis where several factors affecting the frequency and severity of catastrophes aggravate at a higher level than expected.


# Exploratory Data Analysis

Data Provided by SOA:



* Historical Hazard Event Data
* Economic and Demographic Data
* SSP Emissions Scenarios


## Initial Exploration of Historical Event Data
Historical Event Data


![alt_text](images/image1.png "image_tooltip")


Region 1 


![alt_text](images/image2.png "image_tooltip")


Region 2 


![alt_text](images/image3.png "image_tooltip")


Region 3 


![alt_text](images/image4.png "image_tooltip")


Region 4


![alt_text](images/image5.png "image_tooltip")


Region 5 


![alt_text](images/image6.png "image_tooltip")


Region 6 


![alt_text](images/image7.png "image_tooltip")


**Key Conclusions of EDA**



* There was a total of 3366 disasters over 60 years
* Region 2 has the highest property damage over the last 60 years, stemming from extremely large disaster in 1989
* Hazard data is typically high severity and low frequency for all 6 regions
* Summary Statistics presented in the table below: 


![alt_text](images/image8.png "image_tooltip")



# Data Preparation 


## Historical Data Normalisation

Our team prepared the Historical Hazard Event data for modelling by normalising the historical event data. Normalisation adjusts for the fact that if a hazard event of equal strength was to happen in the present, it will typically cause more damage than it had in past years because of wealth accumulation over time.

Normalisation adjusts nominal economic loss from past disasters upwards by multiplying past damage with a factor for inflation, for population growth and for growth in wealth per capita (GDP), thus in effect estimating the damage a past hazard event would have caused had it hit the same, but nowadays wealthier, area today. Loss normalisation therefore provides a more accurate measure of the economic loss value of a hazard in the future. All Property damage losses were normalised to 2020 for analysis.


![alt_text](images/image9.png "image_tooltip")



## Inflation Modelling 

Dollar values of property damage must be adjusted for inflation to 2020 dollar terms. The following process was utilised to clean inflation data. 


## Population Projection 


## GDP Modelling 

## Graphical Impact of Normalisation

The impact of normalisation on the histogram for each region is presented in the figures below. It is evident that normalising by inflation, GDP and Population leads to the best results. 

Region 1:


![alt_text](images/image10.png "image_tooltip")


Region 2:


![alt_text](images/image11.png "image_tooltip")


Region 3 


![alt_text](images/image12.png "image_tooltip")


Region 4


![alt_text](images/image13.png "image_tooltip")


Region 5


![alt_text](images/image14.png "image_tooltip")


Region 6


![alt_text](images/image15.png "image_tooltip")


# Risk and Risk Mitigation Considerations

## Quantitative Risks & Sensitivity Analysis
### SPCC Scenarios and Impact on Costs
A key assumption made was that natural disaster frequency and severity will follow the same distribution as historical data over the foreseeable 20-year period. However, a risk is that climate change could potentially have a much larger impact on frequency and severity of hazards in Storslysia than predicted. Scenario analysis has been performed under the 4 potential emission scenarios and how it could impact costs of hazard insurance, under the assumption that increasing carbon emissions directly impacts the frequency of natural hazards.

The impact of higher emissions leads to more frequent events is that property Damage Costs are much higher and more frequent. As such, the volatility of the natural disasters also increases, as we notice that the very high emissions case has larger peaks and troughs compared to the base assumption case.

Academic research has not yet been able to quantify the direct impact of climate change on the frequency and severity of natural disasters. As such, it will be a key component of the program to continuously monitor the development of natural disasters and adjust data and assumptions as necessary.

### Variations in Inflation and GDP Predictions and their Impact on Cost
Since the accuracy of the claim costs prediction heavily relies on the accuracy of inflation, GDP and population forecasts, sensitivity analysis for each was conducted to gain a holistic view on potential financial impacts if the actual figures do not align with expectation.

Figure 4 suggests that if the inflation over the next five years is 5% higher than the forecast every year, then the claim costs in 2025 would increase by 0.49%. On the other hand, the future values of claim costs are calculated based on a linear function of GDP and population. Thus, as GDP and population figures vary from the predictions, the impact on claim costs is scaled by the compounded variation between the realised and the base line figures. For instance, if GDP is always 2.5% higher than the estimation, then the claims costs in 2025 would increase by 13.14%.

The analyses imply it is unfavourable if the actual prints of those economic figures are higher than expected as claim costs would be inflated. The desired result is when actual GDP figures are within 2.5% of base line estimation so the claim costs are manageable in the long run. However, given the negative relationship between economic growth and inflation (Andrés and Hernando), it is not too concerning as the impact of higher inflation is likely to be offset by lower-than-expected GDP growth.

&nbsp;

## Qualitative Risks and Mitigations
|   | Risk | Mitigation | 
| ------------- | ------------- | ------------- |
| 1 | The model assumes that all policyholders that are eligible for voluntary buyback program will take the offer. However, if certain households refuse to undertake the buyback and relocate, then there would be a significant impact on claim costs as there will be more claims with high severity. | Conduct community outreach and education programs to help raise awareness about the buyback scheme and explain the benefits. Hold extra reserves in the case that certain properties cannot be convinced. | 
| 2 | Program costs from natural disasters may deviate highly from estimates as climate hazards are extremely volatile. | Have high reserves and capital in the case of an extreme event. Undertake reinsurance with a climate reinsurer or introduce a natural disaster pool. Monitor disasters frequently and update models when disaster occurs. | 
| 3 | Model risks – claim values may deviate from expectation due to model risk, caused by improper fitting or lack of granularity. | Update model when more experience is obtained for specific hazards. Constantly monitor claims experience and update models and assumptions with experience. | 
| 4 | Political changes and uncertainty may impact the success of the program. For example, changes in legislations may result in difficulty implementing the program. | Highlight the benefits of the program to government personnel and the wider population. |

&nbsp;

# Data and Data Limitations
## Data source
[2023 SOA Research Challenge](https://www.soa.org/research/opportunities/2023-student-research-case-study-challenge/)

## Data Limitations
Limitations with the data mainly consisted of the lack of granularity of the data as well as a lack of data in general in some areas. More granular data at a claims or accident level rather than an aggregated level would allow for more accurate risk assessments as well as more thorough analysis within each region. For example, further breakdown on the location of homes damaged such as GNAFs or LGA’s as opposed to just region numbers, or a further breakdown of damage costs would allow for more sophisticated models to be built for both voluntary and involuntary displacement costs. 

Further the lack of hazard specific data such as water levels for floods or severity of hurricanes and tropical storms resulted in less sophisticated models predicting accident frequency and severity. Once again, more granular data on the hazards would allow for more accurate models specific to the hazard to be developed.

There is also no data provided regarding the existing insurance market in Storslysia, particularly around home and content insurance and whether or not coverage for natural disaster already exists. If such data was provided, programs could be proposed to work in conjunction with private insurers for more effective insurance options.

The data provided also lacked long term information on population and GDP, with only 3 years of information being provided. This very short-term outlook made it very difficult to make realistic projections over a 20-year period. To address this, simplifying assumptions had to be made which may not be very accurate.

&nbsp;

# Bibliography
* Alexandridis, K., Alexandridis@csiro, K. and Au (n.d.). Monte Carlo Extreme Event Simulations for Understanding Water Quality Change Classifications in the GBR Region MONTE CARLO EXTREME EVENT SIMULATIONS FOR UNDERSTANDING WATER QUALITY CHANGE CLASSIFICATIONS IN THE GBR REGION INTRODUCTION AND METHODOLOGICAL APPROACH. [online] Available at: <https://www.rrrc.org.au/wp-content/uploads/2014/06/497-CSIRO-Alexandridis-K-2008-Monte-Carlo-Extreme-Event-Simulations.pdf [Accessed 25 Mar. 2023]>. (Alexandridis, Alexandridis@csiro and Au, n.d.)

* Andrés, J., Hernando, I., Andersen, P., Craig, S., Dolado, J., Doménech, R., Estrada, A., Mishkin, F., Sastre, T. and Vallès, J. (n.d.). Inflation and economic growth: some evidence for the OECD countries 1. [online] Available at: <https://www.bis.org/publ/confp04p.pdf>. (Andrés et al., n.d.)

* Becker, S.O. and Ferrara, A. (2019). Consequences of forced migration: A survey of recent findings. Labour Economics, 59, pp.1–16. (Becker and Ferrara, 2019)

* Chen, W., Lu, Y., Sun, S., Duan, Y. and Leckebusch, G.C. (2018). Hazard Footprint-Based Normalization of Economic Losses from Tropical Cyclones in China During 1983–2015. International Journal of Disaster Risk Science, 9(2), pp.195–206. (Chen et al., 2018)

* Cook, M. (2023). Flooded Home Buyback Scheme Helps Wash Away the Pain For Queenslanders. [online] PreventionWeb. Available at: <https://www.preventionweb.net/news/flooded-home-buyback-scheme-helps-wash-away-pain-queenslanders?fbclid=IwAR25z8LAzZm-9fnKl7pKN5h1I8m3fxGGcZ2tf5LaoLR4bEVB4cvxCbs0_3k> (Cook, 2023)

* Czajkowski, J., Kunreuther, H., Erwann Michel-Kerjan, Wharton and CoreLogic (2012). A Methodological Approach for Pricing Flood Insurance and Evaluating Loss Reduction Measures. (Czajkowski et al., 2012)

* Doktycz, C., Abkowitz, M., Hiba, Dan and Gilligan, J. (2022). A Hybrid Simulation Approach for Disaster Loss and Damage Projection Under Climate Change. [online] Available at: <https://ir.vanderbilt.edu/bitstream/handle/1803/17874/DOKTYCZ-DISSERTATION-2022.pdf?sequence=1> [Accessed 25 Mar. 2023]. (Doktycz et al., 2022)

* Dyer, C. and Ramirez, B. (2017). Spain: Consorcio charges. [online] Lloyd’s. Available at: <https://www.lloyds.com/resources-and-services/tax-information/latest-information/spain-consorcio-charges?fbclid=IwAR1CpYxP7Y_0o7VEuNwrKB1Zhji5AsdtcKBMmSbxwVSzjylNNpuRLefmJec> (Dyer and Ramirez, 2017)

* Jones, D. and Leong, J. (2010). How to Calculate Risk Margins Under IFRS 2010 Casualty Loss Reserving Seminar. [online] Available at: <https://www.casact.org/sites/default/files/old/clrs_2010_handouts_vr2-leong.pdf> [Accessed 25 Mar. 2023]. (Jones and Leong, 2010)

* Neumayer, E. and Barthel, F. (2010). A Trend Analysis of Normalized Insured Damage from Natural Disasters. (Neumayer and Barthel, 2010)

* World Health Organization (2021). Mental health and forced displacement. [online] World Health Organization. Available at: <https://www.who.int/news-room/fact-sheets/detail/mental-health-and-forced-displacement>. (World Health Organisation, 2021)


