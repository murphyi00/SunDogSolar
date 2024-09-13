-- SunDogSolar: User-Defined Functions

-- Function to concatenate two strings with a separator
CREATE OR ALTER FUNCTION f_concat (
    @a VARCHAR(128), 
    @b VARCHAR(128), 
    @sep VARCHAR(128)
)
RETURNS VARCHAR(256)
AS 
BEGIN 
    RETURN @a + @sep + @b;
END;
GO

-- Function to get state from zipcode
CREATE OR ALTER FUNCTION f_zip2state (@zipcode INT)
RETURNS CHAR(2)
AS 
BEGIN
    RETURN (
        SELECT z.zipcode_state_id 
        FROM zipcodes z 
        WHERE z.zipcode_id = @zipcode
    );
END;
GO

-- Function to get leads for a salesperson
CREATE OR ALTER FUNCTION f_leads4salesperson (@salesperson_id INT) 
RETURNS TABLE 
AS
RETURN (
    SELECT L.* 
    FROM leads L
    JOIN zipcodes z ON z.zipcode_id = L.lead_zipcode
    JOIN state_lookup st ON st.state_id = z.zipcode_state_id
    JOIN regions r ON r.region_id = st.state_region_id
    JOIN salespersons sp ON sp.salesperson_region_id = r.region_id
    WHERE sp.salesperson_id = @salesperson_id
);
GO

-- Function to get customers for an installer
CREATE OR ALTER FUNCTION f_customers4installer (@installer_id INT) 
RETURNS TABLE 
AS
RETURN (
    SELECT * 
    FROM customers c
    JOIN installers i ON i.installer_state_id = c.customer_state_id
    WHERE i.installer_id = @installer_id
);
GO

