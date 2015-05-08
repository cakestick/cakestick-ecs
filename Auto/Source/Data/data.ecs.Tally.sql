;with cte (N)
as (
    select top 30000
           row_number() over (order by sc1.id) 'N'
      from Master.dbo.syscolumns sc1
         , Master.dbo.syscolumns sc2
   )
insert ecs.Tally (N)
select cte.N
   from cte