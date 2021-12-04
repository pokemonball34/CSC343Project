SET SEARCH_PATH TO JobMarket;  
-- DROP TABLE IF exists q1 CASCADE;
DROP VIEW IF EXISTS TorontoStatistics CASCADE;  
DROP VIEW IF EXISTS Snapshot2021 CASCADE;  
DROP VIEW IF EXISTS FirstSixMonths CASCADE;
DROP VIEW IF EXISTS LastSixMonths CASCADE;

-- Define views for your intermediate steps here: 

\echo --We would like to see a grand scope of the data as a whole
-- Storing as a view
CREATE VIEW TorontoStatistics AS
SELECT * FROM CityOfTorontoStatistics;

\echo -- We want to capture a snapshot of each year\'s associated data
\echo -- Snapshot of 2019 data
SELECT * 
FROM TorontoStatistics
WHERE year = 2019;

\echo -- Snapshot of 2020 data
SELECT * 
FROM TorontoStatistics
WHERE year = 2020;

\echo -- Snapshot of 2021 data
SELECT * 
FROM TorontoStatistics
WHERE year = 2021;

\echo -- Since COVID-19 came into light in November 2019 and the first major lockdown occured in late March
\echo -- it is interesting to see the data from those 6 months 
CREATE VIEW FirstSixMonths AS
(SELECT *
FROM TorontoStatistics
WHERE year = 2019 AND (month = 'November' OR month = 'December'))
UNION
(SELECT *
FROM TorontoStatistics
WHERE year = 2020 AND (month = 'January' OR month = 'February' OR month = 'March' or month = 'April')
);

\echo -- Brief look on the first six months of the COVID 19 pandemic
SELECT * FROM FirstSixMonths
ORDER BY year, month;

-- Within the first 6 months of the covid 19 pandemic
-- November 2019 had the largest employment rate of 60.2%
-- February 2020 had the largest number of employed toronto residents of 1419000
-- December 2019 had the largest average of working hours at a main job at 36.26 hours
-- November 2019 had the largest percentage of self employed residents at 17.1%
-- Unsurprisingly, April 2020 had the largest percentage of vacant office space at 4%, however the maximum difference is 0.2%
-- April 2020 also had the largest percentage of residents collecting EI sitting at 27340
-- December 2019 also had an astounding 45776 licences renewed (probable cause is end of year so need to investigate further)
-- December 2019 also had the largest number of business bankruptcies sitting at 652
-- December 2019 also had the largest number of new business licences issued 8571
-- December 2019 also had the largest number of toronto homes sold at 32340

--It seems that december is showing up regularly in the extreme maximums so that is a target to investigate further.
SELECT max(employmentRate), max(numOfEmployedCityOfTorontoResidents), max(avgHoursAtMainJob), max(percentageOfSelfEmployedTorontoResidents), max(percentageOfVacantOfficeSpace),
max(numOfEIBeneficiaries), max(numOfBusinessLicencesRenewed), max(numOfBusinessBankruptcies), max(numOfNewBusinessLicencesIssued), max(numOfTorontoHomesSold)
FROM FirstSixMonths;

-- We will now compare December 2019 to December 2020 and see the change for the year
SELECT * FROM TorontoStatistics
WHERE month = 'December' AND employmentRate != 0;


SELECT max(employmentRate), max(numOfEmployedCityOfTorontoResidents), max(avgHoursAtMainJob), max(percentageOfSelfEmployedTorontoResidents), max(percentageOfVacantOfficeSpace),
max(numOfEIBeneficiaries), max(numOfBusinessLicencesRenewed), max(numOfBusinessBankruptcies), max(numOfNewBusinessLicencesIssued), max(numOfTorontoHomesSold)
FROM TorontoStatistics
WHERE month = 'December' AND employmentRate != 0;
\echo -- December 2020 has the largest average number of hours worked at main job at 36.63
\echo -- December 2020 also had the largest percentage of self employed residents at 17.9%
\echo -- December 2020 also had the largest percentage of vacant office space at 7.4%
\echo -- December 2020 also had the larges number of EI beneficiaries
\echo -- December 2021 held the other largest values

