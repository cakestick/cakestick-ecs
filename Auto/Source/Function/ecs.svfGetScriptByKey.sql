create function ecs.svfGetScriptByKey (
                                       @key varchar(100)
                                      )
returns nvarchar(max) as
begin;
   declare @r nvarchar(max);

   set @r = (
             select script
               from ecs.script
              where ScriptKey = @key
            );

   set @r = ecs.svfReplaceScript(@r);

   return @r;
end;