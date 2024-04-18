# Time-series-project
Time Series Research

Reference paper:
https://www.sciencedirect.com/science/article/pii/S0047272720301389 (Uncertainty variables)
https://academic.oup.com/qje/article/131/4/1593/2468873 (VARs model)

Research Question: How the Russian invasion of Ukraine affects the US economy

Background: On 24 February 2022, Russia invaded Ukraine in an escalation of the Russo-Ukrainian War that started in 2014.  
https://en.wikipedia.org/wiki/Russian_invasion_of_Ukraine

Data:
Detrend all variables with Hamilton(2018), deseasonalized wth p=36 and h=12.
We decide to arrange the data in this order:
1.Industrial Production growth rate(Y), Unemployment rate(U), Gas price(P); 2.federal funds rate(I); 3.S&P500 Index(S); 4.uncertainty(uncern).
First Russia declared the invasion or invaded Ukraine, and uncertainty emerged. Then the stock market immediately reacted to this information. Then the Western country banned the sales of gas and derivatives from Russia and the US government adjusted the federal funds rate for these actions. Finally, the US economy reacted to all these changes reflected by the unemployment rate and production and gas price. 

Codebook:
data for uncertainty: (Average or end of period)
VIX data: (still updated)
VIXCLS.xls 
range: 1990.01.02-2024.04.12 
data type: daily
not seasonally adjusted
source: https://fred.stlouisfed.org/series/VIXCLS
OVXCLS.xls (crude oil ETF volatility)
range: 2007.05.10-2024.04.12
data type: daily
not seasonally adjusted
source: https://fred.stlouisfed.org/series/OVXCLS
Newspaper policy uncertainty:
US_Policy_Uncertainty_Data.csv
range: 1985.01-2024.03
data type: Monthly
not seasonally adjusted
source: https://www.policyuncertainty.com/us_monthly.html
Categorical_EPU_Data.csv (not need now)
range: 1985.01-2024.03
data type: Monthly
not seasonally adjusted
source: https://www.policyuncertainty.com/us_monthly.html
note: 
the set of the category
https://www.policyuncertainty.com/categorical_terms.html
Firm subjective sales uncertainty: (ok)1990-2020
sbu_data.csv
range: 2016.09-2024.03
data type: Monthly
not seasonally adjusted
source: https://www.atlantafed.org/research/surveys/business-uncertainty
note: unsmoothed sales growth(business uncertainty)
Model-based macro uncertainty:
MacroUncertaintyToCirculate.csv
range: 1960.07-2023.12
data type: Monthly
not seasonally adjusted
source: https://www.sydneyludvigson.com/macro-and-financial-uncertainty-indexes
note: use the 1/3/12 month ahead forecast
Macro forecast disagreement: spline 
Dispersion_RGDP.csv
range: 1968Q4-2024Q1
data type: Quarterly
not seasonally adjusted
source: https://www.philadelphiafed.org/surveys-and-data/ngdp
note: use RGDP_D2(T), Q3-Q1predcition
read documentation:
https://www.philadelphiafed.org/-/media/frbp/assets/surveys-and-data/survey-of-professional-forecasters/spf-documentation.pdf?la=en&hash=F2D73A2CE0C3EA90E71A363719588D25
data for economy:
S&P500 Index(only have data after 2014)
Efficient Federal Funds Rate:
FREDFUNDS.xls
range: 1954.07-2024.03
data type: monthly
not seasonally adjusted
source: https://fred.stlouisfed.org/series/FEDFUNDS
Unemployment Rate: (Total(first) or manufacturing?)
UNRATENSA.xls
range: 1948.01-2024.03
date type: monthly
not seasonally adjusted
source: https://fred.stlouisfed.org/series/UNRATENSA
Industrial Production: (Total(first) or manufacturing?)
IPB50001.xls
range: 1972.01-2024.02
date type: monthly
not seasonally adjusted
source: https://fred.stlouisfed.org/series/IPB50001N
Global oil pricing index: APSP:
POILAPSPINDEXM.xls
range: 1991.01-2024.02
data type: monthly
not seasonally adjusted
source: https://fred.stlouisfed.org/series/POILAPSPINDEXM
note: it’s the average of Brent, WTI, and Dubai.










