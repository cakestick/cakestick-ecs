create table ecs.ParticipantLog (
                                 ParticipantLogId bigint         not null identity (1,1)
                               , ParticipantId    int            not null
                               , ActionUTC        datetime       not null
                               , LoginName        sysname        not null
                               , ActionText       nvarchar(1024) not null
                                );
