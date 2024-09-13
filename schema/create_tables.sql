-- SunDogSolar: Create Tables

-- 1. Regions Table
CREATE TABLE regions (
    region_id INT IDENTITY NOT NULL,
    region_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_region_id PRIMARY KEY (region_id),
    CONSTRAINT u_region_name UNIQUE (region_name)
);

-- 2. Power Providers Table
CREATE TABLE power_providers (
    provider_id INT IDENTITY NOT NULL,
    provider_name VARCHAR(50) NOT NULL,
    provider_resale_plan FLOAT,
    CONSTRAINT pk_power_providers_provider_id PRIMARY KEY (provider_id)
);

-- 3. Solar Panels Lookup Table
CREATE TABLE solar_panels_lookup (
    solpanel_id INT IDENTITY NOT NULL,
    solpanel_price MONEY,
    solpanel_mfgr VARCHAR(50),
    solpanel_dims VARCHAR(50),
    solpanel_elec_spec VARCHAR(50),
    CONSTRAINT pk_solpanel_id PRIMARY KEY (solpanel_id)
);

-- 4. State Lookup Table
CREATE TABLE state_lookup (
    state_id CHAR(2) NOT NULL,
    state_name VARCHAR(50) NOT NULL,
    state_region_id INT,
    CONSTRAINT pk_state_id PRIMARY KEY (state_id)
);

-- 5. State Coordinates Table
CREATE TABLE state_coordinates (
    state_coord_id INT IDENTITY NOT NULL,
    state_coord_state_id CHAR(2) NOT NULL,
    state_coord_lat DECIMAL(9,6),
    state_coord_long DECIMAL(9,6),
    CONSTRAINT pk_state_coord_id PRIMARY KEY (state_coord_id),
    CONSTRAINT ck_state_coord_lat_range CHECK (state_coord_lat BETWEEN -90 AND 90),
    CONSTRAINT ck_state_coord_long_range CHECK (state_coord_long BETWEEN -180 AND 180)
);

-- 6. Zipcodes Table
CREATE TABLE zipcodes (
    zipcode_id INT NOT NULL,
    zipcode_state_id CHAR(2) NOT NULL,
    CONSTRAINT pk_zipcode_id PRIMARY KEY (zipcode_id)
);

-- 7. Leads Table
CREATE TABLE leads (
    lead_id INT IDENTITY NOT NULL,
    lead_provider_id INT NOT NULL,
    lead_electric_bill_amt MONEY,
    lead_roof_flat BIT NOT NULL,
    lead_roof_sqrft INT NOT NULL,
    lead_zipcode INT,
    lead_status VARCHAR(10),
    CONSTRAINT pk_lead_id PRIMARY KEY (lead_id)
);

-- 8. Salespersons Table
CREATE TABLE salespersons (
    salesperson_id INT IDENTITY NOT NULL,
    salesperson_email VARCHAR(50) NOT NULL,
    salesperson_firstname VARCHAR(50),
    salesperson_lastname VARCHAR(50),
    salesperson_region_id INT NOT NULL,
    CONSTRAINT pk_salesperson_id PRIMARY KEY (salesperson_id),
    CONSTRAINT u_salesperson_email UNIQUE (salesperson_email)
);

-- 9. Proposals Table
CREATE TABLE proposals (
    proposal_id INT IDENTITY NOT NULL,
    proposal_lead_id INT NOT NULL,
    proposal_salesperson_id INT NOT NULL,
    proposal_panel_type VARCHAR(50) NOT NULL,
    proposal_panels_qty INT NOT NULL,
    proposal_total_cost FLOAT NOT NULL,
    CONSTRAINT pk_proposal_id PRIMARY KEY (proposal_id),
    CONSTRAINT pk_proposal_lead_id_unique UNIQUE (proposal_lead_id)
);

-- 10. Customers Table
CREATE TABLE customers (
    customer_id INT IDENTITY NOT NULL,
    customer_firstname VARCHAR(50) NOT NULL,
    customer_lastname VARCHAR(50) NOT NULL,
    customer_address1 VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_city VARCHAR(50) NOT NULL,
    customer_state_id CHAR(2) NOT NULL,
    customer_salesperson_id INT NOT NULL,
    customer_lead_id INT NOT NULL,
    CONSTRAINT pk_customers_customer_id PRIMARY KEY (customer_id),
    CONSTRAINT u_customers_customer_email UNIQUE (customer_email),
    CONSTRAINT u_customers_customer_lead_id UNIQUE (customer_lead_id)
);

