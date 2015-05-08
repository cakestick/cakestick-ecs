insert ecs.Script ([ScriptKey],[Script])
values
('Create DDL Trigger','create trigger ecsTrgDLLDatabase on database
for DDL_DATABASE_LEVEL_EVENTS
as
begin
    if object_id(N''|me|.ecs.uspDDLTrigger'') is not null
        begin;
        declare @x xml = EVENTDATA()
        exec |me|.ecs.uspDDLTrigger @x
        end;
end'),
('Drop DLL Trigger','if EXISTS (SELECT * FROM sys.triggers WHERE name = ''ecsTrgDLLDatabase'' and parent_class_desc = ''DATABASE'') drop trigger ecsTrgDLLDatabase on database;'),
('ObjectCTE','
;with objs as (
select o.object_id
     , s.name ''schemaname''
     , o.name ''objectName''
     , o.type ''ObjectType''
     , o.Modify_Date ''ModifyDate''
     , cast(null as sysname) ''ParentObject''
  from [|db|].sys.objects o
  join [|db|].sys.schemas s
    on s.schema_id = o.schema_id
where o.is_ms_shipped = 0
union
select cast(null as int)
     , s.name ''schemaname''
     , t.name ''objectName''
     , o.type ''ObjectType''
     , o.Modify_Date ''ModifyDate''
     , cast(null as sysname) ''ParentObject''
  from [|db|].sys.table_types t
  join [|db|].sys.objects o
    on o.object_id = t.type_table_object_id
  join [|db|].sys.schemas s
    on s.schema_id = t.schema_id
union
select o.object_id
     , s.name
     , i.name
     , ''IX''
     , o.Modify_Date
     , o.name as ''ParentObject''
  from [|db|].sys.indexes i
  join [|db|].sys.objects o
    on o.object_id = i.object_id
  join [|db|].sys.schemas s
    on s.schema_id = o.schema_id
 where i.name is not null
   and o.is_ms_shipped <> 1
   and i.is_primary_key = 0
)
'),
('Remote Create Certificate','create certificate [|CertificateName|] from file = ''|certBackupLocation|'''),
('Remote Create User','create user [|CertifiateUser|] from certificate [|CertificateName|]'),
('Remote Grant Authenticate','grant authenticate to [|CertifiateUser|]'),
('Remote Grant Select','grant select to [|CertifiateUser|]'),
('Remote Remove Certificate','if exists (select * from sys.certificates where name = ''|CertificateName|'') drop certificate [|CertificateName|]'),
('Remote Remove User','if exists (select * from sys.database_principals where name = ''|CertifiateUser|'' and type = ''C'') drop user [|CertifiateUser|]');
