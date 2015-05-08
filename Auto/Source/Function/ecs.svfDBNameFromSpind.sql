create function ecs.svfDBNameFromSpind()
returns sysname
as
begin;
   declare @DBName sysname
   set @DBName = (
                  select DBName
                    from ecs.Spind
                   where SPID = @@spid
                 );
   return @DBName;
end;