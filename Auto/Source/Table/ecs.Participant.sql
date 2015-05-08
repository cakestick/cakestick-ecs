create table ecs.Participant (
                              ParticipantId int      not null identity(1,1)
                            , DBName        sysname  not null
                            , CreatedAtUTC  datetime not null
                            , StatusBitmask int      not null
                             );
