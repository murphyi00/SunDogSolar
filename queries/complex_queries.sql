-- SunDogSolar: Complex Queries

-- Retrieve all leads along with their corresponding salespersons and regions
WITH LeadDetails AS (
    SELECT l.lead_id, l.lead_electric_bill_amt, l.lead_roof_sqrft, sp.salesperson_firstname, sp.salesperson_lastname, r.region_name
    FROM leads l
    JOIN salespersons sp ON sp.salesperson_id = (SELECT dbo.f_lead2salesperson(l.lead_id))
    JOIN regions r ON sp.salesperson_region_id = r.region_id
)
SELECT * FROM LeadDetails;

-- Calculate the average proposal cost by region
WITH ProposalCosts AS (
    SELECT p.proposal_total_cost, r.region_name
    FROM proposals p
    JOIN salespersons sp ON p.proposal_salesperson_id = sp.salesperson_id
    JOIN regions r ON sp.salesperson_region_id = r.region_id
)
SELECT region_name, AVG(proposal_total_cost) AS avg_cost
FROM ProposalCosts
GROUP BY region_name;

