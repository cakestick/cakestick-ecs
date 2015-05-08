create table ecs.ParticipantObject (
                                    ParticipantObjectId bigint  not null identity(1,1)
                                  , ParticipantId       int     not null
                                  , ObjectTypeId        int     not null
                                  , SchemaName          sysname not null
                                  , ObjectName          sysname not null
                                  , ParentObjectName    sysname     null
                                   );