create function ecs.svfLoginNameFromXML(@x xml)
returns sysname
as
   begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/LoginName)[1]','sysname')
   return @Return;
   end;
go