-- All Data For January 2021 - June 2021
CREATE VIEW LastSixMonths AS
(SELECT *
FROM TorontoStatistics
WHERE year = 2021 AND employmentRate!=0);

\echo -- Last 6 Months:
SELECT * FROM LastSixMonths;
\echo -- Maximum extremes for the last 6 months:
SELECT max(employmentRate) AS lastSixMonthsEmploymentRateMAX, max(numOfEmployedCityOfTorontoResidents) AS lastSixMonthsEmployedCityOfTorontoResidentsMAX, 
max(avgHoursAtMainJob) AS lastSixMonthsAvgHoursAtMainJobMAX, max(percentageOfSelfEmployedTorontoResidents) AS lastSixMonthsPercentageOfSelfEmployedTorontoResidentsMAX, 
max(percentageOfVacantOfficeSpace) AS lastSixMonthsPercentageOfVacantOfficeSpaceMAX, max(numOfEIBeneficiaries) AS lastSixMonthsNumberOfEIBeneficiariesMAX, 
max(numOfBusinessLicencesRenewed) AS lastSixMonthsNumOfBusinessLicencesRenewedMAX, max(numOfBusinessBankruptcies) AS lastSixMonthsNumOfBusinesssBankruptciesMAX, 
max(numOfNewBusinessLicencesIssued) AS lastSixMonthsNumOfNewBusinessLicencesMAX,  max(numOfTorontoHomesSold) AS lastSixMonthsNumOfTorontoHomesSoldMAX
FROM LastSixMonths;

