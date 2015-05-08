alter table ecs.ParticipantObjectLog add constraint DF_ParticipantObjectLog_ActionUTC default getutcdate() for ActionUTC;
