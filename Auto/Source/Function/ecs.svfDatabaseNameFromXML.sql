create function ecs.svfDatabaseNameFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/DatabaseName)[1]','sysname')
   return @Return;
end;
