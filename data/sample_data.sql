-- SunDogSolar: Sample Data

-- Insert Regions (Sample)
INSERT INTO regions (region_name)
VALUES 
('Northeast'),
('South');

-- Insert Power Providers (Sample)
INSERT INTO power_providers (provider_name, provider_resale_plan)
VALUES
('Pacific Gas & Electric', 0.25),
('Sunshine Rainbow Power', 0.36);

-- Insert Solar Panels Lookup (Sample)
INSERT INTO solar_panels_lookup (solpanel_price, solpanel_mfgr, solpanel_dims, solpanel_elec_spec)
VALUES
(450.32, 'Janus Component Mfg', '30x30', '25 kWh'),
(999.32, 'Biggs Ripov Supplies', '50x50', '16 kWh');

-- Insert State Lookup (Sample)
INSERT INTO state_lookup (state_id, state_name, state_region_id)
VALUES
('NY', 'New York', 1),
('TX', 'Texas', 2);

-- Insert Zipcodes (Sample)
INSERT INTO zipcodes (zipcode_id, zipcode_state_id)
VALUES 
(18064, 'NY'),
(77345, 'TX');

-- Insert Leads (Sample)
INSERT INTO leads (lead_provider_id, lead_electric_bill_amt, lead_roof_flat, lead_roof_sqrft, lead_zipcode, lead_status)
VALUES 
(1, 337.15, 1, 295, 18064, 'NEW'),
(2, 312.55, 1, 200, 77345, 'NEW');

-- Insert Salespersons (Sample)
INSERT INTO salespersons (salesperson_email, salesperson_firstname, salesperson_lastname, salesperson_region_id)
VALUES 
('goodshepard@sundog.com', 'Eve', 'Adams', 1),
('ghayes@sundog.com', 'Rock', 'Rivers', 2);

-- Insert Customers (Sample)
INSERT INTO customers (customer_firstname, customer_lastname, customer_address1, customer_email, customer_city, customer_state_id, customer_salesperson_id, customer_lead_id)
VALUES 
('Larry', 'Karlmann', '123 Merry Lane', 'lkarforless@superrito.com', 'Syracuse', 'NY', 1, 1),
('Steve', 'Boate', '1110 Wicker Heights Blvd', 'sboate@drift.com', 'Houston', 'TX', 2, 2);

-- Insert Proposals (Sample)
INSERT INTO proposals (proposal_lead_id, proposal_salesperson_id, proposal_panel_type, proposal_panels_qty, proposal_total_cost)
VALUES 
(1, 1, 'Panasonic', 10, 15000),
(2, 2, 'Siemens', 12, 18000);

-- Insert Installers (Sample)
INSERT INTO installers (installer_email, installer_state_id)
VALUES 
('otyme@dayrep.com', 'NY'),
('meyezing@dayrep.com', 'TX');

-- Insert Bids (Sample)
INSERT INTO bids (bid_installer_id, bid_customer_id, bid_amount, bid_status, bid_date)
VALUES 
(1, 1, 2001.16, 'NEW', '2023-08-21'),
(2, 2, 2306.12, 'INACTIVE', '2021-05-01');
