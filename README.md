# cakestick-ecs
specs project:
Microsoft SQL Server developer/dba helper code.
Bringing object.method(parameter) syntax to Microsoft SQL Server to assist developers and DBAs.
The Ecs database (accessed via sp_ecs) contains functionality to assist developers and DBAs.

To Build: Make sure powershell can execute remote-signed. Execute the Auot\BUILDECS.bat file.
This generates Auto\Artifacts\ECS.sql.
Create a database named "ecs" and run that SQL file there.
