/** File:          C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Artifacts\ECS.SQL **/
/** Source:        C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\buildscripts\FullBuild.txt **/
/** Build Machine: BEL4C1053 **/
/** Build Date:    2015-05-06 11:35:09 **/
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\/Source/DropAll.sql'
go
/*****************************************************************************\
|                                                                             |
|  Drop Views                                                                 |
|                                                                             |
\*****************************************************************************/
print '----- Drop Views: -----------------------------------------------------'
go
if object_id(N'ecs.vwUserValueToSQLType') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop vwUserValueToSQLType'
   drop view ecs.vwUserValueToSQLType;
end;
go
/*****************************************************************************\
|                                                                             |
|  Drop Tables                                                                |
|                                                                             |
\*****************************************************************************/
print '----- Drop Tables: -----------------------------------------------------'
if object_id(N'ecs.Tally') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop Tally'
   drop table ecs.Tally;
end;
go
if object_id(N'ecs.DDLEvent') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop DDLEvent'
   drop table ecs.DDLEvent;
end;
go
if object_id(N'ecs.Script') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop Script'
   drop table ecs.Script;
end;
go
if object_id(N'ecs.Config') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop Config'
   drop table ecs.Config;
end;
go
if object_id(N'ecs.Spind') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop Spind'
   drop table ecs.Spind;
