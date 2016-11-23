# db-schema-updater
schema-enginge.sh Updates DB schema from numbered files in scripts folder and keeps track of the current version of db at DB

e.g.

010.CreateTables.sql

014CreateUserTable.sql

-- later added

025.PopulateUserTable.sql

035UpdateUserTable.sql

Runs the scripts against the DB in the above order. Later added will be run against the DB after their addition to scripts folder.

Scripts already run, won't be run because schema-engine.sh script keeps track of the point upto the scripts in scripts folder have been run. (in DB) 

Srcipt expects that the script unix user has full rights to the postgre demodb i.e. finer security has not been implemented yet.

TODO: provision scripts for the script solution to ease its taking into use
TODO: parameterize the demodb in script to any db that is needed

TEST Scripts: 
Contained test scripts include erroneus script to test script's error behavior  
It is the script number 120
Script execution stops there
to proceed one may rename the table name of the table being created or delete the erroneus script and run the schema-engine.sh again 
