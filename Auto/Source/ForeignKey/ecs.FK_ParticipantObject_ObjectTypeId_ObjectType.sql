alter table ecs.ParticipantObject add constraint FK_ParticipantObject_ObjectTypeId_ObjectType
foreign key(ObjectTypeId) references ecs.ObjectType(ObjectTypeId);
