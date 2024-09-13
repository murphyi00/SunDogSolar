-- SunDogSolar: Triggers

-- Trigger to handle insert into proposals
CREATE OR ALTER TRIGGER trig_proposals_insert
    ON proposals
    INSTEAD OF INSERT 
AS  
BEGIN
    DECLARE @prop_leadID INT;
    
    -- Check if multiple inserts are attempted
    IF ((SELECT COUNT(*) FROM inserted) > 1)
        THROW 90909990, 'This application does not allow multiple inserts into the proposals table.', 1;
    
    -- Get the lead ID from the inserted record
    SET @prop_leadID = (SELECT i.proposal_lead_id FROM inserted i);
    
    BEGIN TRY
        -- If lead ID already exists in proposals, delete the old one and insert the new record
        IF (@prop_leadID IN (SELECT p.proposal_lead_id FROM proposals p))
        BEGIN
            DELETE FROM proposals WHERE proposal_lead_id = @prop_leadID;
            INSERT INTO proposals (proposal_lead_id, proposal_salesperson_id, proposal_panel_type, proposal_panels_qty, proposal_total_cost)
            SELECT proposal_lead_id, proposal_salesperson_id, proposal_panel_type, proposal_panels_qty, proposal_total_cost FROM inserted;
        END
        ELSE
        BEGIN
            INSERT INTO proposals (proposal_lead_id, proposal_salesperson_id, proposal_panel_type, proposal_panels_qty, proposal_total_cost)
            SELECT proposal_lead_id, proposal_salesperson_id, proposal_panel_type, proposal_panels_qty, proposal_total_cost FROM inserted;
        END
        
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH;
END;
GO

