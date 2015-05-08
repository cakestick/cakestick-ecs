create table ecs.DDLEvent (
                           DDLEventId   bigint   not null identity(1,1)
                         , DataXML      xml          null
                         , LoginName    as ecs.svfLoginNameFromXML(DataXML)
                         , DBName       as ecs.svfDatabaseNameFromXML(DataXML)
                         , SchemaName   as ecs.svfSchemaNameFromXML(DataXML)
                         , ObjectName   as ecs.svfObjectNameFromXML(DataXML)
                         , ObjectType   as ecs.svfObjectTypeFromXML(DataXML)
                         , CreatedAtUCT datetime not null
                          );
