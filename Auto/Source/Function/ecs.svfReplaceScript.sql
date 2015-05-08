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