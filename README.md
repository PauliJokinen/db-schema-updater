# db-schema-updater
Updates DB schema from numbered files in file system and keeps track of the version at DB

e.g.

010.CreateTables.sql
014CreateUserTable.sql

-- later added

025.PopulateUserTable.sql
035UpdateUserTable.sql

Runs the scripts against the DB in the above order. Later added will be run again the DB after their addition to file system.
Script remembers which scripts I has already run and stores the current version information at the DB table.
