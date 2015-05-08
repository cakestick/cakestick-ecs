create procedure ecs.uspEcs (
                             @Param  nvarchar(max) = null
                           , @DBName sysname       = null
                            ) as
begin;
   set nocount on;
   declare @ret    int = -1;
   declare @log    bit = ecs.svfConfigValue('log');
   declare @Obj    ecs.Obj;
   declare @Method ecs.method;
   declare @parms  nvarchar(max);
   declare @p      nvarchar(max);
   declare @USProc ecs.Obj;
   declare @SQL    nvarchar(max);
   declare @Prm    nvarchar(max) = N'@p nvarchar(max), @log bit';
   declare @me     sysname = object_name(@@procid);
   declare @return int = 0;

   --
   -- Make sure @db is not null
   --
   set @DBName = coalesce(@DBName,ecs.svfCallingDb());

   --
   -- Logging:
   --
   exec @ret = ecs.uspLog @@procid, @Param, @log

   --
   -- SPIND entry:
   --
   exec @ret = ecs.uspSpind @DBName = @DBName
                          , @Param  = @Param
                          , @log    = @log;

   --
   -- If no parameters, display help:
   --
   if @Param is null
   begin;
      exec @ret = ecs.uspOut 'This is where we would print the help file.',0,0;
      exec @ret = ecs.uspNotImplemented;
      return 0;
   end;

   --
   -- Parse the parameters
   --
   exec @ret = ecs.uspParseParam @p1     = @Param
                               , @Obj    = @Obj    output
                               , @Method = @Method output
                               , @parms  = @parms  output;
   if @ret <> 0
      return @ret;

   --
   -- standardize the object
   --
   set @obj = ecs.svfStandardObject(@obj);

   if @Obj is null
   begin;
      set @p = 'Bad Object.'
      exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
      exec ecs.uspOut @p,1,0;
      return 0;
   end;

   if coalesce(@Method,'') = ''
   begin;
      set @p = 'Bad Method.'
      exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
      exec ecs.uspOut @p,1,0;
      return 0;
   end;

   -- if FIND; jump to Find proc:
   if @Method = 'find'
   begin;
      exec ecs.uspFind @Obj  = @Obj
                     , @Parm = @parms
                     , @log  = @log;
      return 0;
   end


   if @obj = 'DB'
   begin;
      begin try
         exec @return = ecs.uspDB @Method = @Method
                                , @Parm   = @parms
                                , @log    = @log
      end try
      begin catch
         set @p = 'uspDB: ' + error_message()
         set @return = error_number();
         exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
         raiserror('%s: %s',16,1,@me,@p);
         return @return;
      end catch
   end;

   if @obj = 'Table'
   begin;
      begin try
         exec @return = ecs.uspTable @Method = @Method
                                   , @Parm   = @parms
                                   , @log    = @log
      end try
      begin catch
         set @p = 'uspTable: ' + error_message()
         set @return = error_number();
         exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
         raiserror('%s: %s',16,1,@me,@p);
         return @return;
      end catch
   end;


   if @return <> 0
   begin;
      set @p = 'sub procedure returned error: ' + cast(@return as varchar(11));
      exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
      raiserror('%s: sub procedure returned error',15,1,@me);
      return -100;
   end;

   set @p = 'Complete.';
   exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
   exec @ret = ecs.uspOut @p,1,0;

   return 0;
end;