create procedure ecs.uspDB (
                            @Method ecs.method
                          , @Parm   nvarchar(max)
                          , @log    bit = null
                           ) as
begin;
   declare @me      sysname = object_id(@@procid);
   declare @ret     int;
   declare @DBName  sysname = ecs.svfDBNameFromSpind();
   declare @p       nvarchar(max) = @DBName + ' ' + @Method + ' ' + @Parm;
   declare @Bitmask bigint = 0;

   if @Method is null
   or @parm is null
   begin;
      raiserror ('%s: Parameters must not be null',16,1,@me);
      return -100;
   end;
   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;

   if @Method = 'watch'
   begin;
      set @p = 'Watch database: ' + @dbname;
      exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;
      if coalesce(@Parm,'') = ''
      begin;
         set @Parm = 'Now';
      end;

      exec @ret = ecs.uspNotImplemented;
      return 0
   end;

   set @p = 'Unknown Method';
   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;
   return -100;

end;