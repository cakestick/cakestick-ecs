
create table [ecs].[ECSLog] (
                             [ECSLogId]    bigint        not null identity(1,1)
                           , [Spid]        int           not null
                           , [LogValue]    nvarchar(max) not null
                           , [LogUser]     sysname       not null
                           , [DBName]      sysname       not null
                           , [LoggedAtUTC] datetime      not null
                           , [TimeInt] as (CONVERT([bigint],replace(replace(replace(replace(CONVERT([char](23),[LoggedAtUTC],(21)),'-',''),'.',''),' ',''),':',''),0))
                            );