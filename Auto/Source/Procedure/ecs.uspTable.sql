create procedure ecs.uspTable (
                               @Method ecs.method
                             , @Parm   nvarchar(max)
                             , @log    bit = null
                              ) as
begin;
   declare @me      sysname = object_id(@@procid);
   declare @ret     int;
   declare @DBName  sysname = ecs.svfDBNameFromSpind();
   declare @p       nvarchar(max) = @DBName + ' ' + @Method + ' ' + @Parm;
   if @Method is null
   or @parm is null
   begin;
      raiserror ('%s: Parameters must not be null',16,1,@me);
      return -100;
   end;
   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;


   exec @ret = ecs.uspNotImplemented;

   return 0;
end;