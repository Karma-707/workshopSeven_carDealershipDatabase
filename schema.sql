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
    `Phone` VARCHAR(14),
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
    `Color` VARCHAR(15),
    CONSTRAINT `PK_Vehicles` PRIMARY KEY (`Vin`)
);

# ---------------------------------------------------------------------- #
# Add table "Inventory"			                                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `Inventory` (
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
    `SalesContractID` INTEGER NOT NULL AUTO_INCREMENT,
    `Vin` VARCHAR(17) NOT NULL,
    `BuyerName` VARCHAR(50) NOT NULL,
    `SalePrice` DECIMAL(10,2) NOT NULL,
    `SaleDate` DATE NOT NULL,
    CONSTRAINT `PK_SalesContracts` PRIMARY KEY (`SalesContractID`),
    CONSTRAINT `FK_SalesContracts_Vehicles` FOREIGN KEY (Vin) REFERENCES Vehicles(Vin)
);


# ---------------------------------------------------------------------- #
# Add table "LeaseContracts"                                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `LeaseContracts` (
    `LeaseContractID` INTEGER NOT NULL AUTO_INCREMENT,
    `Vin` VARCHAR(17) NOT NULL,
    `LeaseName` VARCHAR(50) NOT NULL,
    `LeaseStart` DATE NOT NULL,
    `LeaseEnd` DATE NOT NULL,
    `MonthlyPayment` DECIMAL(10,2) NOT NULL,
    CONSTRAINT `PK_LeaseContracts` PRIMARY KEY (`LeaseContractID`),
    CONSTRAINT `FK_LeaseContracts_Vehicles` FOREIGN KEY (Vin) REFERENCES Vehicles(Vin)
);


# ---------------------------------------------------------------------- #
# Add info into "Dealerships"                                             # --20
# ---------------------------------------------------------------------- #
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(1, 'Northwest Auto Mall', '305 - 14th Ave. S. Suite 3B, Seattle WA 98128', '(206) 555-4112');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(2, 'Brooklyn Car Hub', '123 Maple Street, Brooklyn NY 11220', '(206) 555-4112');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(3, 'Elite Auto Group', '900 W Madison St, Chicago IL 60607', '(312) 555-2299');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(4, 'Sunrise Motors', '4800 Sunrise Blvd, Sacramento CA 95827', '(916) 555-1020');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(5, 'Greenwood Cars', '1221 E Pike St, Seattle WA 98122', '(206) 555-8800');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(6, 'Auto Empire', '78 Main Street, Buffalo NY 14202', '(716) 555-6677');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(7, 'Premier Vehicles', '501 Oak Street, Austin TX 78701', '(512) 555-3090');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(8, 'Valley Auto Sales', '1500 N 7th Ave, Phoenix AZ 85007', '(602) 555-4455');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(9, 'Citywide Motors', '2100 Broadway, New York NY 10023', '(212) 555-3210');
INSERT INTO Dealerships(DealershipID, Name, Address, Phone) VALUES(10, 'Mountain View Autos', '3700 Foothill Blvd, Denver CO 80212', '(303) 555-7850');

# ---------------------------------------------------------------------- #
# Add info into "Vehicles"                                               # --100
# ---------------------------------------------------------------------- #
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('1HGCM82633A123456', 0 , 'Honda', 'Accord', 'Blue');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('1HGCM82633A654321', 1 , 'Ford', 'F-150', 'Black');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('3FAHP0HA9AR123456', 1, 'Nissan', 'Altima', 'Gray');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('1NXBR32E54Z123456', 0, 'Hyundai', 'Elantra', 'White');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('1C4RJFBG0FC123456', 0, 'Jeep', 'Grand Cherokee', 'Silver');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('1HGFA16526L123456', 1, 'Honda', 'Civic', 'Red');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('2T1BURHE5FC123456', 0, 'Toyota', 'Corolla', 'Blue');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('1FADP3F22JL123456', 0, 'Ford', 'Focus', 'White');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('JHMFA16586S123456', 1, 'Honda', 'Fit', 'Green');
INSERT INTO Vehicles(Vin, Sold, Make, Model, Color) VALUES('3CZRE4H59BG123456', 0, 'Honda', 'CR-V', 'Black');

# ---------------------------------------------------------------------- #
# Add info into "Inventory"                                              # --30
# ---------------------------------------------------------------------- #
INSERT INTO Inventory (DealershipID, Vin) VALUES (1, '1HGCM82633A123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (1, '1HGCM82633A654321');
INSERT INTO Inventory (DealershipID, Vin) VALUES (2, '3FAHP0HA9AR123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (2, '1NXBR32E54Z123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (3, '1C4RJFBG0FC123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (4, '1HGFA16526L123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (5, '2T1BURHE5FC123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (6, '1FADP3F22JL123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (7, 'JHMFA16586S123456');
INSERT INTO Inventory (DealershipID, Vin) VALUES (8, '3CZRE4H59BG123456');

# ---------------------------------------------------------------------- #
# Add info into "SalesContracts"               		                     # --20
# ---------------------------------------------------------------------- #
INSERT INTO SalesContracts (SalesContractID, Vin, BuyerName, SalePrice, SaleDate) VALUES (1, '1HGCM82633A654321', 'Alice Martin', 23500.00, '2024-01-15');
INSERT INTO SalesContracts (SalesContractID, Vin, BuyerName, SalePrice, SaleDate) VALUES (2, '3FAHP0HA9AR123456', 'Carlos Rivera', 19999.99, '2024-02-10');
INSERT INTO SalesContracts (SalesContractID, Vin, BuyerName, SalePrice, SaleDate) VALUES (3, '1HGFA16526L123456', 'Dana Li', 17800.50, '2024-03-05');
INSERT INTO SalesContracts (SalesContractID, Vin, BuyerName, SalePrice, SaleDate) VALUES (4, 'JHMFA16586S123456', 'Evan Jacobs', 16350.00, '2024-04-20');
INSERT INTO SalesContracts (SalesContractID, Vin, BuyerName, SalePrice, SaleDate) VALUES (5, '1C4RJFBG0FC123456', 'Fatima El-Sayed', 26875.75, '2024-05-30');

# ---------------------------------------------------------------------- #
# Add info into "LeaseContracts"                                         # --20
# ---------------------------------------------------------------------- #
INSERT INTO LeaseContracts (LeaseContractID, Vin, LeaseName, LeaseStart, LeaseEnd, MonthlyPayment) VALUES(1, '2T1BURHE5FC123456', 'Liam Carter', '2024-01-15', '2027-01-15', 325.00);
INSERT INTO LeaseContracts (LeaseContractID, Vin, LeaseName, LeaseStart, LeaseEnd, MonthlyPayment) VALUES (2, '1FADP3F22JL123456', 'Sophia Nguyen', '2023-06-01', '2026-06-01', 310.75);
INSERT INTO LeaseContracts (LeaseContractID, Vin, LeaseName, LeaseStart, LeaseEnd, MonthlyPayment) VALUES (3, '1NXBR32E54Z123456', 'Jackson Lee', '2025-03-10', '2028-03-10', 289.99);
INSERT INTO LeaseContracts (LeaseContractID, Vin, LeaseName, LeaseStart, LeaseEnd, MonthlyPayment) VALUES (4, '3CZRE4H59BG123456', 'Olivia Martinez', '2024-11-01', '2027-11-01', 340.50);
INSERT INTO LeaseContracts (LeaseContractID, Vin, LeaseName, LeaseStart, LeaseEnd, MonthlyPayment) VALUES (5, '1HGCM82633A123456', 'Noah Kim', '2022-09-01', '2025-09-01', 295.00);