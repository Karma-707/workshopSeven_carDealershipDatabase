# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          workshopSeven_carDealershipDatabase             #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS carDealershipDatabase;

CREATE DATABASE IF NOT EXISTS carDealershipDatabase;

USE carDealershipDatabase;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# Add table "Dealerships"                                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `Dealerships` (
    `DealershipID` INTEGER NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(50),
    `Address` VARCHAR(50),
    `Phone` VARCHAR(12),
    CONSTRAINT `PK_Dealerships` PRIMARY KEY (`DealershipID`)
);

# ---------------------------------------------------------------------- #
# Add table "Vehicles"                                      			 #
# ---------------------------------------------------------------------- #

CREATE TABLE `Vehicles` (
    `Vin` VARCHAR(17) NOT NULL,
    `Sold` BIT NOT NULL DEFAULT 0,
	`Make` VARCHAR(30),
    `Model` VARCHAR(30),
    CONSTRAINT `PK_Vehicles` PRIMARY KEY (`Vin`)
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"			                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `Inventory ` (
    `DealershipID` INTEGER NOT NULL,
    `Vin` VARCHAR(17) NOT NULL,
    CONSTRAINT `PK_Inventory` PRIMARY KEY (`DealershipID`, `Vin`),
    CONSTRAINT `FK_Inventory_Dealerships` FOREIGN KEY (DealershipID) REFERENCES Dealerships(DealershipID),
    CONSTRAINT `FK_Inventory_Vehicles` FOREIGN KEY (Vin) REFERENCES Vehicles(Vin)
);

# ---------------------------------------------------------------------- #
# Add table "SalesContracts"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `SalesContracts` (
    `ContractID` INTEGER NOT NULL AUTO_INCREMENT,
    `Vin` VARCHAR(17) NOT NULL,
    `BuyerName` VARCHAR(50) NOT NULL,
    `SalePrice` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `PK_SalesContracts` PRIMARY KEY (`ContractID`),
    CONSTRAINT `FK_SalesContracts_Vehicles` FOREIGN KEY (Vin) REFERENCES Vehicles(Vin)
);


# ---------------------------------------------------------------------- #
# Add table "LeaseContracts"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `LeaseContracts` (
    `ContractID` INTEGER NOT NULL AUTO_INCREMENT,
    `Vin` VARCHAR(17) NOT NULL,
    `LeaseName` VARCHAR(50) NOT NULL,
    `LeaseStart` DATE NOT NULL,
    `LeaseEND` DATE NOT NULL,
    `MonthlyPayment` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `FK_SalesContracts_Vehicles` FOREIGN KEY (Vin) REFERENCES Vehicles(Vin)
);


# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                             #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                              #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add info into "SalesContracts"                                    #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Add info into "LeaseContracts"                                                 #
# ---------------------------------------------------------------------- #