\echo -- June 2021 had the largest employment Rate of 58.2%
\echo -- April 2021 had the largest number of Employed Toronto Residents at 1369000
\echo -- May 2021 had the largest number of average hours workign at a main job at 36.75hr
\echo -- January 2021 had the largest number of Self Employed Toronto Residents at 17.6% 
\echo -- For the months of April, May and June 2021, this quarter had the highest percentage of vacant office space at 10.2% (Could this mean that more companies are making the transition to working from home?)
\echo -- February 2021 had the largest number of EI beneficiaries at 123890
\echo -- June 2021 had the largest number of business licences renewed at 18856
\echo -- June 2021 had the largest number of business bankruptcies at 196
\echo -- June 2021 had the largest number of new business licences issued at 1887
\echo -- June 2021 also had the largest amount of houses sold at 24198
\echo 
\echo -- Minimum Extremes for the last 6 months:
\echo
SELECT min(employmentRate) AS lastSixMonthsEmploymentRateMIN, min(numOfEmployedCityOfTorontoResidents) AS lastSixMonthsEmployedCityOfTorontoResidentsMIN, 
min(avgHoursAtMainJob) AS lastSixMonthsAvgHoursAtMainJobMIN, min(percentageOfSelfEmployedTorontoResidents) AS lastSixMonthsPercentageOfSelfEmployedTorontoResidentsMIN, 
min(percentageOfVacantOfficeSpace) AS lastSixMonthsPercentageOfVacantOfficeSpaceMIN, min(numOfEIBeneficiaries) AS lastSixMonthsNumberOfEIBeneficiariesMIN, 
min(numOfBusinessLicencesRenewed) AS lastSixMonthsNumOfBusinessLicencesRenewedMIN, min(numOfBusinessBankruptcies) AS lastSixMonthsNumOfBusinesssBankruptciesMIN, 
min(numOfNewBusinessLicencesIssued) AS lastSixMonthsNumOfNewBusinessLicencesMIN,  min(numOfTorontoHomesSold) AS lastSixMonthsNumOfTorontoHomesSoldMIN
FROM LastSixMonths;
\echo -- March 2021 had the lowest employment rate of 56.3%
\echo -- Both January and February 2021 had the lowest amount of employed residents at 1348000
\echo -- February 2021 had the lowest amount of average hours worked at main job at 32.47
\echo -- Both April 2021 and February 2021 have the lowest self-employed-rate at 16%
\echo -- Quarter 1 (January, February, March 2021) has the lowest vacant-office-space-rate at 9.4%
\echo -- June 2021 had the lowest number of EI beneficiaries at 105540
\echo -- January 2021 had the lowest number of business licences renewed at 3400
\echo -- January 2021 had the lowest number of business bankruptcies at 36
\echo -- January 2021 had the lowest number of new business licences issued at 294
\echo -- January 2021 also had the lowest amount of houses sold at 2665
\echo
\echo -- From these extremes, both January 2021, and June 2021 stick out as interesting points so we will now investigate these further.
\echo -- We will now compare January 2019, January 2020, January 2021
\echo
SELECT * FROM TorontoStatistics
WHERE month = 'January';
\echo -- Maximum extremes for January
SELECT max(employmentRate) AS janEmploymentRateMAX, max(numOfEmployedCityOfTorontoResidents) AS janEmployedCityOfTorontoResidentsMAX, 
max(avgHoursAtMainJob) AS janAvgHoursAtMainJobMAX, max(percentageOfSelfEmployedTorontoResidents) AS janPercentageOfSelfEmployedTorontoResidentsMAX, 
max(percentageOfVacantOfficeSpace) AS janPercentageOfVacantOfficeSpaceMAX, max(numOfEIBeneficiaries) AS janNumberOfEIBeneficiariesMAX, 
max(numOfBusinessLicencesRenewed) AS janNumOfBusinessLicencesRenewedMAX, max(numOfBusinessBankruptcies) AS janNumOfBusinesssBankruptciesMAX, 
max(numOfNewBusinessLicencesIssued) AS janNumOfNewBusinessLicencesMAX,  max(numOfTorontoHomesSold) AS janNumOfTorontoHomesSoldMAX
FROM TorontoStatistics
WHERE month = 'January';
\echo -- January 2020 had the largest employment Rate of 59.4%
\echo -- January 2019 had the largest number of Employed Toronto Residents at 1426000
\echo -- January 2021 had the largest number of average hours working at a main job at 36.42hr
\echo -- January 2021 had the largest number of Self Employed Toronto Residents at 17.6% 
\echo -- January 2021 had the highest percentage of vacant office space at 9.4%
\echo -- January 2021 had the largest number of EI beneficiaries at 119670
\echo -- January 2020 had the largest number of business licences renewed at 4124
\echo -- January 2019 had the largest number of business bankruptcies at 60
\echo -- January 2020 had the largest number of new business licences issued at 706
\echo -- Surprisingly January 2021 also had the largest amount of houses sold at 2665
\echo 


\echo -- Minimum extremes for January
SELECT min(employmentRate) AS janEmploymentRateMIN, min(numOfEmployedCityOfTorontoResidents) AS janEmployedCityOfTorontoResidentsMIN, 
min(avgHoursAtMainJob) AS janAvgHoursAtMainJobMIN, min(percentageOfSelfEmployedTorontoResidents) AS janPercentageOfSelfEmployedTorontoResidentsMIN, 
min(percentageOfVacantOfficeSpace) AS janPercentageOfVacantOfficeSpaceMIN, min(numOfEIBeneficiaries) AS janNumberOfEIBeneficiariesMIN, 
min(numOfBusinessLicencesRenewed) AS janNumOfBusinessLicencesRenewedMIN, min(numOfBusinessBankruptcies) AS janNumOfBusinesssBankruptciesMIN, 
min(numOfNewBusinessLicencesIssued) AS janNumOfNewBusinessLicencesMIN,  min(numOfTorontoHomesSold) AS janNumOfTorontoHomesSoldMIN
FROM TorontoStatistics
WHERE month = 'January';
\echo -- January 2021 had the lowest employment rate of 57.4%
\echo -- January 2020 had the lowest number of employed toronto residents at 1255000
\echo -- January 2019 had the lowest number of average hours working at a main job at 35.59hr
\echo -- January 2020 had the lowest number of self employed toronto residents at 15% 
\echo -- January 2020 had the lowest percentage of vacant office space at 3.8%
\echo -- January 2019 had the lowest number of EI beneficiaries at 20680
\echo -- January 2021 had the lowest number of business licences renewed at 3400 
\echo -- January 2021 had the lowest number of business bankruptcies at 36
\echo -- January 2021 had the lowest number of new business licences issued at 294
\echo -- Surprisingly January 2019 also had the lowest amount of houses sold at 1422
\echo 
\echo -- Minimum Extremes for the last 6 months:
\echo







