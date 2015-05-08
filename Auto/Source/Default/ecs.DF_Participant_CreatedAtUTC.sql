alter table ecs.Participant add constraint DF_Participant_CreatedAtUTC default getutcdate() for CreatedAtUTC;
