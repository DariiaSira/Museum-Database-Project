CREATE OR REPLACE FUNCTION prevent_duplicate_artifact_display()
RETURNS TRIGGER AS $$
BEGIN
    -- Verifying that the artifact is not already on display at another active exhibit.
    -- The artifact could be exhibited only within one exposition, so it is impossible for one artwork to be in
    -- two different expositions at the same time (to be in two active exhibitions).
    IF EXISTS (
        SELECT 1
        FROM "Displayed_Artifacts" da
        JOIN "Exhibitions" e ON da.exhibition_id = e.exhibition_id
        WHERE artifact_id = NEW.artifact_id
        AND da.exhibition_id <> NEW.exhibition_id
        AND e.exhibition_status = 'active'
    ) THEN
        RAISE EXCEPTION 'The artifact is already displayed at another exhibition.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


