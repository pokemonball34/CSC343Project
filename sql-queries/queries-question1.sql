SET SEARCH_PATH TO JobMarket;  
-- DROP TABLE IF exists q1 CASCADE;
DROP VIEW IF EXISTS TorontoStatistics CASCADE;  
DROP VIEW IF EXISTS Snapshot2021 CASCADE;  
DROP VIEW IF EXISTS FirstSixMonths CASCADE;
  
-- Define views for your intermediate steps here: 

--We would like to see a grand scope of the data as a whole
-- Storing as a view
CREATE VIEW TorontoStatistics AS
SELECT * FROM CityOfTorontoStatistics;

-- We want to capture a snapshot of each year's associated data
-- Snapshot of 2019 data
SELECT * 
FROM TorontoStatistics
WHERE year = 2019;

-- Snapshot of 2020 data
SELECT * 
FROM TorontoStatistics
WHERE year = 2020;

-- Snapshot of 2021 data
SELECT * 
FROM TorontoStatistics
WHERE year = 2021;

-- Since COVID-19 came into light in November 2019 and the first major lockdown occured in late Marc
-- it is interesting to see the data from those 6 months 
CREATE VIEW FirstSixMonths AS
(SELECT *
FROM TorontoStatistics
WHERE year = 2019 AND (month = 'November' OR month = 'December'))
UNION
(SELECT *
FROM TorontoStatistics
WHERE year = 2020 AND (month = 'January' OR month = 'February' OR month = 'March' or month = 'April')
);

-- Brief look on the first six months of the COVID 19 pandemic
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
max(numOfEIBeneficiaries), max(numOfBusinessLicencesRenewed), max(numOfBusincessBankruptcies), max(numOfNewBusinessLicencesIssued), max(numOfTorontoHomesSold)
FROM FirstSixMonths;

-- We will now compare December 2019 to December 2020 and see the change for the year
SELECT * FROM TorontoStatistics
WHERE month = 'December' AND employmentRate != 0;

-- December 2020 has the largest average number of hours worked at main job at 36.63
-- December 2020 also had the largest percentage of self employed residents at 17.9%
-- December 2020 also had the largest percentage of vacant office space at 7.4%
-- December 2020 also had the larges number of EI beneficiaries
-- December 2021 held the other largest values
SELECT max(employmentRate), max(numOfEmployedCityOfTorontoResidents), max(avgHoursAtMainJob), max(percentageOfSelfEmployedTorontoResidents), max(percentageOfVacantOfficeSpace),
max(numOfEIBeneficiaries), max(numOfBusinessLicencesRenewed), max(numOfBusincessBankruptcies), max(numOfNewBusinessLicencesIssued), max(numOfTorontoHomesSold)
FROM TorontoStatistics
WHERE month = 'December' AND employmentRate != 0;

CREATE VIEW LastSixMonths AS
(SELECT *
FROM TorontoStatistics
WHERE year = 2021 AND employmentRate!=0);