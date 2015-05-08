alter table ecs.ecsLog add constraint DF_ecsLog_DBName default ecs.svfCallingDB() for DBName;
