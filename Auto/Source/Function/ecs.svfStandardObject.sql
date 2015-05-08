create function ecs.svfStandardObject (@UserValue ecs.Obj)
returns ecs.obj as
begin;
   declare @return ecs.Obj;
   set @return = (
                  select ecsValue
                    from ecs.UserValue
                   where UserValue = @UserValue
                 )
   return @return;

end;