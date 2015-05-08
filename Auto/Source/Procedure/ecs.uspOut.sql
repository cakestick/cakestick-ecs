create procedure ecs.uspOut (
                             @output nvarchar(max)
                           , @format int = null
                           , @log    bit = null
                            ) as
begin;
   set nocount on;
   declare @ret int = -1;
   declare @m   int;
   declare @id  int;
   declare @b   varchar(max);
   declare @l   nvarchar(max);

   exec @ret = ecs.uspLog @@procid, null, @log;
   set @format = coalesce(@format,ecs.svfConfigValue('Default print format'));
   declare @cr char(2) = char(13) + char(10)
   declare @c char(1) = char(13);
   set @output = @c + replace(@output,@cr,@c) + @c;
   create table #t (
                    id  int           not null identity(1,1)
                  , txt nvarchar(max) not null
                   );
   insert #t (txt)
   select substring(@output,N+1,charindex(@c,@output,N+1)-N-1) 'Row'
     from ecs.Tally
    where N < len(@output)
      and substring(@output,N,1) = @c;
   set @m = (select max(len(txt)) from #t);
   set @id = 0;
   if @format = 0
   begin;
      set @b = replicate('*',@m);

      print '/*' + @b + '*\';
      while @id is not null
      begin
         set @id = (select min(id) from #t where id > @id)
         set @l = (select txt from #t where id = @id)
         if @l is not null
            print '| ' + rtrim(@l) + replicate(' ',@m-len(@l)) + ' |'
      end
      print '\*' + @b + '*/'
   end

   if @format = 1
   begin;
      print '--';
      while @id is not null
      begin
         set @id = (select min(id) from #t where id > @id)
         set @l = (select txt from #t where id = @id)
         if @l is not null
            print '-- ' + @l;
      end;
      print '--';

   end;

   drop table #t;

   return 0;
end;