end;
go
if object_id(N'[ecs].[ECSLog]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ECSLog'
   drop table ecs.ECSLog;
end;
go
if object_id(N'ecs.ObjMethodProc') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ObjMethodProc'
   drop table ecs.ObjMethodProc;
end;
go
if object_id(N'ecs.UserValue') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop UserValue'
   drop table ecs.UserValue;
end;
go
if object_id(N'ecs.ecsValue') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ecsValue'
   drop table ecs.ecsValue;
end;
go
if object_id(N'ecs.ParticipantObjectLog') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ParticipantObjectLog'
   drop table ecs.ParticipantObjectLog;
end;
go
if object_id(N'ecs.ParticipantObject') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ParticipantObject'
   drop table ecs.ParticipantObject;
end;
go
if object_id(N'ecs.ObjectType') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ObjectType'
   drop table ecs.ObjectType;
end;
go
if object_id(N'ecs.ParticipantLog') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ParticipantLog'
   drop table ecs.ParticipantLog;
end;
go
if object_id(N'ecs.Participant') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop Participant'
   drop table ecs.Participant;
end;
go
if object_id(N'ecs.StatusBitmask') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop StatusBitmask'
   drop table ecs.StatusBitmask;
end;
go
if object_id(N'ecs.ECSToSQLTypes') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ECSToSQLTypes'
   drop table ecs.ECSToSQLTypes;
end;
go
/*****************************************************************************\
|                                                                             |
|  Drop Functions used in calculated fields                                   |
|                                                                             |
\*****************************************************************************/
print '----- Drop Functions (Calculated Fields/Defaults): ---------------------'
if object_id(N'ecs.svfLoginNameFromXML') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfLoginNameFromXML'
   drop function ecs.svfLoginNameFromXML
end;
go
if object_id(N'ecs.svfDatabaseNameFromXML') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfDatabaseNameFromXML'
   drop function ecs.svfDatabaseNameFromXML
end;
go
if object_id(N'ecs.svfSchemaNameFromXML') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfSchemaNameFromXML'
   drop function ecs.svfSchemaNameFromXML
end;
go
if object_id(N'ecs.svfObjectNameFromXML') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfObjectNameFromXML'
   drop function ecs.svfObjectNameFromXML
end;
go
if object_id(N'ecs.svfObjectTypeFromXML') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfObjectTypeFromXML'
   drop function ecs.svfObjectTypeFromXML
end;
go
if object_id(N'[ecs].[svfCallingDb]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfCallingDb'
   drop FUNCTION [ecs].[svfCallingDb]
end;
go
if object_id(N'ecs.svfConfigValue') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfConfigValue'
   drop function ecs.svfConfigValue;
end;
go
/*****************************************************************************\
|                                                                             |
|  Drop Procedures                                                            |
|                                                                             |
\*****************************************************************************/
print '----- Drop Procedures: -------------------------------------------------'
if object_id(N'[ecs].[uspFind]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspFind'
   drop procedure [ecs].uspFind;
end;
go
if object_id(N'[ecs].[uspSpind]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspSpind'
   drop procedure [ecs].[uspSpind];
end;
go
if object_id(N'[ecs].[uspProcFromObjMethodGet]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspProcFromObjMethodGet'
   drop procedure [ecs].[uspProcFromObjMethodGet];
end;
go
if object_id(N'[ecs].[uspParseParam]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspParseParam'
   drop procedure [ecs].[uspParseParam];
end;
go
if object_id(N'[ecs].[uspOut]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspOut'
   drop procedure [ecs].[uspOut];
end;
go
if object_id(N'[ecs].[uspExecuteOnRemoteDB]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspExecuteOnRemoteDB'
   drop procedure [ecs].[uspExecuteOnRemoteDB];
end;
go
if object_id(N'ecs.uspDB') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspDB'
   drop procedure ecs.uspDB;
end;
go
if object_id(N'ecs.uspTable') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspTable'
   drop procedure ecs.uspTable;
end;
go
if object_id(N'ecs.usp_ecs') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop usp_ecs'
   drop procedure ecs.usp_ecs;
end;
go
if object_id(N'ecs.uspEcs') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspEcs'
   drop procedure ecs.uspEcs
end;
go
if object_id(N'[ecs].[uspUserReport]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspUserReport'
   drop procedure [ecs].[uspUserReport];
end;
go
if object_id(N'[ecs].[uspLog]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspLog'
   drop procedure [ecs].[uspLog];
end;
go
if object_id(N'[ecs].[uspNotImplemented]') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop uspNotImplemented'
   drop procedure [ecs].uspNotImplemented;
end;
go
/*****************************************************************************\
|                                                                             |
|  Drop Functions                                                             |
|                                                                             |
\*****************************************************************************/
print '----- Drup functions: --------------------------------------------------'
if object_id(N'ecs.svfReplaceScript') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfReplaceScript'
   drop function ecs.svfReplaceScript;
end;
go
if object_id(N'ecs.svfGetScriptByKey') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfGetScriptByKey'
   drop function ecs.svfGetScriptByKey;
end;
go
if object_id(N'ecs.svfStandardObject') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfStandardObject'
   drop function ecs.svfStandardObject;
end;
go
if object_id(N'ecs.svfDBNameFromSpind') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfDBNameFromSpind'
   drop function ecs.svfDBNameFromSpind;
end;
go
if object_id(N'ecs.svfBitmaskFromValues') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop svfBitmaskFromValues'
   drop function ecs.svfBitmaskFromValues;
end;
go
if object_id(N'ecs.tvfValuesFromBitmask') is not null
begin;
   print convert(varchar(23),getdate(),121) + ' : drop tvfValuesFromBitmask'
   drop function ecs.tvfValuesFromBitmask;
end;
go


/*****************************************************************************\
|                                                                             |
|  Drop Types                                                                 |
|                                                                             |
\*****************************************************************************/
print '----- Drop types: ------------------------------------------------------'
if exists (
           select *
             from sys.types
            where name = 'Method'
          )
begin;
   print convert(varchar(23),getdate(),121) + ' : drop Method'
   drop type ecs.Method
end;
go
if exists (
           select *
             from sys.types
            where name = 'Obj'
          )
begin;
   print convert(varchar(23),getdate(),121) + ' : drop Obj'
   drop type ecs.Obj
end;
go
/*****************************************************************************\
|                                                                             |
|  Drop Schema                                                                |
|                                                                             |
\*****************************************************************************/
print '----- Drop Schema: -----------------------------------------------------'
if exists (
           select *
             from sys.schemas
            where name = 'ecs'
         )
begin;
   print convert(varchar(23),getdate(),121) + ' : drop ecs'
   drop schema ecs
end;
go
go
print convert(char(19),getdate(),120) + '-- Include schema.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\/Source/Schema/schema.ecs.sql'
go
create schema ecs authorization dbo;
go
print convert(char(19),getdate(),120) + '-- Include type.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\\Source\Type\ecs.method.sql'
go
create type ecs.Method from varchar(720);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\\Source\Type\ecs.obj.sql'
go
create type ecs.Obj from varchar(720);
go
print convert(char(19),getdate(),120) + '-- Include DependentCodebase.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfLoginNameFromXML.sql'
go
create function ecs.svfLoginNameFromXML(@x xml)
returns sysname
as
   begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/LoginName)[1]','sysname')
   return @Return;
   end;
go
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfDatabaseNameFromXML.sql'
go
create function ecs.svfDatabaseNameFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/DatabaseName)[1]','sysname')
   return @Return;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfSchemaNameFromXML.sql'
go
create function ecs.svfSchemaNameFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/SchemaName)[1]','sysname')
   return @Return;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfObjectNameFromXML.sql'
go
create function ecs.svfObjectNameFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/ObjectName)[1]','sysname')
   return @Return;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfObjectTypeFromXML.sql'
go
create function ecs.svfObjectTypeFromXML(@x xml)
returns sysname
as
begin;
   declare @Return sysname;
   set @Return = @x.value('(/EVENT_INSTANCE/ObjectType)[1]','sysname')
   return @Return;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfCallingDb.sql'
go
create function ecs.svfCallingDb()
returns sysname
as
begin;
   declare @db sysname;
   select @db = databases.name
     from sys.dm_tran_locks
     join sys.databases
       on databases.database_id = dm_tran_locks.resource_database_id
    where dm_tran_locks.resource_type = N'DATABASE'
      and dm_tran_locks.request_session_id = @@SPID
      and dm_tran_locks.request_mode = N'S'
      and dm_tran_locks.request_status = N'GRANT'
      and dm_tran_locks.request_owner_type = N'SHARED_TRANSACTION_WORKSPACE'
      and dm_tran_locks.resource_database_id != DB_ID()
   set @db = coalesce(@db,db_name())
   return @db;
end;
go
print convert(char(19),getdate(),120) + '-- Include Table.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.Tally.sql'
go
create table ecs.Tally (
                        N int not null
                       );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.DDLEvent.sql'
go
create table ecs.DDLEvent (
                           DDLEventId   bigint   not null identity(1,1)
                         , DataXML      xml          null
                         , LoginName    as ecs.svfLoginNameFromXML(DataXML)
                         , DBName       as ecs.svfDatabaseNameFromXML(DataXML)
                         , SchemaName   as ecs.svfSchemaNameFromXML(DataXML)
                         , ObjectName   as ecs.svfObjectNameFromXML(DataXML)
                         , ObjectType   as ecs.svfObjectTypeFromXML(DataXML)
                         , CreatedAtUCT datetime not null
                          );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.Script.sql'
go
create table ecs.Script (
                         ScriptKey varchar(100)  not null
                       , Script    nvarchar(max) not null
                        );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.Config.sql'
go
create table ecs.Config (
                         ConfigKey   varchar(64)  not null
                       , ConfigValue varchar(100) not null
                        );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.Spind.sql'
go
create table ecs.Spind (
                        SPID        int           not null
                      , DBName      sysname       not null
                      , Input       nvarchar(max)     null
                      , ActiveAtUTC datetime      not null
                       );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.ECSLog.sql'
go

create table [ecs].[ECSLog] (
                             [ECSLogId]    bigint        not null identity(1,1)
                           , [Spid]        int           not null
                           , [LogValue]    nvarchar(max) not null
                           , [LogUser]     sysname       not null
                           , [DBName]      sysname       not null
                           , [LoggedAtUTC] datetime      not null
                           , [TimeInt] as (CONVERT([bigint],replace(replace(replace(replace(CONVERT([char](23),[LoggedAtUTC],(21)),'-',''),'.',''),' ',''),':',''),0))
                            );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.ECSValue.sql'
go
create table ecs.ECSValue (
                           ECSValue ecs.obj     not null
                         , ECSDesc  varchar(64) not null
                          );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.UserValue.sql'
go
create table ecs.UserValue (
                            UserValue ecs.Obj not null
                          , ecsValue  ecs.obj not null
                           );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.ObjectType.sql'
go
create table ecs.ObjectType (
                             ObjectTypeId int         not null
                           , ObjectType   varchar(64) not null
                            );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.StatusBitmask.sql'
go
create table ecs.StatusBitmask (
                                Bitmask      bigint      not null
                              , BitmaskValue varchar(64) not null
                               );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.Participant.sql'
go
create table ecs.Participant (
                              ParticipantId int      not null identity(1,1)
                            , DBName        sysname  not null
                            , CreatedAtUTC  datetime not null
                            , StatusBitmask int      not null
                             );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.ParticipantLog.sql'
go
create table ecs.ParticipantLog (
                                 ParticipantLogId bigint         not null identity (1,1)
                               , ParticipantId    int            not null
                               , ActionUTC        datetime       not null
                               , LoginName        sysname        not null
                               , ActionText       nvarchar(1024) not null
                                );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.ParticipantObject.sql'
go
create table ecs.ParticipantObject (
                                    ParticipantObjectId bigint  not null identity(1,1)
                                  , ParticipantId       int     not null
                                  , ObjectTypeId        int     not null
                                  , SchemaName          sysname not null
                                  , ObjectName          sysname not null
                                  , ParentObjectName    sysname     null
                                   );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.ParticipantObjectLog.sql'
go
create table ecs.ParticipantObjectLog (
                                       ParticipantObjectLogId bigint         not null identity(1,1)
                                     , ParticipantObjectId    bigint         not null
                                     , ActionUTC              datetime       not null
                                     , LoginName              sysname        not null
                                     , ActionText             nvarchar(1024) not null
                                      );
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Table\ecs.ECSToSQLTypes.sql'
go
create table ecs.ECSToSQLTypes (
                                ECSValue ecs.obj                                    not null
                              , objType  char(2) COLLATE Latin1_General_CI_AS_KS_WS not null
                               )
go
print convert(char(19),getdate(),120) + '-- Include PrimaryKey.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_Tally.sql'
go
alter table ecs.Tally add constraint PK_Tally primary key(N);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_Script.sql'
go
alter table ecs.Script add constraint PK_Script primary key(ScriptKey);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_Config.sql'
go
alter table ecs.Config add constraint PK_Config primary key(ConfigKey);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_Spind.sql'
go
alter table ecs.Spind add constraint PK_Spind primary key(SPID);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_ecsLog.sql'
go
alter table ecs.ecsLog add constraint PK_ecsLog primary key(ecsLogId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_ecsValue.sql'
go
alter table ecs.ecsValue add constraint PK_ecsValue primary key(ecsValue);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_UserValue.sql'
go
alter table ecs.UserValue add constraint PK_UserValue primary key(UserValue);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_DDLEvent.sql'
go
alter table ecs.DDLEvent add constraint PK_DDLEvent primary key (DDLEventId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_ObjectType.sql'
go
alter table ecs.ObjectType add constraint PK_ObjectType primary key(ObjectTypeId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_Participant.sql'
go
alter table ecs.Participant add constraint PK_Participant primary key(ParticipantID);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_StatusBitmask.sql'
go
alter table ecs.StatusBitmask add constraint PK_StatusBitmask primary key(Bitmask);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_ParticipantLog.sql'
go
alter table ecs.ParticipantLog add constraint PK_ParticipantLog primary key(ParticipantLogId)
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_ParticipantObject.sql'
go
alter table ecs.ParticipantObject add constraint PK_ParticipantObject primary key(ParticipantObjectId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.PK_ParticipantObjectLog.sql'
go
alter table ecs.ParticipantObjectLog add constraint PK_ParticipantObjectLog primary key(ParticipantObjectLogId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\PrimaryKey\ecs.AK_ECSToSQLTypes.sql'
go
create unique clustered index AK_ECSToSQLTypes on ecs.ECSToSQLTypes (ECSValue,objType);
go
print convert(char(19),getdate(),120) + '-- Include ForeignKey.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\ForeignKey\ecs.FK_UserValue_ecsValue_ecsValue.sql'
go
alter table ecs.UserValue add constraint FK_UserValue_ecsValue_ecsValue
foreign key(ecsValue) references ecs.ecsValue(ecsValue);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\ForeignKey\ecs.FK_ParticipantLog_ParticipantId_Participant.sql'
go
alter table ecs.ParticipantLog add constraint FK_ParticipantLog_ParticipantId_Participant
foreign key(ParticipantID) references ecs.Participant(ParticipantId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\ForeignKey\ecs.FK_ParticipantObject_ParticipantId_Participant.sql'
go
alter table ecs.ParticipantObject add constraint FK_ParticipantObject_ParticipantId_Participant
foreign key(ParticipantId) references ecs.Participant(ParticipantId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\ForeignKey\ecs.FK_ParticipantObject_ObjectTypeId_ObjectType.sql'
go
alter table ecs.ParticipantObject add constraint FK_ParticipantObject_ObjectTypeId_ObjectType
foreign key(ObjectTypeId) references ecs.ObjectType(ObjectTypeId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\ForeignKey\ecs.FK_ParticipantObjectLog_ParticipantObjectId_ParticipantObject.sql'
go
alter table ecs.ParticipantObjectLog add constraint FK_ParticipantObjectLog_ParticipantObjectId_ParticipantObject
foreign key(ParticipantObjectId) references ecs.ParticipantObject(ParticipantObjectId);
go
print convert(char(19),getdate(),120) + '-- Include Default.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_Spind_ActiveAtUTC.sql'
go
alter table ecs.Spind add constraint DF_Spind_ActiveAtUTC default getutcdate() for ActiveAtUTC;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ecsLog_LoggedAtUTC.sql'
go
alter table ecs.ecsLog add constraint DF_ecsLog_LoggedAtUTC default getutcdate() for LoggedAtUTC;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ecsLog_LogUser.sql'
go
alter table ecs.ecsLog add constraint DF_ecsLog_LogUser default system_user for LogUser;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ecsLog_Spid.sql'
go
alter table ecs.ecsLog add constraint DF_ecsLog_Spid default @@SPID for Spid;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ecsLog_DBName.sql'
go
alter table ecs.ecsLog add constraint DF_ecsLog_DBName default ecs.svfCallingDB() for DBName;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_DDLEvent_CreatedAtUCT.sql'
go
alter table ecs.DDLEvent add constraint DF_DDLEvent_CreatedAtUCT default getutcdate() for CreatedAtUCT;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_Participant_CreatedAtUTC.sql'
go
alter table ecs.Participant add constraint DF_Participant_CreatedAtUTC default getutcdate() for CreatedAtUTC;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ParticipantLog_ActionUTC.sql'
go
alter table ecs.ParticipantLog add constraint DF_ParticipantLog_ActionUTC default getutcdate() for ActionUTC;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ParticipantLog_LoginName.sql'
go
alter table ecs.ParticipantLog add constraint DF_ParticipantLog_LoginName default system_user for LoginName;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ParticipantLog_ActionText.sql'
go
alter table ecs.ParticipantLog add constraint DF_ParticipantLog_ActionText default '-no action-' for ActionText;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ParticipantObjectLog_ActionUTC.sql'
go
alter table ecs.ParticipantObjectLog add constraint DF_ParticipantObjectLog_ActionUTC default getutcdate() for ActionUTC;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ParticipantObjectLog_LoginName.sql'
go
alter table ecs.ParticipantObjectLog add constraint DF_ParticipantObjectLog_LoginName default system_user for LoginName;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Default\ecs.DF_ParticipantObjectLog_ActionText.sql'
go
alter table ecs.ParticipantObjectLog add constraint DF_ParticipantObjectLog_ActionText default '-no action' for ActionText;
go
print convert(char(19),getdate(),120) + '-- Include Index.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Index\ecs.ParticipantLog.IX_ParticipantLog_ParticipantId.sql'
go
create nonclustered index IX_ParticipantLog_ParticipantId on ecs.ParticipantLog(ParticipantId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Index\ecs.ParticipantObject.IX_ParticipantObject_ParticipantId.sql'
go
create nonclustered index IX_ParticipantObject_ParticipantId on ecs.ParticipantObject(ParticipantId);
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Index\ecs.ParticipantObject.IX_ParticipantObject_ObjectTypeId.sql'
go
create index IX_ParticipantObject_ObjectTypeId on ecs.ParticipantObject(ObjectTypeId);
go
print convert(char(19),getdate(),120) + '-- Include View.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\View\ecs.vwUserValueToSQLType.sql'
go
create view ecs.vwUserValueToSQLType as
select ECSValue.ECSValue
     , ECSToSQLTypes.objType 'Type'
  from ecs.ECSValue
  join ecs.ECSToSQLTypes
    on ECSToSQLTypes.ECSValue = ECSValue.ECSValue;
go
print convert(char(19),getdate(),120) + '-- Include Function.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfConfigValue.sql'
go
create function [ecs].[svfConfigValue] (@ConfigKey varchar(64))
returns nvarchar(max) as
begin
   declare @r nvarchar(max) = (
                               select ConfigValue
                                 from ecs.Config
                                where ConfigKey = @ConfigKey
                              );
   return @r;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfReplaceScript.sql'
go
create function ecs.svfReplaceScript (
                                      @sql nvarchar(max)
                                     )
returns nvarchar(max) as
begin;
   declare @r             nvarchar(max) = @sql;
   declare @db            sysname       = ecs.svfCallingDb();
   declare @ParticipantID int           = (select ParticipantID from ecs.Participant where DBName = @db);
   declare @cert          nvarchar(max) = ecs.svfConfigValue('CertBackupLocation');
   declare @certName      nvarchar(max) = ecs.svfConfigValue('CertificateName');
   declare @certUser      nvarchar(max) = ecs.svfConfigValue('CertifiateUser');
   declare @me            sysname       = ecs.svfConfigValue('ThisDatabase');
   declare @objcte nvarchar(max);

   if charindex('|objcte|',@r)>0
   begin;
      set @objcte = (select Script from ecs.Script where ScriptKey = 'ObjectCTE');
      set @r = replace(@r,'|objcte|',@objcte);
   end;

   set @r = replace(@r,'|db|',@db);
   set @r = replace(@r,'|certBackupLocation|',@cert);
   set @r = replace(@r,'|CertificateName|',@certName);
   set @r = replace(@r,'|CertifiateUser|',@certUser);
   set @r = replace(@r,'|me|',@me);
   if @ParticipantID is not null and charindex('|ParticipantID|',@r) > 0
      set @r = replace(@r,'|ParticipantID|',cast(@ParticipantID as varchar(11)));
   return @r;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfGetScriptByKey.sql'
go
create function ecs.svfGetScriptByKey (
                                       @key varchar(100)
                                      )
returns nvarchar(max) as
begin;
   declare @r nvarchar(max);

   set @r = (
             select script
               from ecs.script
              where ScriptKey = @key
            );

   set @r = ecs.svfReplaceScript(@r);

   return @r;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfStandardObject.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfDBNameFromSpind.sql'
go
create function ecs.svfDBNameFromSpind()
returns sysname
as
begin;
   declare @DBName sysname
   set @DBName = (
                  select DBName
                    from ecs.Spind
                   where SPID = @@spid
                 );
   return @DBName;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.svfBitmaskFromValues.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Function\ecs.tvfValuesFromBitmask.sql'
go
create function ecs.tvfValuesFromBitmask(@bitmask bigint)
returns table
as
return (
        select BitmaskValue
          from ecs.StatusBitmask
         where StatusBitmask.Bitmask&@bitmask <> 0
       );
go
print convert(char(19),getdate(),120) + '-- Include Procedure.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspLog.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspSpind.sql'
go
create procedure ecs.uspSpind (
                               @DBName sysname
                             , @param  nvarchar(max)
                             , @log    bit = null
                              ) as
begin;
   set nocount on;
   declare @ret     int = -1;
   declare @logVal  nvarchar(max);
   declare @minutes int = ecs.svfConfigValue('SpindTimeoutMinutes');

   exec @ret = ecs.uspLog @@procid, @DBName, @log

   delete ecs.spind
    where spid = @@spid
       or ActiveAtUTC < dateadd(minute, (@minutes*-1),getutcdate());

   insert ecs.spind (
                     SPID
                   , DBName
                   , Input
                   , ActiveAtUTC
                    )
   values (
           @@spid
         , @DBName
         , @param
         , getutcdate()
          );

   return 0;

end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspNotImplemented.sql'
go
create procedure ecs.uspNotImplemented as
begin;
   exec ecs.uspLog @Procid = @@procid, @value = 'not implemented error', @log = 1;
   raiserror('NOT IMPLEMENTED',16,1);
   return -1;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspParseParam.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspOut.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspExecuteOnRemoteDB.sql'
go
create procedure ecs.uspExecuteOnRemoteDB (
                                           @ScriptKey varchar(100)
                                         , @DBName    sysname = null
                                         , @log       bit     = null
                                          ) as
begin;
   set nocount on;
   declare @ret    int = 0;
   declare @sql    nvarchar(max);
   declare @LogVal nvarchar(max);
   declare @me     sysname = object_name(@@procid);

   exec @ret = ecs.uspLog @procid = @@procid, @value = @ScriptKey, @Log = @log;

   set @DBName = coalesce(@DBName,ecs.svfCallingDb());

   set @sql = ecs.svfGetScriptByKey(@scriptKey);
   set @sql = replace(@sql,'''','''''');
   set @sql = 'use ' + @DBName + ' exec(''' + @sql + ''')';
   set @sql = coalesce(@sql,'-- @Sql was null');

   set @LogVal = @me + ': ' + @sql;
   exec @ret = ecs.uspLog @procid = @@procid, @value = @LogVal, @Log = @log;

   exec @ret = sp_executesql @sql;
   set @LogVal = @me + ': Return from sp_executesql: ' + cast(@ret as varchar(11))
   exec @ret = ecs.uspLog @procid = @@procid, @value = @LogVal, @Log = @log;

   return @ret;

end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspTable.sql'
go
create procedure ecs.uspTable (
                               @Method ecs.method
                             , @Parm   nvarchar(max)
                             , @log    bit = null
                              ) as
begin;
   declare @me      sysname = object_id(@@procid);
   declare @ret     int;
   declare @DBName  sysname = ecs.svfDBNameFromSpind();
   declare @p       nvarchar(max) = @DBName + ' ' + @Method + ' ' + @Parm;
   if @Method is null
   or @parm is null
   begin;
      raiserror ('%s: Parameters must not be null',16,1,@me);
      return -100;
   end;
   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;


   exec @ret = ecs.uspNotImplemented;

   return 0;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspDB.sql'
go
create procedure ecs.uspDB (
                            @Method ecs.method
                          , @Parm   nvarchar(max)
                          , @log    bit = null
                           ) as
begin;
   declare @me      sysname = object_id(@@procid);
   declare @ret     int;
   declare @DBName  sysname = ecs.svfDBNameFromSpind();
   declare @p       nvarchar(max) = @DBName + ' ' + @Method + ' ' + @Parm;
   declare @Bitmask bigint = 0;

   if @Method is null
   or @parm is null
   begin;
      raiserror ('%s: Parameters must not be null',16,1,@me);
      return -100;
   end;
   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;

   if @Method = 'watch'
   begin;
      set @p = 'Watch database: ' + @dbname;
      exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;
      if coalesce(@Parm,'') = ''
      begin;
         set @Parm = 'Now';
      end;

      exec @ret = ecs.uspNotImplemented;
      return 0
   end;

   set @p = 'Unknown Method';
   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;
   return -100;

end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspFind.sql'
go
if object_id(N'ecs.uspFind') is not null
   drop procedure ecs.uspFind
go
create procedure ecs.uspFind (
                              @Obj  ecs.obj
                            , @Parm nvarchar(max) = null
                            , @log  bit           = null
                             ) as
begin;
   set nocount on;
   declare @me      sysname = object_id(@@procid);
   declare @ret     int;
   declare @DBName  sysname       = ecs.svfCallingDB();
   declare @sql     nvarchar(max);
   declare @params  nvarchar(max) = '@UserValue ecs.obj, @objectName sysname, @Schema sysname';
   declare @Schema  sysname       = '%';

   declare @p nvarchar(max) = coalesce(@obj,'NULL') + ' ' + coalesce(@Parm,'NULL');

   exec @ret = ecs.uspLog @ProcID = @@procid, @Value = @p, @log = @log;

   if coalesce(@Parm,'') = ''
      set @Parm = '%';

   if charindex('.',@Parm) > 1
   begin;
      set @Schema = (
                     select left(@Parm,charindex('.',@Parm)-1)
                    );
      set @Parm = (
                   select right(@Parm,len(@parm)-charindex('.',@Parm))
                  )
   end;

   set @schema = replace(replace(@schema,'[',''),']','');
   set @Parm = replace(replace(@Parm,'[',''),']','')

   set @sql = ecs.svfGetScriptByKey('ObjectCTE');
   set @sql = @sql + 'select distinct o.object_id,o.schemaname,o.objectName,o.objecttype,o.parentobject,o.modifydate from objs o ';
   set @sql = @sql + 'join ecs.vwUserValueToSQLType on vwUserValueToSQLType.type = o.objecttype ';
   set @sql = @sql + 'where o.objectName like @objectName ';
   set @sql = @sql + 'and o.schemaname like @Schema '
   if @obj <> 'OBJ'
   begin;
      set @sql = @sql + 'and vwUserValueToSQLType.ECSValue = @UserValue ';
   end;
   set @sql = @sql + 'order by o.objecttype, o.objectname, o.schemaname';

   exec sp_executesql @sql
                    , @params
                    , @UserValue  = @obj
                    , @Schema     = @Schema
                    , @objectName = @Parm;

   return 0;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspEcs.sql'
go
create procedure ecs.uspEcs (
                             @Param  nvarchar(max) = null
                           , @DBName sysname       = null
                            ) as
begin;
   set nocount on;
   declare @ret    int = -1;
   declare @log    bit = ecs.svfConfigValue('log');
   declare @Obj    ecs.Obj;
   declare @Method ecs.method;
   declare @parms  nvarchar(max);
   declare @p      nvarchar(max);
   declare @USProc ecs.Obj;
   declare @SQL    nvarchar(max);
   declare @Prm    nvarchar(max) = N'@p nvarchar(max), @log bit';
   declare @me     sysname = object_name(@@procid);
   declare @return int = 0;

   --
   -- Make sure @db is not null
   --
   set @DBName = coalesce(@DBName,ecs.svfCallingDb());

   --
   -- Logging:
   --
   exec @ret = ecs.uspLog @@procid, @Param, @log

   --
   -- SPIND entry:
   --
   exec @ret = ecs.uspSpind @DBName = @DBName
                          , @Param  = @Param
                          , @log    = @log;

   --
   -- If no parameters, display help:
   --
   if @Param is null
   begin;
      exec @ret = ecs.uspOut 'This is where we would print the help file.',0,0;
      exec @ret = ecs.uspNotImplemented;
      return 0;
   end;

   --
   -- Parse the parameters
   --
   exec @ret = ecs.uspParseParam @p1     = @Param
                               , @Obj    = @Obj    output
                               , @Method = @Method output
                               , @parms  = @parms  output;
   if @ret <> 0
      return @ret;

   --
   -- standardize the object
   --
   set @obj = ecs.svfStandardObject(@obj);

   if @Obj is null
   begin;
      set @p = 'Bad Object.'
      exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
      exec ecs.uspOut @p,1,0;
      return 0;
   end;

   if coalesce(@Method,'') = ''
   begin;
      set @p = 'Bad Method.'
      exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
      exec ecs.uspOut @p,1,0;
      return 0;
   end;

   -- if FIND; jump to Find proc:
   if @Method = 'find'
   begin;
      exec ecs.uspFind @Obj  = @Obj
                     , @Parm = @parms
                     , @log  = @log;
      return 0;
   end


   if @obj = 'DB'
   begin;
      begin try
         exec @return = ecs.uspDB @Method = @Method
                                , @Parm   = @parms
                                , @log    = @log
      end try
      begin catch
         set @p = 'uspDB: ' + error_message()
         set @return = error_number();
         exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
         raiserror('%s: %s',16,1,@me,@p);
         return @return;
      end catch
   end;

   if @obj = 'Table'
   begin;
      begin try
         exec @return = ecs.uspTable @Method = @Method
                                   , @Parm   = @parms
                                   , @log    = @log
      end try
      begin catch
         set @p = 'uspTable: ' + error_message()
         set @return = error_number();
         exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
         raiserror('%s: %s',16,1,@me,@p);
         return @return;
      end catch
   end;


   if @return <> 0
   begin;
      set @p = 'sub procedure returned error: ' + cast(@return as varchar(11));
      exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
      raiserror('%s: sub procedure returned error',15,1,@me);
      return -100;
   end;

   set @p = 'Complete.';
   exec @ret = ecs.uspLog @Procid = @@procid, @value = @p, @log = @log;
   exec @ret = ecs.uspOut @p,1,0;

   return 0;
end;
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Procedure\ecs.uspUserReport.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- Include Data.txt'
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Data\data.ecs.Tally.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Data\data.ecs.Script.sql'
go
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
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Data\data.ecs.ConfigValue.sql'
go
insert ecs.Config ([ConfigKey],[ConfigValue])
values
('CertBackupLocation','C:\Program Files\Microsoft SQL Server\MSSQL12.ACE\MSSQL\DATA\sp_ecsCERT.CRT'),
('CertifiateUser','sp_ecsCERT'),
('CertificateName','sp_ecsCERT'),
('Default print format','0'),
('Log','1'),
('SpindTimeoutMinutes','60'),
('ThisDatabase',db_name());
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Data\ecs.ecsValue.sql'
go
insert ecs.ecsValue ([ecsValue],[ECSDesc])
values
('CHECK CONSTRAINT','Check Constraint'),
('CODEBASE INDEX','Codebase Index'),
('DB','Database'),
('DEFAULT','Default'),
('FOREIGN KEY','Foreign key'),
('FUNCTION','Function'),
('INDEX','Index'),
('INLINE FUNCTION','Inline Function'),
('PRIMARY KEY','Primary key'),
('SCALAR FUNCTION','Scalar function'),
('STORED PROCEDURE','Stored Procedure'),
('SYNONYM','Synonym'),
('TABLE','Table'),
('TABLE FUNCTION','Table function'),
('TRIGGER','Trigger'),
('UDDT','User-Defined Data type'),
('VIEW','View'),
('OBJ','OBJECT');
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Data\ecs.UserValue.sql'
go
insert ecs.UserValue ([UserValue],[ECSValue])
values
('check','CHECK CONSTRAINT'),
('check constraint','CHECK CONSTRAINT'),
('ck','CHECK CONSTRAINT'),
('database','DB'),
('db','DB'),
('default','DEFAULT'),
('df','DEFAULT'),
('fk','FOREIGN KEY'),
('fn','SCALAR FUNCTION'),
('foreign key','FOREIGN KEY'),
('func','FUNCTION'),
('function','FUNCTION'),
('idx','INDEX'),
('if','INLINE FUNCTION'),
('index','INDEX'),
('inline function','INLINE FUNCTION'),
('itvf','INLINE FUNCTION'),
('ix','INDEX'),
('p','STORED PROCEDURE'),
('pk','PRIMARY KEY'),
('Primary key','PRIMARY KEY'),
('proc','STORED PROCEDURE'),
('scalar function','SCALAR FUNCTION'),
('sn','SYNONYM'),
('sp','STORED PROCEDURE'),
('sproc','STORED PROCEDURE'),
('svf','SCALAR FUNCTION'),
('syn','SYNONYM'),
('synonym','SYNONYM'),
('t','TABLE'),
('table','TABLE'),
('table function','TABLE FUNCTION'),
('tf','TABLE FUNCTION'),
('tr','TRIGGER'),
('trigger','TRIGGER'),
('tvf','TABLE FUNCTION'),
('u','TABLE'),
('uddt','UDDT'),
('usp','STORED PROCEDURE'),
('v','VIEW'),
('view','VIEW'),
('vw','VIEW'),
('obj','OBJ'),
('object','OBJ');
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Data\ecs.StatusBitmask.sql'
go
insert ecs.StatusBitmask (Bitmask,BitmaskValue)
values
 (1,'Active')
,(2,'Monitoring Paused')
,(4,'DDL Trigger created')
,(8,'Participant Object updated');
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\Source\Data\ecs.ECSToSQLTypes.sql'
go
insert ecs.ECSToSQLTypes (ECSValue,objType)
values ('TABLE','U')
     , ('VIEW','V')
     , ('FUNCTION','IF')
     , ('FUNCTION','TF')
     , ('FUNCTION','FN')
     , ('CHECK CONSTRAINT','C')
     , ('DEFAULT','D')
     , ('FOREIGN KEY','F')
     , ('SCALAR FUNCTION','FN')
     , ('INLINE FUNCTION','IF')
     , ('PRIMARY KEY','K')
     , ('STORED PROCEDURE','P')
     , ('CODEBASE INDEX','IX')
     , ('INDEX','IX');
go
print convert(char(19),getdate(),120) + '-- C:\Users\brian.stork\Google Drive\Projects\SPecs\Auto\/Source/MasterProc.sql'
go
use master
go
set QUOTED_IDENTIFIER on
go
if object_id(N'[dbo].[sp_ecs]') is null
   exec ('create PROCEDURE [dbo].[sp_ecs] as begin return 0 end')
go
alter procedure dbo.sp_ecs (
                            @param1 nvarchar(max) = null
                           ) as

   declare @db sysname
   declare @ret int;
   select @db = databases.name
     from sys.dm_tran_locks
     join sys.databases
       on databases.database_id = dm_tran_locks.resource_database_id
    where dm_tran_locks.resource_type = N'DATABASE'
      and dm_tran_locks.request_session_id = @@SPID
      and dm_tran_locks.request_mode = N'S'
      and dm_tran_locks.request_status = N'GRANT'
      and dm_tran_locks.request_owner_type = N'SHARED_TRANSACTION_WORKSPACE'
      and dm_tran_locks.resource_database_id != DB_ID();

   set @db = coalesce(@db,db_name());

   exec @ret = ecs.ecs.uspEcs @param1
                             , @db;

   return @ret;
go
exec sp_ms_marksystemobject 'dbo.sp_ecs';
go
use ecs;
go
