-- Check MySQL Version
SELECT VERSION();

-- Verify local_infile
SHOW VARIABLES LIKE 'local_infile';

-- Verify SQL Mode
SELECT @@sql_mode;

-- Current Database
SELECT DATABASE();