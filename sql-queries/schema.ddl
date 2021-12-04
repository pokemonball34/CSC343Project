DROP SCHEMA IF EXISTS JobMarket CASCADE; 
CREATE SCHEMA JobMarket;
SET SEARCH_PATH TO JobMarket;

CREATE TABLE JobSectors (
    sectorID INT NOT NULL,
    sectorName TEXT NOT NULL,
    subSector TEXT NOT NULL,

    PRIMARY KEY (sectorID)
);

CREATE TABLE Wards (
    wardName TEXT NOT NULL,
    PRIMARY KEY (wardName)
);


CREATE TABLE Companies (
    companyID INT NOT NULL,
    companyName TEXT NOT NULL,
    closeDate DATE,
    wardName TEXT,
    numOfEmployees INT,
    sectorID INT NOT NULL,

    PRIMARY KEY (companyID),
    FOREIGN KEY (sectorID) REFERENCES JobSectors(sectorID),
    FOREIGN KEY (wardName) REFERENCES Wards(wardName)
);

CREATE TABLE CityOfTorontoStatistics (
    month TEXT NOT NULL,
    year INTEGER NOT NULL,
    employmentRate FLOAT NOT NULL,
    numOfEmployedCityOfTorontoResidents INTEGER NOT NULL,
    avgHoursAtMainJob FLOAT NOT NULL,
    percentageOfSelfEmployedTorontoResidents FLOAT NOT NULL,
    percentageOfVacantOfficeSpace FLOAT NOT NULL,
    numOfEIBeneficiaries INTEGER NOT NULL,
    numOfBusinessLicencesRenewed INTEGER NOT NULL,
    numOfBusinessBankruptcies INTEGER NOT NULL,
    numOfNewBusinessLicencesIssued INTEGER NOT NULL,
    numOfTorontoHomesSold INTEGER NOT NULL,

    PRIMARY KEY (year, month)
);


