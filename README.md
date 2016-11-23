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

## Prerequisites:

Postgresql installed

Postgresql client installed = psql

demodb created

script user created at the postgre sql and given full rigths to demodb

## TODO:

TODO1: parameterize the demodb in script to any db that is needed

TODO2: script the prerequisites above e.g. with ansible 

## TEST Scripts: 

Contained test scripts in scripts folder include erroneus script to test schema-engine.sh script's error behavior  
Script execution stops at erroneus script 120* and dirty_transaction file is appears in the engine directory
This simulates the error...

To simulate solving the error: 
one may rename the table being created in 120* script or delete the erroneus script all together 
remove dirty_transaction file
run the schema-engine.sh again continue running rest of the scripts

