create function ecs.svfBitmaskFromValues (@Values nvarchar(max))
returns bigint
as
begin;
   declare @return bigint = 0;
   set @Values = ','+@Values+',';

   ;with CTE
   as (
       select substring(@Values,N+1,charindex(',',@Values,N+1)-N-1) 'BitmaskValue'
         from ecs.Tally
        where N < len(@Values)
          and substring(@Values,N,1) = ','
      )
   select @return = @return + Bitmask
     from ecs.StatusBitmask
     join CTE
       on CTE.BitmaskValue = StatusBitmask.BitmaskValue

   return @return;
end;