-- SunDogSolar: Insert Statements

-- Insert Regions
INSERT INTO regions (region_name)
VALUES 
('Northeast'),
('South'),
('Midwest'),
('West');

-- Insert Power Providers
INSERT INTO power_providers (provider_name, provider_resale_plan)
VALUES
('Pacific Gas & Electric', 0.25),
('Consolidated Edison', 0.29),
('Duke Nukem Energy', 0.50),
('Neon Cloud Light & Power', 0.12),
('Greater Barad-dûr Regional Utilities', 0.45),
('Sunshine Rainbow Power', 0.36);

-- Insert Solar Panels Lookup
INSERT INTO solar_panels_lookup (solpanel_price, solpanel_mfgr, solpanel_dims, solpanel_elec_spec)
VALUES
(450.32, 'Janus Component Mfg', '30x30', '25 kWh'),
(150.12, 'Econofail Inc.', '29x29', '15 kWh'),
(616.22, 'ACME Coyote Industries', '40x40', '125 kWh'),
(420.00, 'Better Green Products', '40x20', '42 kWh'),
(999.32, 'Biggs Ripov Supplies', '50x50', '16 kWh');

-- Insert State Lookup
INSERT INTO state_lookup (state_id, state_name, state_region_id)
VALUES
('AK', 'Alaska', 4),
('CA', 'California', 4),
('TX', 'Texas', 2),
('NY', 'New York', 1),
('FL', 'Florida', 2),
('IL', 'Illinois', 3);

-- Insert Zipcodes
INSERT INTO zipcodes (zipcode_id, zipcode_state_id)
VALUES 
(18064, 'NY'),
(55333, 'MN'),
(67492, 'KS'),
(7649, 'NJ'),
(40056, 'KY'),
(60948, 'IL'),
(77345, 'TX'),
(61802, 'IL'),
(37356, 'TN'),
(68128, 'NE');

-- Insert Leads
INSERT INTO leads (lead_provider_id, lead_electric_bill_amt, lead_roof_flat, lead_roof_sqrft, lead_zipcode, lead_status)
VALUES 
(1, 337.15, 1, 295, 18064, 'NEW'),
(2, 106.24, 1, 275, 55333, 'NEW'),
(3, 110.44, 0, 345, 67492, 'NEW'),
(4, 112.62, 1, 245, 7649, 'NEW'),
(5, 272.67, 1, 265, 40056, 'NEW'),
(6, 332.85, 1, 320, 60948, 'NEW'),
(7, 312.55, 1, 200, 77345, 'NEW'),
(8, 230.74, 0, 215, 61802, 'NEW'),
(9, 145.60, 0, 215, 37356, 'NEW'),
(10, 322.87, 0, 185, 68128, 'NEW');

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
('Pearla', 'Meau', '678 River Rd', 'pmeaup@dayrep.com', 'Chicago', 'IL', 3, 3),
('Tanner', 'Anott', '910 Franklin Ave', 'tanott@gustr.com', 'Rochester', 'NY', 1, 4),
('Steve', 'Boate', '1110 Wicker Heights Blvd', 'sboate@drift.com', 'New Haven', 'CT', 2, 5);

-- Insert Installers
INSERT INTO installers (installer_email, installer_state_id)
VALUES 
('otyme@dayrep.com', 'NY'),
('meyezing@dayrep.com', 'AZ'),
('bitall@dayrep.com', 'NY'),
('sbeeches@dayrep.com', 'CT');

-- Insert Proposals
INSERT INTO proposals (proposal_lead_id, proposal_salesperson_id, proposal_panel_type, proposal_panels_qty, proposal_total_cost)
VALUES 
(1, 1, 'Panasonic', 10, 15000),
(2, 2, 'Siemens', 15, 18000),
(3, 3, 'LG Solar', 12, 12000);

-- Insert Bids
INSERT INTO bids (bid_installer_id, bid_customer_id, bid_amount, bid_status, bid_date)
VALUES 
(1, 1, 2001.16, 'NEW', '2023-08-21'),
(2, 2, 2306.12, 'INACTIVE', '2021-05-01'),
(3, 3, 4150.00, 'REJECTED', '2020-06-11');
