CREATE OR REPLACE FUNCTION prevent_adding_artifact_to_passed_exhibition()
RETURNS TRIGGER AS $$
BEGIN
    -- Checking the status of the current exhibition is not equal to 'passed' to avoid vulnerable changes of history
    IF EXISTS (
        SELECT 1
        FROM "Displayed_Artifacts" da
        JOIN "Exhibitions" e ON da.exhibition_id = e.exhibition_id
        WHERE artifact_id = NEW.artifact_id
        AND e.exhibition_status = 'passed'
    ) THEN
        RAISE EXCEPTION 'Cannot add artifacts to an exhibition with status "passed".';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


