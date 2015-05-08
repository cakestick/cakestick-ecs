alter table ecs.ParticipantLog add constraint DF_ParticipantLog_LoginName default system_user for LoginName;
