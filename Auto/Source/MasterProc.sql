use master
go
set QUOTED_IDENTIFIER on
go
if object_id(N'[dbo].[sp_ecs]') is null
   exec ('create PROCEDURE [dbo].[sp_ecs] as begin return 0 end')
go
alter procedure dbo.sp_ecs (
                            @param1 nvarchar(max) = null
                           ) as

   declare @db sysname
   declare @ret int;
   select @db = databases.name
     from sys.dm_tran_locks
     join sys.databases
       on databases.database_id = dm_tran_locks.resource_database_id
    where dm_tran_locks.resource_type = N'DATABASE'
      and dm_tran_locks.request_session_id = @@SPID
      and dm_tran_locks.request_mode = N'S'
      and dm_tran_locks.request_status = N'GRANT'
      and dm_tran_locks.request_owner_type = N'SHARED_TRANSACTION_WORKSPACE'
      and dm_tran_locks.resource_database_id != DB_ID();

   set @db = coalesce(@db,db_name());

   exec @ret = ecs.ecs.uspEcs @param1
                             , @db;

   return @ret;
go
exec sp_ms_marksystemobject 'dbo.sp_ecs';
go
use ecs;