alter table ecs.Spind add constraint DF_Spind_ActiveAtUTC default getutcdate() for ActiveAtUTC;
