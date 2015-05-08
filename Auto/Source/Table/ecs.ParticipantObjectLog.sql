create table ecs.ParticipantObjectLog (
                                       ParticipantObjectLogId bigint         not null identity(1,1)
                                     , ParticipantObjectId    bigint         not null
                                     , ActionUTC              datetime       not null
                                     , LoginName              sysname        not null
                                     , ActionText             nvarchar(1024) not null
                                      );