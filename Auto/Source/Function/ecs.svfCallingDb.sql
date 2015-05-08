create function ecs.svfCallingDb()
returns sysname
as
begin;
   declare @db sysname;
   select @db = databases.name
     from sys.dm_tran_locks
     join sys.databases
       on databases.database_id = dm_tran_locks.resource_database_id
    where dm_tran_locks.resource_type = N'DATABASE'
      and dm_tran_locks.request_session_id = @@SPID
      and dm_tran_locks.request_mode = N'S'
      and dm_tran_locks.request_status = N'GRANT'
      and dm_tran_locks.request_owner_type = N'SHARED_TRANSACTION_WORKSPACE'
      and dm_tran_locks.resource_database_id != DB_ID()
   set @db = coalesce(@db,db_name())
   return @db;
end;
