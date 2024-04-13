-- Create a trigger to call a function before inserting and updating records in the Control table
CREATE TRIGGER trigger_check_control_dates_within_rental_dates
BEFORE INSERT OR UPDATE ON "Control"
FOR EACH ROW EXECUTE FUNCTION check_control_dates();

-- This trigger will run before inserting and updating records in the Control table.
-- It checks that the values in the shipping date is before borrow date and
-- delivering date is after return date in the Rental table.
-- If the values do not meet this condition, an exception will be thrown.