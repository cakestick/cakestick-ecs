alter table ecs.ParticipantLog add constraint DF_ParticipantLog_ActionUTC default getutcdate() for ActionUTC;
