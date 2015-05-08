create view ecs.vwUserValueToSQLType as
select ECSValue.ECSValue
     , ECSToSQLTypes.objType 'Type'
  from ecs.ECSValue
  join ecs.ECSToSQLTypes
    on ECSToSQLTypes.ECSValue = ECSValue.ECSValue;