\echo -- We will now compare June 2019, June 2020, June 2021
\echo
SELECT * FROM TorontoStatistics
WHERE month = 'June';
\echo -- Maximum extremes for June
SELECT max(employmentRate) AS junEmploymentRateMAX, max(numOfEmployedCityOfTorontoResidents) AS junEmployedCityOfTorontoResidentsMAX, 
max(avgHoursAtMainJob) AS junAvgHoursAtMainJobMAX, max(percentageOfSelfEmployedTorontoResidents) AS junPercentageOfSelfEmployedTorontoResidentsMAX, 
max(percentageOfVacantOfficeSpace) AS junPercentageOfVacantOfficeSpaceMAX, max(numOfEIBeneficiaries) AS junNumberOfEIBeneficiariesMAX, 
max(numOfBusinessLicencesRenewed) AS junNumOfBusinessLicencesRenewedMAX, max(numOfBusinessBankruptcies) AS junNumOfBusinesssBankruptciesMAX, 
max(numOfNewBusinessLicencesIssued) AS junNumOfNewBusinessLicencesMAX,  max(numOfTorontoHomesSold) AS junNumOfTorontoHomesSoldMAX
FROM TorontoStatistics
WHERE month = 'June';
\echo -- June 2019 had the largest employment rate of 61.8%
\echo -- June 2019 had the largest number of employed residents at 1426000
\echo -- June 2021 had the largest number of hours worked at a main job at 36.63hr
\echo -- June 2020 had the largest percentage of self employed toronto residents at 18.4%
\echo -- June 2021 had the largest percentage of vacant office space at 10.2%
\echo -- June 2021 had the largest number of EI beneficiaries at 105540
\echo -- June 2019 had the largest number of business licences renewed at 23881
\echo -- June 2019 had the largest number of business bankruptcies at 360
\echo -- June 2019 had the largest number of new business licences issued at 4441
\echo -- June 2021 had the largest number of homes sold at 24198
\echo -- Minimum extremes for June
SELECT min(employmentRate) AS junEmploymentRateMIN, min(numOfEmployedCityOfTorontoResidents) AS junEmployedCityOfTorontoResidentsMIN, 
min(avgHoursAtMainJob) AS junAvgHoursAtMainJobMIN, min(percentageOfSelfEmployedTorontoResidents) AS junPercentageOfSelfEmployedTorontoResidentsMIN, 
min(percentageOfVacantOfficeSpace) AS junPercentageOfVacantOfficeSpaceMIN, min(numOfEIBeneficiaries) AS junNumberOfEIBeneficiariesMIN, 
min(numOfBusinessLicencesRenewed) AS junNumOfBusinessLicencesRenewedMIN, min(numOfBusinessBankruptcies) AS junNumOfBusinesssBankruptciesMIN, 
min(numOfNewBusinessLicencesIssued) AS junNumOfNewBusinessLicencesMIN,  min(numOfTorontoHomesSold) AS junNumOfTorontoHomesSoldMIN
FROM TorontoStatistics
WHERE month = 'June';
\echo -- June 2020 had the lowest employment rate of 53.4%
\echo -- June 2020 had the lowest number of employed residents at 1255000
\echo -- June 2019 had the lowest number of hours worked at a main job at 36.41hr
\echo -- June 2021 had the lowest percentage of self employed toronto residents at 16.2%
\echo -- June 2020 had the lowest percentage of vacant office space at 4%
\echo -- June 2019 had the lowest number of EI beneficiaries at 15140
\echo -- June 2020 had the lowest number of business licences renewed at 15423
\echo -- June 2021 had the lowest number of business bankruptcies at 196
\echo -- June 2020 had the lowest number of new business licences issued at 1707
\echo -- June 2020 had the lowest number of homes sold at 12208
\echo
\echo -- Finally, we will look at all extremes between January 2019 and June 2021
SELECT * FROM TorontoStatistics;
\echo -- Maximum extremes
SELECT max(employmentRate) AS EmploymentRateMAX, max(numOfEmployedCityOfTorontoResidents) AS EmployedCityOfTorontoResidentsMAX, 
max(avgHoursAtMainJob) AS AvgHoursAtMainJobMAX, max(percentageOfSelfEmployedTorontoResidents) AS PercentageOfSelfEmployedTorontoResidentsMAX, 
max(percentageOfVacantOfficeSpace) AS PercentageOfVacantOfficeSpaceMAX, max(numOfEIBeneficiaries) AS NumberOfEIBeneficiariesMAX, 
max(numOfBusinessLicencesRenewed) AS NumOfBusinessLicencesRenewedMAX, max(numOfBusinessBankruptcies) AS NumOfBusinesssBankruptciesMAX, 
max(numOfNewBusinessLicencesIssued) AS NumOfNewBusinessLicencesMAX,  max(numOfTorontoHomesSold) AS nNumOfTorontoHomesSoldMAX
FROM TorontoStatistics;
\echo -- July 2019 had the largest employment rate at 62.2%
\echo -- July 2019 had the largest number of employed residents at 1435000
\echo -- May 2020 has the largest number of hour worked at a main job at 37.34hr
\echo -- Both August and September have the largest percentage of self employed residents at 18.5%
\echo -- Q2 2021 (April, May, June 2021) have the largest percentage of vacant offic space at 10.2%
\echo -- February 2021 had the largest number of EI beneficiaries at 123890
\echo -- December 2019 had the largest number of business licences renewed at 45776
\echo -- December 2019 had the largest number of business bankrupticies at 652
\echo -- December 2019 had the largest number of new business licences issued at 8571
\echo -- December 2019 had the largest number of toronto homes sold at 32340
\echo
\echo -- Minimum extremes
SELECT min(employmentRate) AS EmploymentRateMIN, min(numOfEmployedCityOfTorontoResidents) AS EmployedCityOfTorontoResidentsMIN, 
min(avgHoursAtMainJob) AS AvgHoursAtMainJobMIN, min(percentageOfSelfEmployedTorontoResidents) AS PercentageOfSelfEmployedTorontoResidentsMIN, 
min(percentageOfVacantOfficeSpace) AS PercentageOfVacantOfficeSpaceMIN, min(numOfEIBeneficiaries) AS NumberOfEIBeneficiariesMIN, 
min(numOfBusinessLicencesRenewed) AS NumOfBusinessLicencesRenewedMIN, min(numOfBusinessBankruptcies) AS NumOfBusinesssBankruptciesMIN, 
min(numOfNewBusinessLicencesIssued) AS NumOfNewBusinessLicencesMIN,  min(numOfTorontoHomesSold) AS NumOfTorontoHomesSoldMIN
FROM TorontoStatistics WHERE employmentRate != 0;
\echo -- June 2020 had the lowest employment rate at 53.4%
\echo -- June 2020 had the lowest amount of employed toronto residents at 1255000
\echo -- April 2019 had the lowest amount of average hours worked at main job 31.03hr
\echo -- February 2020 had the lowest percentage of self employed toronto residents 14.8%
\echo -- Quarter 1 2020 (January, February, March 2020) had the lowest percentage of vacant office space 3.8%
\echo -- September 2020 had the lowest number of EI beneficiaries at 5650 (the following month there was rough increase of 1540% increase likely due to CERB)
\echo -- January 2021 had the lowest number of business licences renewed at 3400
\echo -- January 2021 had the lowest number of business bankruptcies at 36
\echo -- January 2021 had the lowest number of business licences issued at 294
\echo -- January 2019 had the lowest number of toronto homes sold at 1422
\echo
