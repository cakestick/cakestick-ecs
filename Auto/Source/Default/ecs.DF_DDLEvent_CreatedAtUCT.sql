alter table ecs.DDLEvent add constraint DF_DDLEvent_CreatedAtUCT default getutcdate() for CreatedAtUCT;
