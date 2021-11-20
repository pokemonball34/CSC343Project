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

CREATE TABLE JobSectors (
    sectorName TEXT NOT NULL,
    subSector TEXT NOT NULL,

    PRIMARY KEY (sectorName, subSector)
);

CREATE TABLE NewEstablishments (
    wardName TEXT NOT NULL,
    year INTEGER NOT NULL,
    newEstablishments INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (wardName, year),
    CONSTRAINT validyear
        CHECK (year = 2019 OR year = 2020 OR year = 2021)
);


CREATE TABLE Companies (
    companyID INTEGER NOT NULL,
    companyName TEXT NOT NULL,
    postalCode TEXT NOT NULL,
    wardName TEXT,
    numOfEmployees INTEGER,

    PRIMARY KEY (companyID)
    -- FOREIGN KEY (wardName) REFERENCES NewEstablishments(wardName)
);

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

    PRIMARY KEY (year, month)
);


