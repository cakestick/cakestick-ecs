create function ecs.tvfValuesFromBitmask(@bitmask bigint)
returns table
as
return (
        select BitmaskValue
          from ecs.StatusBitmask
         where StatusBitmask.Bitmask&@bitmask <> 0
       );
