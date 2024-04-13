-- Create a trigger to call a function before inserting into the "Displayed_Artifacts" table
CREATE TRIGGER trigger_prevent_adding_artifact_to_passed_exhibition
BEFORE INSERT ON "Displayed_Artifacts"
FOR EACH ROW EXECUTE FUNCTION prevent_adding_artifact_to_passed_exhibition();

-- This triggers will run before a record is inserted into the "Displayed_Artifacts" table.
-- The function checks the status of the current exhibition is not equal to 'passed':
    -- If the new article is adding to exhibition with status 'passed';
-- an exception will be thrown and the insertion of the entry will be canceled.