-- 11. Installers Table
CREATE TABLE installers (
    installer_id INT IDENTITY NOT NULL,
    installer_email VARCHAR(50) NOT NULL,
    installer_state_id CHAR(2) NOT NULL,
    CONSTRAINT pk_installers_installer_id PRIMARY KEY (installer_id),
    CONSTRAINT u_installers_installer_email UNIQUE (installer_email)
);

-- 12. Bids Table
CREATE TABLE bids (
    bid_id INT IDENTITY NOT NULL,
    bid_installer_id INT NOT NULL,
    bid_customer_id INT NOT NULL,
    bid_amount MONEY NOT NULL,
    bid_status VARCHAR(16),
    bid_date DATE NOT NULL,
    bid_solpanel_id INT,
    CONSTRAINT pk_bids_bid_id PRIMARY KEY (bid_id)
);

-- Add Foreign Key Constraints after the tables are created

-- Add foreign key to state_lookup for regions
ALTER TABLE state_lookup
ADD CONSTRAINT fk_states_state_region_id FOREIGN KEY (state_region_id) REFERENCES regions (region_id);

-- Add foreign key to state_coordinates for state_lookup
ALTER TABLE state_coordinates
ADD CONSTRAINT fk_state_coord_state_id FOREIGN KEY (state_coord_state_id) REFERENCES state_lookup (state_id);

-- Add foreign key to leads for power_providers
ALTER TABLE leads
ADD CONSTRAINT fk_leads_lead_provider_id FOREIGN KEY (lead_provider_id) REFERENCES power_providers (provider_id);

-- Add foreign key to leads for zipcodes
ALTER TABLE leads
ADD CONSTRAINT fk_leads_lead_zipcode FOREIGN KEY (lead_zipcode) REFERENCES zipcodes (zipcode_id);

-- Add foreign key to salespersons for regions
ALTER TABLE salespersons
ADD CONSTRAINT fk_salesperson_region_id FOREIGN KEY (salesperson_region_id) REFERENCES regions (region_id);

-- Add foreign key to proposals for leads
ALTER TABLE proposals
ADD CONSTRAINT fk_proposal_lead_id FOREIGN KEY (proposal_lead_id) REFERENCES leads (lead_id);

-- Add foreign key to proposals for salespersons
ALTER TABLE proposals
ADD CONSTRAINT fk_proposal_salesperson_id FOREIGN KEY (proposal_salesperson_id) REFERENCES salespersons (salesperson_id);

-- Add foreign key to customers for state_lookup
ALTER TABLE customers
ADD CONSTRAINT fk_customers_customer_state_id FOREIGN KEY (customer_state_id) REFERENCES state_lookup (state_id);

-- Add foreign key to customers for salespersons
ALTER TABLE customers
ADD CONSTRAINT fk_customers_customer_salesperson_id FOREIGN KEY (customer_salesperson_id) REFERENCES salespersons (salesperson_id);

-- Add foreign key to customers for leads
ALTER TABLE customers
ADD CONSTRAINT fk_customers_lead_id FOREIGN KEY (customer_lead_id) REFERENCES leads (lead_id);

-- Add foreign key to installers for state_lookup
ALTER TABLE installers
ADD CONSTRAINT fk_installers_installer_state_id FOREIGN KEY (installer_state_id) REFERENCES state_lookup (state_id);

-- Add foreign key to bids for customers
ALTER TABLE bids
ADD CONSTRAINT fk_bids_bid_customer_id FOREIGN KEY (bid_customer_id) REFERENCES customers (customer_id);

-- Add foreign key to bids for installers
ALTER TABLE bids
ADD CONSTRAINT fk_bids_installer_id FOREIGN KEY (bid_installer_id) REFERENCES installers (installer_id);

-- Add foreign key to bids for solar_panels_lookup
ALTER TABLE bids
ADD CONSTRAINT fk_bids_solpanel_id FOREIGN KEY (bid_solpanel_id) REFERENCES solar_panels_lookup (solpanel_id);

