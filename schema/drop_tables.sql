-- SunDogSolar: Drop Tables Script

-- Drop Tables in the reverse order of creation due to foreign key dependencies.

-- 1. Drop Bids Table
DROP TABLE IF EXISTS bids;

-- 2. Drop Installers Table
DROP TABLE IF EXISTS installers;

-- 3. Drop Customers Table
DROP TABLE IF EXISTS customers;

-- 4. Drop Proposals Table
DROP TABLE IF EXISTS proposals;

-- 5. Drop Salespersons Table
DROP TABLE IF EXISTS salespersons;

-- 6. Drop Leads Table
DROP TABLE IF EXISTS leads;

-- 7. Drop Zipcodes Table
DROP TABLE IF EXISTS zipcodes;

-- 8. Drop State Coordinates Table
DROP TABLE IF EXISTS state_coordinates;

-- 9. Drop State Lookup Table
DROP TABLE IF EXISTS state_lookup;

-- 10. Drop Solar Panels Lookup Table
DROP TABLE IF EXISTS solar_panels_lookup;

-- 11. Drop Power Providers Table
DROP TABLE IF EXISTS power_providers;

-- 12. Drop Regions Table
DROP TABLE IF EXISTS regions;

