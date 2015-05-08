alter table ecs.ParticipantObject add constraint FK_ParticipantObject_ParticipantId_Participant
foreign key(ParticipantId) references ecs.Participant(ParticipantId);
