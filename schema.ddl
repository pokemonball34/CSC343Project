DROP SCHEMA IF EXISTS JobMarket CASCADE; 
CREATE SCHEMA JobMarket;
SET SEARCH_PATH TO JobMarket;

-- Jobs should be removed but am detailing for clarity
-- CREATE TABLE Jobs (
--     ID INTEGER,
--     role TEXT DEFAULT "Employee",
--     companyName TEXT NOT NULL,
--     subSector TEXT NOT NULL,
--     numOpenings INT DEFAULT 1,
--     workFromHome BOOLEAN NOT NULL,
--     wardName TEXT NOT NULL,
--     datePosted DATE NOT NULL,
--     PRIMARY KEY (ID),

-- );

-- CHANGED: To Be Reviewed
CREATE TABLE Companies (
    companyID INTEGER NOT NULL,
    companyName TEXT NOT NULL,
    wardName TEXT NOT NULL,
    numOfEmployees INTEGER NOT NULL,

    PRIMARY KEY (companyID)
    FOREIGN KEY (wardName) REFERENCES Wards(wardName),
);


CREATE TABLE JobSectors (
    sectorName TEXT NOT NULL,
    subSector TEXT NOT NULL,
    -- growthRate FLOAT NOT NULL,

    PRIMARY KEY (sectorName, subSector)
);


-- CREATE TABLE Wards (
--     wardName TEXT NOT NULL,
--     PRIMARY KEY (wardName)
-- );

-- NEW TABLE FOR NEW ESTABLISHMENTS
CREATE TABLE Wards (
    wardName TEXT NOT NULL,
    year INTEGER NOT NULL,
    newEstablishments INTEGER NOT NULL,

    PRIMARY KEY (wardName, year),
    CONSTRAINT validyear
        CHECK (year = 2019 OR year = 2020 OR year = 2021)
);


-- No longer have to worry about closed companies
-- CREATE TABLE ClosedCompanies (
--     companyName TEXT NOT NULL,
--     wardName TEXT NOT NULL,
--     closureDate TEXT NOT NULL
-- );


CREATE TABLE CityOfTorontoStatistics (
    year INTEGER NOT NULL,
    month TEXT NOT NULL,
    -- d DATE NOT NULL,
    empRate FLOAT NOT NULL,
    numOfEmployedCityOfTorontoResidents INTEGER NOT NULL,
    percentageOfSelfEmployedTorontoResidents FLOAT NOT NULL,
    percentageOfVacantOfficeSpace FLOAT NOT NULL,
    numOfEmploymentInsuranceBeneficiaries INTEGER NOT NULL,
    numOfBusinessLicencesRenewed INTEGER NOT NULL,
    numOfNewBusinessLicencesIssued INTEGER NOT NULL,

    PRIMARY KEY (d, numOfEmployedCityOfTorontoResidents, percentageOfSelfEmployedTorontoResidents,
    percentageOfVacantOfficeSpace, numOfEmploymentInsuranceBeneficiaries, numOfBusinessLicencesRenewed,
    numOfNewBusinessLicencesIssued)
);



-- DROP table if exists Jobs cascade;
-- DROP table if exists Companies cascade;
-- DROP table if exists JobSectors cascade;
-- DROP table if exists Wards cascade;
-- DROP table if exists ClosedCompanies cascade;
-- DROP table if exists CityOfTorontoStatistics cascade;

