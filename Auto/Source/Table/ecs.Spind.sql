create table ecs.Spind (
                        SPID        int           not null
                      , DBName      sysname       not null
                      , Input       nvarchar(max)     null
                      , ActiveAtUTC datetime      not null
                       );
