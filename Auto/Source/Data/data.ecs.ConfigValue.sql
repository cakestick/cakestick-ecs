insert ecs.Config ([ConfigKey],[ConfigValue])
values
('CertBackupLocation','C:\Program Files\Microsoft SQL Server\MSSQL12.ACE\MSSQL\DATA\sp_ecsCERT.CRT'),
('CertifiateUser','sp_ecsCERT'),
('CertificateName','sp_ecsCERT'),
('Default print format','0'),
('Log','1'),
('SpindTimeoutMinutes','60'),
('ThisDatabase',db_name());