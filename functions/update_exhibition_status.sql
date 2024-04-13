-- Create a function to update the exhibition status
-- This code automatically set the exhibition_status based on the current date and the start_date and end_date
CREATE OR REPLACE FUNCTION update_exhibition_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.start_date > CURRENT_TIMESTAMP THEN
        NEW.exhibition_status := 'preparation';
    ELSIF NEW.end_date < CURRENT_TIMESTAMP THEN
        NEW.exhibition_status := 'passed';
    ELSE
        NEW.exhibition_status := 'active';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

