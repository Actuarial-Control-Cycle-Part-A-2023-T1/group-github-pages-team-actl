![](climate-change-facts-header-wide.gif)

# 2023 ACTL4001 SOA Challenge Showcase
The University of New South Wales

Team ACTL

Team Members: Ishraq Ifaz, Jim Kwon, Maria Zhang, Michelle Xie, Winnie Su

&nbsp;

# Table of Contents 
- [Project Overview](#project-overview)
- [📊 Exploratory Data Analysis](#exploratory-data-analysis)
  * [📈 Initial Exploration of Historical Event Data](#initial-exploration-of-historical-event-data)
- [🔣 Data Preparation](#data-preparation)
  * [Historical Data Normalisation](#historical-data-normalisation)
  * [Inflation Modelling](#inflation-modelling)
  * [Population Projection](#population-projection)
  * [GDP Modelling](#gdp-modelling)
  * [Graphical Impact of Normalisation](#graphical-impact-of-normalisation)

- [📃 Modelling Methodology](#---modelling-methodology)
- [🎯 Purpose and Objectives](#---purpose-and-objectives)
- [📑 Program Design](#---program-design)
  * [1. Buyback Scheme – Voluntary Relocation](#1-buyback-scheme---voluntary-relocation)
  * [2. Incentives and Considerations of the Buyback Scheme](#2-incentives-and-considerations-of-the-buyback-scheme)
  * [3. Hazard Insurance Coverage](#3-hazard-insurance-coverage)
  * [4. Requirements of Claimants](#4-requirements-of-claimants)
  * [5. Other Features](#5-other-features)
  * [6. Evaluation Timeframes](#6-evaluation-timeframes)
- [🔎 Assumptions](#---assumptions)
- [💵 Pricing & Costs](#---pricing---costs)
  * [Methodology](#methodology)
  * [Costs without the program](#costs-without-the-program)
  * [Cost with the program](#cost-with-the-program)
    + [Buyback Scheme](#buyback-scheme)
    + [Emergency Hazard Insurance](#emergency-hazard-insurance)
    + [Property Damage Costs](#property-damage-costs)
    + [Breakdown of Insurance Costs](#breakdown-of-insurance-costs)
    + [Revenue](#revenue)
    + [Capital Required](#capital-required)
- [❗ Risk and Risk Mitigation Considerations](#--risk-and-risk-mitigation-considerations)
  * [Quantitative Risks & Sensitivity Analysis](#quantitative-risks---sensitivity-analysis)
  * [Qualitative Risks and Mitigations](#qualitative-risks-and-mitigations)
- [📝 Data and Data Limitations](#---data-and-data-limitations)
- [Bibliography](#bibliography)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

# Project Overview

This page showcases the process and results for developing a social insurance program for Storslysia in order to address the worsening climate situation. Our solution addresses both voluntary relocation costs through a buyback scheme and involuntary costs through a hazard insurance program. The showcase will provide comprehensive detail on the design of the program as well as the calculation of revenue and costs associated with the program. Moreover, due to the highly volatile nature of catastrophes and climate risk, the report also investigates further risks through a sensitivity analysis where several factors affecting the frequency and severity of catastrophes aggravate at a higher level than expected.


# 📊 Exploratory Data Analysis

Data Provided by SOA:



* Historical Hazard Event Data
* Economic and Demographic Data
* SSP Emissions Scenarios


## 📈 Initial Exploration of Historical Event Data
Historical Event Data



### Region 1 


![Region 1 Total Damage Per Year](https://user-images.githubusercontent.com/113433441/228707074-2de5054e-e636-4491-8439-599139447b87.png)


### Region 2 


![Region 2 Total Damage Per Year](https://user-images.githubusercontent.com/113433441/228707119-2d3cc1df-165f-44d7-8853-9c1b93db815b.png)


### Region 3 


![Region 3 Total Damage Per Year](https://user-images.githubusercontent.com/113433441/228707162-9dba70d8-ba92-4a78-8e80-60eaa8e5dc45.png)


### Region 4


![Region 4 Total Damage Per Year](https://user-images.githubusercontent.com/113433441/228707204-88cdde81-dd0a-4eae-b1e1-75e485c92e65.png)


### Region 5 


![Region 5 Total Damage Per Year](https://user-images.githubusercontent.com/113433441/228707238-d4e32dc7-edb9-4460-bb25-fb117333f7b9.png)


### Region 6 


![Region 6 Total Damage Per Year](https://user-images.githubusercontent.com/113433441/228707275-4501e625-246b-4e13-b3e4-1426253218d8.png)


**Key Conclusions of EDA**



* There was only a total of 3366 disasters over 60 years, which is insufficient data for certain types of machine learning methods.
* Region 2 has the highest property damage over the last 60 years, stemming from extremely large disaster in 1989.
* Hazard data is typically high severity and low frequency for all 6 regions. 
* Summary Statistics presented in the table below: 

| Region | Count of Events | Average damage per event | Total damage |
|---|---|---|---|
| 1 | 618 | 1,387,526 | 857,491,111  |
| 2 | 787 | 16,472,578 | 12,963,919,193 |
| 3 | 781 | 1,847,967 | 1,443,261,916 |
| 4 | 508 | 2,109,433 | 1,071,592,056 |
| 5 | 424 | 7,861,843  | 3,333,421,586 |
| 6 | 248 | 715,035  | 177,328,726  |

# 🔣 Data Preparation 


## Historical Data Normalisation

Our team prepared the Historical Hazard Event data for modelling by normalising the historical event data. Normalisation adjusts for the fact that if a hazard event of equal strength was to happen in the present, it will typically cause more damage than it had in past years because of wealth accumulation over time.

Normalisation adjusts nominal economic loss from past disasters upwards by multiplying past damage with a factor for inflation, for population growth and for growth in wealth per capita (GDP), thus in effect estimating the damage a past hazard event would have caused had it hit the same, but nowadays wealthier, area today. Loss normalisation therefore provides a more accurate measure of the economic loss value of a hazard in the future. All Property damage losses were normalised to 2020 for analysis.


![image](https://user-images.githubusercontent.com/113433441/228734835-77363404-9ab0-4101-a792-3bfb24b55ee1.png)



## Inflation Modelling 

Dollar values of property damage must be adjusted for inflation to 2020 dollar terms. The following process was utilised to clean inflation data. 


## Population Projection 


## GDP Modelling 

## Graphical Impact of Normalisation

The impact of normalisation on the histogram for each region is presented in the figures below. It is evident that normalising by inflation, GDP and Population leads to the best results. 

### Region 1:


![image](https://user-images.githubusercontent.com/113433441/228707940-ab5ad6e9-2221-4a1a-88f4-296a7d4021dd.png)

### Region 2:


![image](https://user-images.githubusercontent.com/113433441/228707998-88df1301-98bb-4b45-9106-6177b2c86763.png)


### Region 3 


![image](https://user-images.githubusercontent.com/113433441/228708053-c177afb6-428c-46d4-b7a7-a6f897c55bef.png)


### Region 4


![image](https://user-images.githubusercontent.com/113433441/228708118-7d2df720-99f9-4620-a8bd-02580bc0ff03.png)


### Region 5


![image](https://user-images.githubusercontent.com/113433441/228709117-55f0b0bd-7521-4ad2-a7c8-22e3347c9be0.png)


### Region 6


![image](https://user-images.githubusercontent.com/113433441/228734901-af091851-511a-4d9c-b770-f859319110c9.png)

# 📃 Modelling Methodology 

# 🎯 Purpose and Objectives
Natural disasters are an inescapable fact of life for those living in Storslysia. Because of this, an effective natural disaster insurance scheme is of utmost importance. Currently, there is a lack of protection against natural disasters, which necessitates government intervention. The newly proposed Social Insurance Program seeks to determine the most effective model for Storslysia’s population providing a social insurance scheme covering both involuntary and voluntary displacement. Coverage is countrywide and addresses voluntary, proactive relocation as well as involuntary displacement following a catastrophic event.   

The primary objective of the program is to manage Storslysia’s exposure to financial impacts caused by catastrophic climate related events. Whilst complete prevention of climate catastrophes may not be possible, the program’s main objective remains to minimise the impact of the damages to citizens. Sufficient claims reserving must be kept ensuring feasibility of the program. Analysis of change in expected liabilities and expected vs actual cost analysis, as more experience develops will be some of the key metrics that will need to be closely monitored and investigated frequently to ensure the financial sustainability of the program.

To report on these metrics, the program will publish annual reports highlighting the number of citizens receiving financial assistance, the amount of compensation provided, and the program’s effectiveness in helping citizens recover from the financial impacts of these events. Additionally, the program will periodically review its metrics to ensure that they are still relevant and aligned with the objectives. The program will continually seek feedback from citizens, and industry partners to identify areas for improvement and to ensure that the program is meeting its objectives.

&nbsp;

# 📑 Program Design 

The program aims to address Storslysia’s exposure to displacement risk through two key components. The first focuses on actions targeted at proactive voluntary relocation facilitated by a voluntary buyback scheme. The second component comprises of a hazard insurance program addressing involuntary displacement for those directly affected by climate catastrophes. Claim payouts for this hazard insurance program are designed to alleviate financial pressures associated with property damage, replacement accommodation and other costs. 

## 1. Buyback Scheme – Voluntary Relocation
The first step of the plan aims to address voluntary relocation as a preventative measure through a buyback scheme. Individuals positioned in areas within each region that are deemed very high risk and in imminent danger will be offered a one-off option for their property to be purchased at pre-disaster affected prices by the Storslysia government through a buyback to aid in relocations to safer environments. The payment will be a lump sum to purchase their existing property, where the price will be agreed upon by both the government administrators and the property owners. Note that only properties in areas identified as high risk will be permitted to undertake the buyback program. Individuals will not be allowed to relocate existing high risk locations and instead must relocate to areas that are deemed safer. Individuals will be given a timeframe of 1 year to apply for the buy-back scheme and allowed sufficient time to organise movement as needed. 

## 2. Incentives and Considerations of the Buyback Scheme
The voluntary buyback scheme offers households living in extreme risk areas the incentive to relocate to a safer area as they will be given the opportunity to sell their property at the market value pre-disaster. Typically, post natural disaster many properties in disaster impacted areas become unsellable or extremely low in value, leaving homeowners socially and financially stuck with no options. Thus, this program will enable these people to retain their asset value and use the funds to move elsewhere. Similar programs have been run in Australia with great success (e.g., [Queensland’s Voluntary Home Buyback](https://www.preventionweb.net/news/flooded-home-buyback-scheme-helps-wash-away-pain-queenslanders?fbclid=IwAR25z8LAzZm-9fnKl7pKN5h1I8m3fxGGcZ2tf5LaoLR4bEVB4cvxCbs0_3k)). The voluntary buyback scheme also offers policyholders a lengthy time window of 1 year to prepare for relocation. The government recognises that relocation may result in various negative effects on individual’s mental wellbeing (see below), however we have deemed this the best option for high-risk individuals whose lives may potentially be a risk.

> ***Post Relocation Issues***
>
> Studies have shown a significant component of frictional unemployment occurs as a direct result of involuntary relocation. This is an issue that Storslysia could address as a part of its relocation scheme. Suggested assistance may come in the form of unemployment benefits or other forms of financial aid. Studies have also shown relocations cause a significant impact on mental well beings of those forced to relocate. ‘The Contemporary refugee crisis’ saw about one third of displaced persons experiencing high rates of depression, anxiety, and social separation as a direct result of relocation which often leads to significantly lower quality of life in later life. Treatment for these affected individuals have shown to help, however generally do not have a huge benefit. 
> 
> A [research paper by the WHO](https://www.who.int/news-room/fact-sheets/detail/mental-health-and-forced-displacement) also showed “significantly heightened risk of developing depression, anxiety, suicidal ideation and substance use problems” amongst children who were forced to leave their homes. It also showed significant increases of the presence of racial abuse and social disassociation amongst individuals relocating to new foreign locations. 

Due to the potential costs and issues associated with relocations, the buybacks should be a one off as opposed to an ongoing system. Only those identified areas as extremely high risk will be eligible to sell their property to the government. Further iterations of buybacks should only be considered in the event of a very severe catastrophe or as a result of a thorough reassessment of catastrophe risk. 

## 3. Hazard Insurance Coverage
The second component that is planned to address the ongoing costs of climate related loss is the hazard insurance program. The program is intended to help cover the costs associated with repairing or rebuilding damaged property, as well as covering the costs of temporary housing or relocation expenses in the case of natural disaster. Importantly, the claims will only be covered if the Storslysian government has defined the event as a climate catastrophe. For fairness, all citizens will be permitted to make a claim, regardless of their income. However, it's important to note that the program also has some limitations. The program may not cover damages that were caused by human error, negligence, or intentional actions, such as arson or vandalism. The program also will not cover damages for vehicles, bodily injuries, or personal belongings. It is therefore recommended that individuals also obtain private insurance to supplement their coverage. 

## 4. Requirements of Claimants
For individuals seeking to claim benefits from this social insurance program, there are several requirements that must be met. Firstly, claimants must reside in the affected region of the climate catastrophe and must provide evidence showcasing damage directly linked to this event. Finally, claimants must submit their claim within a specified time frame and comply with any additional requirements or requests for information from the program administrators. If a payout is made to repair or rebuild, claimants will be required to show that they have taken steps to prevent similar damages, if possible, in the future. By meeting these requirements, claimants can access the benefits provided by the program to help recover from the financial impacts of climate-related damages to their property.

## 5. Other Features
The program will boast a simple and quick claim process for individuals to receive some compensation for their property damage as soon as possible. Much similar to the Australian Governments flood payments, citizens will have easy access to the claim process via a mobile app, and by answering a few quick questions will get access to compensation. The app and online tools will allow for a more streamlined claims process, individuals can focus on rebuilding their lives without worrying about complicated procedures.

Additionally, the program will implement additional education or workshops on how to prepare for and respond to climate catastrophes. The program will include initiatives to educate the public on emergency preparedness, evacuation plans, and disaster response strategies. By raising awareness and providing guidance, individuals can be better equipped to handle climate catastrophes and minimize their impact.

## 6. Evaluation Timeframes
There needed to be a reliable estimate of the program’s effectiveness and impact over both the short and long term. Five years is a reasonable amount of time to assess the initial outcomes of the program and the buyback scheme and make any adjustments based on the events and data gathered. Twenty years, on the other hand, provides a longer-term perspective on the programs performance and enables trend identification or patterns which may have emerged. 

Secondly, the choice of five and twenty years aligns with typical timelines of climate change impacts. The frequency of climate-related catastrophes such as cyclones, floods, wildfires can drastically change over a short period of time. By evaluating the program at five and twenty years, we can assess whether our insurance program is keeping up with the evolving nature of climate change impacts and adjusting accordingly. Lastly, conducting evaluations at five and twenty years also allows us to demonstrate our commitment to transparency and accountability to our stakeholders, including policyholders, investors, and regulators.

&nbsp;

# 🔎 Assumptions 

| Modelling Assumptions | Rationale |
| ------------- | ------------- |
| Natural disaster frequency and severity will follow the same distribution as historical data over the next 5- 20 years. | The impacts of climate change are likely to impact the severity and frequency of natural disasters in the much longer term than relevant for policy analysis (i.e 50 - 100 years later). We have performed sensitivity analysis in the case this is not true. | 
| Storslysia GDP as a percentage of Global GDP stays constant. | Only 2 years of GDP was provided, assumption was required to project GDP. |
| Storslysia population as a percentage of Global population stays constant. | Only 3 years of population was provided, assumption was required to project population. |
| Storslysia GDP is forecasted using a linear regression model with population as a regressor. | Based on historical data, a relative linear relationship between GDP and population was seen. Thus, the national GDP was forecasted using the estimated population figures. |
| More recent years of injuries and fatalities were given a higher weighting. | Accidents that have occurred more recently are likely to be better predictors of future accidents. | 
| Accidents resulting in fatalities were given a higher weighting compared to injuries. | Accidents resulting in death are likely to be more disastrous than accidents resulting in injuries. | 

| Program Assumptions | Rationale | 
| ------------- | ------------- |
| Existing property insurance excludes coverage for extreme catastrophe damage. | Many countries tend to exclude climate disaster coverage in insurance policies. No data provided about existing insurance coverage in Storslysia. 
| Populations identified as eligible for the buyback program will accept and undertake voluntary relocation. | These populations are typically at extreme risk and are willing to reduce their climate risk given the opportunity. Past cases and studies have also shown a very high acceptance of voluntary buybacks. | 
| Those populations identified as high risk for the buyback program correspond to historical extreme property damage costs. | Historical extreme property damage costs can be indicative of high severity or frequency of climate catastrophes affecting these populations. | 
| 10% cost of capital applied over 20 year horizon for program. | Information on financial performance of government was not provided and thus a historical similar programs Cost of Capital was used. | 

&nbsp;

# 💵 Pricing & Costs

## Methodology 
Due to the relatively infrequent nature of natural hazards, historical data for the extreme events is relatively scarce. As such, a probabilistic approach is typically the most appropriate way to handle natural hazard phenomena. 
Given Storslysia’s historical data for the last 60 years, property damage costs were first normalised to 2020 values with inflation, population, and GDP (See Appendix A). Taking the logarithm of property damage costs, an appropriate distribution was fitted to the historical property damage. For each region, Monte Carlo simulation was then used to project hazards and the associated property damage cost.

## Costs without the program 
Under the assumption that hazards will develop under the same frequency and severity as historical events, the mean total cost of property damage over all 6 Regions for 5 years is Ꝕ6,505,385,068. Over the long term (20 years) the total costs will be Ꝕ45,688,293,287. Within each region, the “normalised” total property damage and key statistics are shown in Table 1 along with the uncertainty.

<img width="650" alt="image" src = "https://user-images.githubusercontent.com/81789358/229357854-d4cdca7d-4cd3-4c51-a2b9-6479b00d0c98.png">

It is evident that Region 2 will have the highest property damage cost in the next few years (up to 80% of total damage). This is due to the significant higher population and house prices skewing more to the higher ends. The occurrence of natural disaster catastrophes is also the highest in region 2 with many coastal disasters, hail, and flooding. 
It is notable that volatility for damage estimates for each region is quite high for most regions. This is because climate disasters are extremely volatile and unpredictable, making volatility a key risk in climate forecasting and modelling. We have considered this volatility in our program. 

## Cost with the program 
### Buyback Scheme
Sufficient reserves must be established to be able to repurchase properties for the buyback program. The reserves were estimated by assessing the percentage of houses considered as “very high-risk” for each region with historical data. The grand total of reserves required for all of Storslysia is Ꝕ4,090,476,539. Note that this is the cost of all the at-risk properties, under the assumption that everyone will accept the buyback.

| Region 1 | Region 2 | Region 3 | Region 4 | Region 5 | Region 6 | Total |
| --- | --- | ---- | ---- | ---- | ---- | ----- |
| 440,879,170 | 1,899,479,015 | 658,770,612 | 175,219,043 | 777,465,776 | 138,662,922 | 4,090,476,539 |


### Emergency Hazard Insurance 
Since the buyback program will be a one-off initiative proposed to be completed over the next year, costs specified hereafter will address the ongoing hazard insurance program unless specified. 

### Property Damage Costs
With the buyback program implemented, high risk individuals have been relocated to safer areas and no longer vulnerable to extremely large damages from climate disasters. As such, within each region the distribution for property damage will shift left, as well as a reduction in standard deviation. In Figure 1, the red histogram represents log of property damage prior to the buyback, and the blue histogram represents the log of property damage post buyback. With the new distribution, new costs for Storslysia were simulated.

<img width="380" alt="image" src="https://user-images.githubusercontent.com/81789358/229357040-d5c8d206-e94d-4bdd-9172-78e65f49916d.png">

We have also considered admin, handling, and temporary housing costs for those who require additional assistance while property damage is being repaired or retrofitted post disaster. The summary of the program costs is summarised in Table 3. 
Considering only the cost of the climate damage as compared to without the program, it is evident that estimated value of property damage is significantly lower, up to 70% lower (3.24 billion with the program compared to 6.51 billion without program). Further, the volatility associated with the climate cost estimates has also reduced by around 3 folds, demonstrating the benefit of the buyback initiative. However, we acknowledge the volatility is still quite high given the unpredictable nature of climate disasters. This is a key risk that would need to be managed, which we have proposed a funding strategy for in section 5.3.2.3. Alternatively, the government may look into reinsurance or catastrophe bonds in order to mitigate such uncertainty and risks. 

<img width="650" alt="image" src="https://user-images.githubusercontent.com/81789358/229357072-61649c0c-1246-490e-85ea-97ab1ebd3d7a.png">

### Breakdown of Insurance Costs
As required by the program, the total costs of the program remain well within the limit of 10% of GDP over the next 20 years. The uncertainty range shows that there is a 95% confidence that the program costs will not exceed 5% of GDP in any given year. Note the higher value in the year 2021, which includes the additional cost of the buyback program.

<img width="350" alt="image" src="https://user-images.githubusercontent.com/81789358/229357111-cf47b9c3-4cfc-4531-a459-e95de8bda600.png">

### Revenue 
Our team has proposed a potential funding system that could be used for this program, inspired by the Spanish “Consorcio charge”. This system would require the working population to pay a fixed yearly surcharge based on region of residence, which is enough to cover the central estimate of climate property damage over that region. The government should then cover for anything that deviates above the central estimate (given high volatility). For example, a value that could be up to the 95th percentile of the damage cost. 

### Capital Required
The capital required for the next 20 years will be Ꝕ20,489,807,973 to cover for the whole of Storslysia. Assuming a constant risk-free rate over the next 20 years and 10% cost of capital, this converts to a risk margin Ꝕ 8,278,917,968 required today. This capital requirement was chosen with a 95% certainty that it will be sufficient to cover property damage over the next 20 years. 

| Regions | Estimated Total Cost | 95th Percentile Damage Cost | Capital Required |
| :-- | --- | --- | --- |
| 1 | 1,490,336,252 | 2,322,245,935 | 831,909,683 |
| 2 | 9,830,435,330 | 24,873,441,904 | 15,042,956,574 |
| 3 | 2,140,965,868 | 4,930,681,880 | 2,789,716,012 |
| 4 | 667,732,166 | 1,139,321,034 | 471,588,867 |
| 5 | 851,241,276 | 1,861,229,548 | 1,009,988,272 |
| 6 | 391,913,148 | 735,561,713 | 343,648,565 |
| Total | 13,214,605,623 |  | 20,489,807,973 |

&nbsp;

# ❗ Risk and Risk Mitigation Considerations

## Quantitative Risks & Sensitivity Analysis
### SPCC Scenarios and Impact on Costs
A key assumption made was that natural disaster frequency and severity will follow the same distribution as historical data over the foreseeable 20-year period. However, a risk is that climate change could potentially have a much larger impact on frequency and severity of hazards in Storslysia than predicted. Scenario analysis has been performed under the 4 potential emission scenarios and how it could impact costs of hazard insurance, under the assumption that increasing carbon emissions directly impacts the frequency of natural hazards.

<img width="550" alt="image" src="https://user-images.githubusercontent.com/81789358/229358213-fba78d5a-5c7f-458f-94af-8a2505455671.png">

The impact of higher emissions leads to more frequent events is that property Damage Costs are much higher and more frequent. As such, the volatility of the natural disasters also increases, as we notice that the very high emissions case has larger peaks and troughs compared to the base assumption case.

<img width="371" alt="image" src="https://user-images.githubusercontent.com/81789358/229360721-f097ccae-32ed-43a2-b610-7df103ab7f78.png">

Academic research has not yet been able to quantify the direct impact of climate change on the frequency and severity of natural disasters. As such, it will be a key component of the program to continuously monitor the development of natural disasters and adjust data and assumptions as necessary.

### Variations in Inflation and GDP Predictions and their Impact on Cost
Since the accuracy of the claim costs prediction heavily relies on the accuracy of inflation, GDP and population forecasts, sensitivity analysis for each was conducted to gain a holistic view on potential financial impacts if the actual figures do not align with expectation.

<img width="800" alt="Screen Shot 2023-04-03 at 12 48 47 am" src="https://user-images.githubusercontent.com/81789358/229360578-76f12ccf-32e9-4f2f-9fa2-559a6f661283.png">

The figure above suggests that if the inflation over the next five years is 5% higher than the forecast every year, then the claim costs in 2025 would increase by 0.49%. On the other hand, the future values of claim costs are calculated based on a linear function of GDP and population. Thus, as GDP and population figures vary from the predictions, the impact on claim costs is scaled by the compounded variation between the realised and the base line figures. For instance, if GDP is always 2.5% higher than the estimation, then the claims costs in 2025 would increase by 13.14%.

The analyses imply it is unfavourable if the actual prints of those economic figures are higher than expected as claim costs would be inflated. The desired result is when actual GDP figures are within 2.5% of base line estimation so the claim costs are manageable in the long run. However, given the negative relationship between economic growth and inflation ([Andrés and Hernando](https://www.bis.org/publ/confp04p.pdf)), it is not too concerning as the impact of higher inflation is likely to be offset by lower-than-expected GDP growth.

## Qualitative Risks and Mitigations

|   | Risk | Mitigation | 
| ------------- | ------------- | ------------- |
| 1 | The model assumes that all policyholders that are eligible for voluntary buyback program will take the offer. However, if certain households refuse to undertake the buyback and relocate, then there would be a significant impact on claim costs as there will be more claims with high severity. | Conduct community outreach and education programs to help raise awareness about the buyback scheme and explain the benefits. Hold extra reserves in the case that certain properties cannot be convinced. | 
| 2 | Program costs from natural disasters may deviate highly from estimates as climate hazards are extremely volatile. | Have high reserves and capital in the case of an extreme event. Undertake reinsurance with a climate reinsurer or introduce a natural disaster pool. Monitor disasters frequently and update models when disaster occurs. | 
| 3 | Model risks – claim values may deviate from expectation due to model risk, caused by improper fitting or lack of granularity. | Update model when more experience is obtained for specific hazards. Constantly monitor claims experience and update models and assumptions with experience. | 
| 4 | Political changes and uncertainty may impact the success of the program. For example, changes in legislations may result in difficulty implementing the program. | Highlight the benefits of the program to government personnel and the wider population. |

<img width="401" alt="image" src="https://user-images.githubusercontent.com/81789358/229360608-4aa325d5-8c7d-499e-a161-5e8be3a5aa64.png">

&nbsp;

# 📝 Data and Data Limitations
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


