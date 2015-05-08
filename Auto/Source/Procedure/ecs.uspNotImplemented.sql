create procedure ecs.uspNotImplemented as
begin;
   exec ecs.uspLog @Procid = @@procid, @value = 'not implemented error', @log = 1;
   raiserror('NOT IMPLEMENTED',16,1);
   return -1;
end;