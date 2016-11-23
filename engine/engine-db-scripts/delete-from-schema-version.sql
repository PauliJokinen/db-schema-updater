
-- Create table:
-- SELECT max(current_version) FROM schema_version;

DELETE FROM schema_version  WHERE current_version NOT IN
(
SELECT current_version FROM schema_version ORDER BY current_version DESC LIMIT 1
);
