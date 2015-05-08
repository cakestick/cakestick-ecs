create function ecs.svfObjectTypeFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/ObjectType)[1]','sysname')
   return @Return;
end;
