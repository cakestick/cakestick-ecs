if object_id(N'ecs.uspFind') is not null
   drop procedure ecs.uspFind
go
create procedure ecs.uspFind (
                              @Obj  ecs.obj
                            , @Parm nvarchar(max) = null
                            , @log  bit           = null
                             ) as
begin;
   set nocount on;
   declare @me      sysname = object_id(@@procid);
   declare @ret     int;
   declare @DBName  sysname       = ecs.svfCallingDB();
   declare @sql     nvarchar(max);
   declare @params  nvarchar(max) = '@UserValue ecs.obj, @objectName sysname, @Schema sysname';
   declare @Schema  sysname       = '%';

   declare @p nvarchar(max) = coalesce(@obj,'NULL') + ' ' + coalesce(@Parm,'NULL');

   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;

   if coalesce(@Parm,'') = ''
      set @Parm = '%';

   if charindex('.',@Parm) > 1
   begin;
      set @Schema = (
                     select left(@Parm,charindex('.',@Parm)-1)
                    );
      set @Parm = (
                   select right(@Parm,len(@parm)-charindex('.',@Parm))
                  )
   end;

   set @schema = replace(replace(@schema,'[',''),']','');
   set @Parm = replace(replace(@Parm,'[',''),']','')

   set @sql = ecs.svfGetScriptByKey('ObjectCTE');
   set @sql = @sql + 'select distinct o.object_id,o.schemaname,o.objectName,o.objecttype,o.parentobject,o.modifydate from objs o ';
   set @sql = @sql + 'join ecs.vwUserValueToSQLType on vwUserValueToSQLType.type = o.objecttype ';
   set @sql = @sql + 'where o.objectName like @objectName ';
   set @sql = @sql + 'and o.schemaname like @Schema '
   if @obj <> 'OBJ'
   begin;
      set @sql = @sql + 'and vwUserValueToSQLType.ECSValue = @UserValue ';
   end;
   set @sql = @sql + 'order by o.objecttype, o.objectname, o.schemaname';

   exec sp_executesql @sql
                    , @params
                    , @UserValue  = @obj
                    , @Schema     = @Schema
                    , @objectName = @Parm;

   return 0;
end;