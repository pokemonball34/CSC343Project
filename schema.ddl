DROP SCHEMA IF EXISTS JobMarket CASCADE; 
CREATE SCHEMA JobMarket;
SET SEARCH_PATH TO JobMarket;

-- Jobs should be removed but am detailing for clarity
CREATE TABLE Jobs (
    ID INT,
    role TEXT DEFAULT "Employee",
    companyName TEXT NOT NULL,
    subSector TEXT NOT NULL,
    numOpenings INT DEFAULT 1,
    workFromHome BOOL NOT NULL,
    wardName TEXT NOT NULL,
    datePosted DATE NOT NULL,
    PRIMARY KEY (ID),

);

-- Jobs should be removed but am detailing for clarity
CREATE TABLE Companies (
    companyName TEXT NOT NULL,
    wardName TEXT NOT NULL,

);


CREATE TABLE JobSectors (

);


CREATE TABLE Wards (

);


CREATE TABLE ClosedCompanies (

);


CREATE TABLE CityOfTorontoStatistics (

);



-- DROP table if exists Jobs cascade;
-- DROP table if exists Companies cascade;
-- DROP table if exists JobSectors cascade;
-- DROP table if exists Wards cascade;
-- DROP table if exists ClosedCompanies cascade;
-- DROP table if exists CityOfTorontoStatistics cascade;

