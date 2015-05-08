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
