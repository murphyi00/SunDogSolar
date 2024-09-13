-- SunDogSolar: Stored Procedures

-- Stored Procedure to Convert a Lead to a Customer
CREATE OR ALTER PROCEDURE p_lead_convert2_customer (
    @customer_firstname VARCHAR(50),
    @customer_lastname VARCHAR(50),
    @customer_address1 VARCHAR(50),
    @customer_email VARCHAR(50),
    @customer_city VARCHAR(50),
    @customer_state_id CHAR(2),
    @customer_salesperson_id INT,
    @leads_lead_id INT,
    @p_reply VARCHAR(256) OUTPUT
)
AS 
BEGIN TRANSACTION
    DECLARE @message50101 VARCHAR(256);
    SET @message50101 = 'The email: "' + @customer_email + '" is already in use by another customer.';
    
    BEGIN TRY 
        -- EMAIL CHECK
        IF (@customer_email IN (SELECT c.customer_email FROM customers c))
        BEGIN;
            THROW 50101, @message50101, 1;
        END
        
        -- LEAD ID CHECK
        IF (@leads_lead_id NOT IN (SELECT L.lead_id FROM leads L))
        BEGIN;
            THROW 50102, 'That is not a valid lead id', 1;
        END
        
        IF ((SELECT L.lead_status FROM leads L WHERE L.lead_id = @leads_lead_id) = 'CONVERTED')
        BEGIN;
            THROW 50103, 'That lead id has already been converted', 1;
        END
        
        -- Insert into customers table
        INSERT INTO customers (customer_firstname, customer_lastname, customer_address1, customer_email, customer_city, customer_state_id, customer_salesperson_id, customer_lead_id)
        VALUES (@customer_firstname, @customer_lastname, @customer_address1, @customer_email, @customer_city, @customer_state_id, @customer_salesperson_id, @leads_lead_id);
        
        -- Update leads table
        UPDATE leads SET lead_status = 'CONVERTED' WHERE lead_id = @leads_lead_id;
        SET @p_reply = 'Customer inserted as ' + @customer_email;
        
        COMMIT;
    END TRY
    BEGIN CATCH
        SET @p_reply = 'Error: ' + ERROR_MESSAGE();
        ROLLBACK;
    END CATCH;
GO

-- Stored Procedure for Installer to Create a Bid
CREATE OR ALTER PROCEDURE p_installer_create_bid (
    @bid_installer_id INT,
    @customer_id4bid INT,
    @bid_amount MONEY,
    @bid_solar_panel_id INT,
    @p_reply VARCHAR(256) OUTPUT
)
AS 
BEGIN TRANSACTION
    BEGIN TRY
        -- Insert into bids table
        INSERT INTO bids (bid_installer_id, bid_customer_id, bid_amount, bid_solpanel_id, bid_date, bid_status)
        VALUES (@bid_installer_id, @customer_id4bid, @bid_amount, @bid_solar_panel_id, CURRENT_TIMESTAMP, 'NEW');
        
        -- Update leads table to change status to 'BIDDING'
        UPDATE leads SET lead_status = 'BIDDING' WHERE lead_id = (SELECT c.customer_lead_id FROM customers c WHERE c.customer_id = @customer_id4bid);
        
        SET @p_reply = 'Bid created successfully.';
        COMMIT;
    END TRY
    BEGIN CATCH
        SET @p_reply = 'Error: ' + ERROR_MESSAGE();
        ROLLBACK;
    END CATCH;
GO

