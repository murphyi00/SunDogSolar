-- SunDogSolar: Alter Tables - Add Constraints

-- 1. Add foreign key to state_lookup for regions
ALTER TABLE state_lookup
ADD CONSTRAINT fk_states_state_region_id FOREIGN KEY (state_region_id) REFERENCES regions (region_id);

-- 2. Add foreign key to state_coordinates for state_lookup
ALTER TABLE state_coordinates
ADD CONSTRAINT fk_state_coord_state_id FOREIGN KEY (state_coord_state_id) REFERENCES state_lookup (state_id);

-- 3. Add foreign key to leads for power_providers
ALTER TABLE leads
ADD CONSTRAINT fk_leads_lead_provider_id FOREIGN KEY (lead_provider_id) REFERENCES power_providers (provider_id);

-- 4. Add foreign key to leads for zipcodes
ALTER TABLE leads
ADD CONSTRAINT fk_leads_lead_zipcode FOREIGN KEY (lead_zipcode) REFERENCES zipcodes (zipcode_id);

-- 5. Add foreign key to salespersons for regions
ALTER TABLE salespersons
ADD CONSTRAINT fk_salesperson_region_id FOREIGN KEY (salesperson_region_id) REFERENCES regions (region_id);

-- 6. Add foreign key to proposals for leads
ALTER TABLE proposals
ADD CONSTRAINT fk_proposal_lead_id FOREIGN KEY (proposal_lead_id) REFERENCES leads (lead_id);

-- 7. Add foreign key to proposals for salespersons
ALTER TABLE proposals
ADD CONSTRAINT fk_proposal_salesperson_id FOREIGN KEY (proposal_salesperson_id) REFERENCES salespersons (salesperson_id);

-- 8. Add foreign key to customers for state_lookup
ALTER TABLE customers
ADD CONSTRAINT fk_customers_customer_state_id FOREIGN KEY (customer_state_id) REFERENCES state_lookup (state_id);

-- 9. Add foreign key to customers for salespersons
ALTER TABLE customers
ADD CONSTRAINT fk_customers_customer_salesperson_id FOREIGN KEY (customer_salesperson_id) REFERENCES salespersons (salesperson_id);

-- 10. Add foreign key to customers for leads
ALTER TABLE customers
ADD CONSTRAINT fk_customers_lead_id FOREIGN KEY (customer_lead_id) REFERENCES leads (lead_id);

-- 11. Add foreign key to installers for state_lookup
ALTER TABLE installers
ADD CONSTRAINT fk_installers_installer_state_id FOREIGN KEY (installer_state_id) REFERENCES state_lookup (state_id);

-- 12. Add foreign key to bids for customers
ALTER TABLE bids
ADD CONSTRAINT fk_bids_bid_customer_id FOREIGN KEY (bid_customer_id) REFERENCES customers (customer_id);

-- 13. Add foreign key to bids for installers
ALTER TABLE bids
ADD CONSTRAINT fk_bids_installer_id FOREIGN KEY (bid_installer_id) REFERENCES installers (installer_id);

-- 14. Add foreign key to bids for solar_panels_lookup
ALTER TABLE bids
ADD CONSTRAINT fk_bids_solpanel_id FOREIGN KEY (bid_solpanel_id) REFERENCES solar_panels_lookup (solpanel_id);

