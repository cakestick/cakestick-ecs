alter table ecs.ecsLog add constraint DF_ecsLog_LogUser default system_user for LogUser;
