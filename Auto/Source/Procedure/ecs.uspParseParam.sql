create procedure ecs.uspParseParam (
                                    @p1     nvarchar(max)
                                  , @obj    ecs.obj       output
                                  , @method ecs.method    output
                                  , @parms  nvarchar(max) output
                                  , @log    bit = null
                                   ) as
begin;
   set nocount on;
   declare @ret    int;
   declare @me     sysname = object_name(@@procid);
   declare @logVal nvarchar(max);

   exec @ret = ecs.uspLog @@procid, @p1, @log;
   if charindex('(',@p1) = 0
   or charindex(')',@p1) = 0
   or charindex('.',@p1) = 0
   or charindex('(',@p1) < charindex('.',@p1)
   or charindex(')',@p1) < charindex('(',@p1)
   begin;
      raiserror('%s: Could not parse input: use object.method(parameters)',16,1,@me);
      set @logVal = '<Error> ' + @me + ' Could not parse input';
      exec @ret = ecs.uspLog @@procid, @logVal, @log;
      return -100;
   end;
   set @parms = replace(reverse(left(reverse(@p1),charindex('(',reverse(@p1)) -1)),')','');
   set @p1 = left(@p1,len(@p1)-(len(@parms)+2));

   set @method = reverse(left(reverse(@p1),charindex('.',reverse(@p1))-1));
   set @p1 = left(@p1,len(@p1)-(len(@method)+1));

   set @obj=@p1;

   return 0;
end;