DROP SCHEMA IF EXISTS JobMarket CASCADE; 
CREATE SCHEMA JobMarket;
SET SEARCH_PATH TO JobMarket;

-- Jobs should be removed but am detailing for clarity
CREATE TABLE Jobs (
    ID INTEGER,
    role TEXT DEFAULT "Employee",
    companyName TEXT NOT NULL,
    subSector TEXT NOT NULL,
    numOpenings INT DEFAULT 1,
    workFromHome BOOLEAN NOT NULL,
    wardName TEXT NOT NULL,
    datePosted DATE NOT NULL,
    PRIMARY KEY (ID),

);

-- Jobs should be removed but am detailing for clarity
CREATE TABLE Companies (
    companyName TEXT NOT NULL,
    wardName TEXT NOT NULL,
    numOfEmployees INTEGER NOT NULL,
    year INTEGER NOT NULL
);


CREATE TABLE JobSectors (
    sectorName TEXT NOT NULL,
    subSector TEXT NOT NULL,
    growthRate FLOAT NOT NULL
);


CREATE TABLE Wards (
    wardName TEXT NOT NULL,
    year INTEGER NOT NULL,
    newEstablishments INTEGER NOT NULL
);


CREATE TABLE ClosedCompanies (
    companyName TEXT NOT NULL,
    wardName TEXT NOT NULL,
    closureDate TEXT NOT NULL
);


CREATE TABLE CityOfTorontoStatistics (
    d DATE NOT NULL,
    numOfEmployedCityOfTorontoResidents INTEGER NOT NULL,
    percentageOfSelfEmployedTorontoResidents FLOAT NOT NULL,
    percentageOfVacantOfficeSpace FLOAT NOT NULL,
    numOfEmploymentInsuranceBeneficiaries INTEGER NOT NULL,
    numOfBusinessLicencesRenewed INTEGER NOT NULL,
    numOfNewBusinessLicencesIssued INTEGER NOT NULL
);



-- DROP table if exists Jobs cascade;
-- DROP table if exists Companies cascade;
-- DROP table if exists JobSectors cascade;
-- DROP table if exists Wards cascade;
-- DROP table if exists ClosedCompanies cascade;
-- DROP table if exists CityOfTorontoStatistics cascade;

