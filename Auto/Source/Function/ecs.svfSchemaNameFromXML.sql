create function ecs.svfSchemaNameFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/SchemaName)[1]','sysname')
   return @Return;
end;
