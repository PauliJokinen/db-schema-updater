
-- Create table:
-- SELECT max(current_version) FROM schema_version;

SELECT current_version FROM schema_version ORDER BY current_version DESC LIMIT 1;
