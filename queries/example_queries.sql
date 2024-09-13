-- SunDogSolar: Example Queries

-- Retrieve all customers
SELECT * FROM customers;

-- Retrieve all leads in New York
SELECT * FROM leads WHERE lead_zipcode IN (SELECT zipcode_id FROM zipcodes WHERE zipcode_state_id = 'NY');

-- Retrieve proposals with total cost greater than $15,000
SELECT * FROM proposals WHERE proposal_total_cost > 15000;

-- Retrieve salespersons and their regions
SELECT sp.salesperson_firstname, sp.salesperson_lastname, r.region_name
FROM salespersons sp
JOIN regions r ON sp.salesperson_region_id = r.region_id;

