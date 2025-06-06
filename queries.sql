-- 1. Get all dealerships
SELECT * FROM dealerships;

-- 2. Find all vehicles for a specific dealership
SELECT vehicles.Vin, vehicles.Make, vehicles.Model, vehicles.Sold, dealerships.Name
FROM vehicles
JOIN inventory
	ON inventory.Vin = vehicles.Vin
JOIN dealerships
	ON dealerships.DealershipID = inventory.DealershipID
WHERE dealerships.Name = 'Northwest Auto Mall';
    
-- 3. Find a car by VIN
SELECT *
FROM vehicles
WHERE Vin = '1HGFA16526L123456';

-- 4. Find the dealership where a certain car is located, by VIN
SELECT vehicles.Vin, dealerships.Name, dealerships.Address
FROM vehicles
JOIN inventory
	ON inventory.Vin = vehicles.Vin
JOIN dealerships
	ON dealerships.DealershipID = inventory.DealershipID
WHERE inventory.Vin = '1HGFA16526L123456';

-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT dealerships.DealershipID
FROM vehicles
JOIN inventory
	ON vehicles.Vin = inventory.Vin
JOIN dealerships
	ON dealerships.DealershipID = inventory.DealershipID
WHERE vehicles.Make = 'Honda' AND vehicles.Model = 'Civic';

-- 6. Get all sales information for a specific dealer for a specific date range
SELECT salescontracts.*, dealerships.DealershipID
FROM salescontracts
JOIN inventory
	ON salescontracts.Vin = inventory.Vin
JOIN dealerships
	ON dealerships.DealershipID = inventory.DealershipID
WHERE dealerships.DealershipID = 4
	AND SaleDate BETWEEN '2024-01-01' AND '2024-12-31';