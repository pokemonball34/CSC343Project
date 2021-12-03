SET SEARCH_PATH TO JobMarket;  
DROP TABLE IF exists q2 CASCADE;  
  
CREATE TABLE q2(  
       
);  
  
-- Do this for each of the views that define your intermediate steps.    
-- (But give them better names!) The IF EXISTS avoids generating an error   
-- the first time this file is imported.  
DROP VIEW IF EXISTS intermediate_step CASCADE;  

  
-- Define views for your intermediate steps here:

-- A culmination of all the businesses in each ward that are closed, based on sectorID and year
DROP VIEW IF EXISTS closed_businesses CASCADE;
CREATE VIEW closed_businesses as
SELECT 2019 AS year, sectorID, wardName, Count(companyID) as closed_businesses
FROM COMPANIES
WHERE wardName IS NOT NULL AND 
    (closeDate IS NOT NULL AND closeDate <= '2019-12-31')
GROUP BY sectorID, wardName
UNION
SELECT 2020 AS year, sectorID, wardName, Count(companyID) as closed_businesses
FROM COMPANIES
WHERE wardName IS NOT NULL AND 
    (closeDate IS NOT NULL AND closeDate >= '2019-12-31' AND closeDate <= '2020-12-31' )
GROUP BY sectorID, wardName
UNION
SELECT 2021 AS year, sectorID, wardName, Count(companyID) as closed_businesses
FROM COMPANIES
WHERE wardName IS NOT NULL AND 
    (closeDate IS NOT NULL AND closeDate >= '2020-12-31' AND closeDate <= '2021-12-31')
GROUP BY sectorID, wardName
ORDER BY year, sectorID, wardName;

-- A count of all the businesses in each ward that are open, based on sectorID and year
DROP VIEW IF EXISTS open_businesses CASCADE;
CREATE VIEW open_businesses as
SELECT 2019 AS year, sectorID, wardName, Count(companyID) as open_businesses
FROM COMPANIES
WHERE wardName IS NOT NULL AND (closeDate IS NULL OR closeDate > '2019-12-31')
GROUP BY sectorID, wardName
UNION
SELECT 2020 AS year, sectorID, wardName, Count(companyID) as open_businesses
FROM COMPANIES
WHERE wardName IS NOT NULL AND (closeDate IS NULL OR closeDate > '2020-12-31')
GROUP BY sectorID, wardName
UNION
SELECT 2021 AS year, sectorID, wardName, Count(companyID) as open_businesses
FROM COMPANIES
WHERE wardName IS NOT NULL AND (closeDate IS NULL OR closeDate > '2020-12-31')
GROUP BY sectorID, wardName
ORDER BY year, sectorID, wardName;

-- A joining of open_businesses and closed_businesses.
DROP VIEW IF EXISTS open_to_closed CASCADE;
CREATE VIEW open_to_closed as
SELECT COALESCE(cb.year, ob.year, NULL) as year,
    COALESCE(cb.sectorID, ob.sectorID, NULL) as sectorID,
    COALESCE(cb.wardName, ob.wardName, NULL) as wardName,
    COALESCE(cb.closed_businesses, 0) as open_businesses,
    COALESCE(ob.open_businesses, 0) as closed_businesses
FROM open_businesses as ob FULL OUTER JOIN closed_businesses as cb ON ob.sectorID = cb.sectorID AND 
    ob.year=cb.year;

-- Counts the number of businesses per year to check if there is a decline in businesses.
-- DROP VIEW IF EXISTS businesses_per_year CASCADE;
-- CREATE VIEW businesses_per_year as
-- SELECT year, 
--     COALESCE( SUM(numofbusinesslicencesrenewed), 0 ) + COALESCE( SUM(numofnewbusinesslicencesissued), 0 ) AS active_businesses
-- FROM CityOfTorontoStatistics
-- WHERE year=2019 OR year=2020 OR year=2021
-- GROUP BY year;

-- We will use the ratio between open and closed businesses to determine if a
-- sector is competitive. We will say that a sector is competitive in a ward
-- if the number of closed businesses to the total number of businesses is
-- greater than 0.4
-- This implies the Ward has a high turnover rate for a specific sector
DROP VIEW IF EXISTS sector_ward_is_competitive CASCADE;
CREATE VIEW sector_ward_is_competitive as
SELECT year, sectorID, wardName,
    CAST(closed_businesses AS FLOAT)/(open_businesses + closed_businesses) > 0.4 AS is_competitive
FROM open_to_closed as oc;

-- We check if each ward stays competitive from 2019 to 2020.
-- We will only do a double cross join, as 2021 data is still
-- insufficient and will take a long time.
DROP VIEW IF EXISTS stays_competitive CASCADE;
CREATE VIEW stays_competitive as
SELECT s1.sectorID, s1.wardName
FROM sector_ward_is_competitive s1 CROSS JOIN sector_ward_is_competitive s2
WHERE s1.is_competitive AND s1.year=2019 AND
    s2.is_competitive AND s2.year=2020;
    

-- Your query that answers the question goes below the "insert into" line:
-- 
insert into q2
SELECT sc.wardName, sc.sectorID, js.subSector
FROM stays_competitive sc JOIN open_to_closed oc ON sc.sectorID=oc.sectorID AND
    sc.wardName=oc.wardName JOIN JobSectors js ON js.sectorID=sc.sectorID 
WHERE open_to_closed.year
ORDER BY wardName, sectorID;
