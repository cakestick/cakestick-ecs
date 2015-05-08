create procedure ecs.uspUserReport (
                                    @LogUser sysname  = null
                                  , @Start   datetime = null
                                  , @End     datetime = null
                                  , @log     bit      = null
                                   ) as
begin;
   declare @ret      int;
   declare @out      nvarchar(max) = N''
   declare @StartInt bigint;
   declare @EndInt   bigint;

   set @LogUser = coalesce(@LogUser,suser_sname());
   set @Start = coalesce(@Start,dateadd(hour,-1,getutcdate()));
   set @end = coalesce(@End,getutcdate());

   set @StartInt = cast(replace(replace(replace(replace(convert(char(23),@Start,121),'-',''),' ',''),'.',''),':','') as bigint);
   set @EndInt = cast(replace(replace(replace(replace(convert(char(23),@End,121),'-',''),' ',''),'.',''),':','') as bigint);

   exec @ret = ecs.uspLog @procid = @@procid
                        , @value  = null
                        , @log    = @log;

   select @out = @out
        + convert(char(19),LoggedAtUTC,121)
        + '  '
        + cast(LogValue as nvarchar(2000))
        + char(13)+char(10)
     from ecs.ecsLog
    where LogUser = @LogUser
      and TimeInt < @endint
      and TimeInt > @startint
   order by TimeInt, ecsLogId;

   if len(@out)>2
      set @out = left(@out,len(@out)-2);

   exec ecs.uspOut @out,0,0;

   return 0;

end;