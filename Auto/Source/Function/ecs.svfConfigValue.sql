create function [ecs].[svfConfigValue] (@ConfigKey varchar(64))
returns nvarchar(max) as
begin
   declare @r nvarchar(max) = (
                               select ConfigValue
                                 from ecs.Config
                                where ConfigKey = @ConfigKey
                              );
   return @r;
end;
