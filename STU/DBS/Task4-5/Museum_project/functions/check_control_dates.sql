-- Create a function to verify shipping date is before borrow date and
-- delivering date is after return one to avoid wrong set values.
CREATE OR REPLACE FUNCTION check_control_dates()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM "Rental"
        WHERE NEW.shipping_date < borrow_date OR NEW.delivery_date < return_date
    ) THEN
        RAISE EXCEPTION 'Shipping and delivery dates must be within rental period.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



