-- SunDogSolar: Insert Statements

-- Insert Leads
INSERT INTO leads (lead_provider_id, lead_electric_bill_amt, lead_roof_flat, lead_roof_sqrft, lead_zipcode, lead_status)
VALUES 
(1, 337.15, 1, 295, 18064, 'NEW'),
(2, 106.24, 1, 275, 55333, 'NEW'),
(3, 110.44, 0, 345, 67492, 'NEW');

-- Insert Salespersons
INSERT INTO salespersons (salesperson_email, salesperson_firstname, salesperson_lastname, salesperson_region_id)
VALUES 
('goodshepard@sundog.com', 'Eve', 'Adams', 1),
('ghayes@sundog.com', 'Rock', 'Rivers', 2),
('pfbarnsy@sundog.com', 'Paul', 'Bookman', 3),
('flapper@sundog.com', 'Boa', 'Charleston', 4);

-- Insert Customers
INSERT INTO customers (customer_firstname, customer_lastname, customer_address1, customer_email, customer_city, customer_state_id, customer_salesperson_id, customer_lead_id)
VALUES 
('Larry', 'Karlmann', '123 Merry Lane', 'lkarforless@superrito.com', 'Syracuse', 'NY', 1, 1),
('Belinda', 'Hatchett', '345 Tree St', 'bdehatchett@dayrep.com', 'Syracuse', 'NY', 2, 2),
('Pearla', 'Meau', '678 River Rd', 'pmeaup@dayrep.com', 'Chicago', 'IL', 3, 3);

-- Insert Proposals
INSERT INTO proposals (proposal_lead_id, proposal_salesperson_id, proposal_panel_type, proposal_panels_qty, proposal_total_cost)
VALUES 
(1, 1, 'Panasonic', 10, 15000),
(2, 2, 'Siemens', 15, 18000),
(3, 3, 'LG Solar', 12, 12000);

