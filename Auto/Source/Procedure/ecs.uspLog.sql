create procedure ecs.uspLog (
                             @procid int
                           , @value  nvarchar(max) = null
                           , @log    bit           = null
                            ) as
begin;
   set nocount on;

   if coalesce(@log,ecs.svfConfigValue('log')) = 0
      return 0;

   declare @t int = @@nestlevel
   if @t > 2
      set @t = @t-3;
   else
      set @t = 0;

   insert ecs.ecsLog (
                      LogValue
                     )
   values (
           replicate('-',@t) + object_name(@procid) + coalesce(' ' + @value,'')
          );

   return 0;
end;