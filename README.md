# db-schema-updater
Updates DB schema from numbered files in file system and keeps track of the version at DB

e.g.

010.CreateTables.sql

014CreateUserTable.sql

-- later added

025.PopulateUserTable.sql

035UpdateUserTable.sql

Runs the scripts against the DB in the above order. Later added will be run against the DB after their addition to file system.
Scripts already run, won't be run because script keeps track of the point upto the scripts have been run in a DB table.

Tips:

To get the script demo working, download git for windows according to these instructions
https://www.atlassian.com/git/tutorials/install-git/windows

In the installation, accept the defaults options on all questions

Next clone:



