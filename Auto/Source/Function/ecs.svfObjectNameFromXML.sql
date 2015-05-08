create function ecs.svfObjectNameFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/ObjectName)[1]','sysname')
   return @Return;
end;