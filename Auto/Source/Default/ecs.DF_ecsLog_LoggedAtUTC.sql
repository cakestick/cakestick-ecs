alter table ecs.ecsLog add constraint DF_ecsLog_LoggedAtUTC default getutcdate() for LoggedAtUTC;
