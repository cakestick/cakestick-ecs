create procedure ecs.uspSpind (
                               @DBName sysname
                             , @param  nvarchar(max)
                             , @log    bit = null
                              ) as
begin;
   set nocount on;
   declare @ret     int = -1;
   declare @logVal  nvarchar(max);
   declare @minutes int = ecs.svfConfigValue('SpindTimeoutMinutes');

   exec @ret = ecs.uspLog @@procid, @DBName, @log

   delete ecs.spind
    where spid = @@spid
       or ActiveAtUTC < dateadd(minute, (@minutes*-1),getutcdate());

   insert ecs.spind (
                     SPID
                   , DBName
                   , Input
                   , ActiveAtUTC
                    )
   values (
           @@spid
         , @DBName
         , @param
         , getutcdate()
          );

   return 0;

end;