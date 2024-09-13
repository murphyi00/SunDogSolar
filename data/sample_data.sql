-- SunDogSolar: Sample Data

-- Sample data for regions
INSERT INTO regions (region_name)
VALUES 
('Northeast'), 
('South'), 
('Midwest'), 
('West');

-- Sample data for power providers
INSERT INTO power_providers (provider_name, provider_resale_plan)
VALUES
('Pacific Gas & Electric', 0.25),
('Consolidated Edison', 0.29),
('Duke Nukem Energy', 0.50),
('Neon Cloud Light & Power', 0.12),
('Greater Barad-dûr Regional Utilities', 0.45),
('Sunshine Rainbow Power', 0.36);

-- Sample data for solar panels
INSERT INTO solar_panels_lookup (solpanel_price, solpanel_mfgr, solpanel_dims, solpanel_elec_spec)
VALUES
(450.32, 'Janus Component Mfg', '30x30', '25 kWh'),
(150.12, 'Econofail Inc.', '29x29', '15 kWh'),
(616.22, 'ACME Coyote Industries', '40x40', '125 kWh'),
(420.00, 'Better Green Products', '40x20', '42 kWh'),
(999.32, 'Biggs Ripov Supplies', '50x50', '16 kWh');

-- Sample data for state lookup
INSERT INTO state_lookup (state_id, state_name, state_region_id)
VALUES
('AK', 'Alaska', 4),
('CA', 'California', 4),
('TX', 'Texas', 2),
('NY', 'New York', 1),
('FL', 'Florida', 2),
('IL', 'Illinois', 3);

