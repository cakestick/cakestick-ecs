alter table ecs.ParticipantObjectLog add constraint FK_ParticipantObjectLog_ParticipantObjectId_ParticipantObject
foreign key(ParticipantObjectId) references ecs.ParticipantObject(ParticipantObjectId);
