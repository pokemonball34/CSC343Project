DROP SCHEMA IF EXISTS JobMarket CASCADE; 
CREATE SCHEMA JobMarket;
SET SEARCH_PATH TO JobMarket;

-- A row in this table represents a unique sectorName, subSector combination under NAICS that has an associated sectorID
CREATE TABLE JobSectors (
    sectorID INT NOT NULL,
    sectorName TEXT NOT NULL,
    subSector TEXT NOT NULL,

    PRIMARY KEY (sectorID)
);

-- A row in this table represents a ward within the City of Toronto
CREATE TABLE Wards (
    wardName TEXT NOT NULL,
    PRIMARY KEY (wardName)
);

-- A row in this table represents a company within the City of Toronto
-- that has an associated unique company ID as well as company company closure data (if provided),
-- wardName (if provided), numOfEmployees (if provided), and the sectorName,subSector combination that 
-- the company falls under
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
-- A row in this table represents a year,month combination of the City of Toronto statistics
-- that includes the employmentRate, the numOfEmployedCityOfTorontoResidents, the avgHoursAtMainJob,
-- the percentageOfSelfEmployedTorontoResidents, the percentageOfVacantOfficeSpace, the numOfEIBeneficiaries,
-- the numOfBusinessLicencesRenewed, the numOfBusinessBankruptcies, the numOfNewBusinessLicencesIssued, and
-- the numOfTorontoHomesSold
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


