alter table ecs.ParticipantLog add constraint FK_ParticipantLog_ParticipantId_Participant
foreign key(ParticipantID) references ecs.Participant(ParticipantId);
