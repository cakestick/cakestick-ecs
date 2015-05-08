create procedure ecs.uspExecuteOnRemoteDB (
                                           @ScriptKey varchar(100)
                                         , @DBName    sysname = null
                                         , @log       bit     = null
                                          ) as
begin;
   set nocount on;
   declare @ret    int = 0;
   declare @sql    nvarchar(max);
   declare @LogVal nvarchar(max);
   declare @me     sysname = object_name(@@procid);

   exec @ret = ecs.uspLog @procid = @@procid, @value = @ScriptKey, @Log = @log;

   set @DBName = coalesce(@DBName,ecs.svfCallingDb());

   set @sql = ecs.svfGetScriptByKey(@scriptKey);
   set @sql = replace(@sql,'''','''''');
   set @sql = 'use ' + @DBName + ' exec(''' + @sql + ''')';
   set @sql = coalesce(@sql,'-- @Sql was null');

   set @LogVal = @me + ': ' + @sql;
   exec @ret = ecs.uspLog @procid = @@procid, @value = @LogVal, @Log = @log;

   exec @ret = sp_executesql @sql;
   set @LogVal = @me + ': Return from sp_executesql: ' + cast(@ret as varchar(11))
   exec @ret = ecs.uspLog @procid = @@procid, @value = @LogVal, @Log = @log;

   return @ret;

end;