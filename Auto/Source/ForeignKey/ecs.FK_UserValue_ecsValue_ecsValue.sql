alter table ecs.UserValue add constraint FK_UserValue_ecsValue_ecsValue
foreign key(ecsValue) references ecs.ecsValue(ecsValue);
