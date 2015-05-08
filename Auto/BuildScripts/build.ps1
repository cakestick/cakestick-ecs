###############################################################################
## Takes 3 arguments:                                                        ##
##  0 = The absolute "root" directory, from which all "relative" directories ##
##      are built.                                                           ##
##  1 = The input .TXT file. MUST BE in the same directory as this PS1       ##
##      script! Include the .TXT extension.                                  ##
##  2 = The output .SQL file to create. MUST BE in a relative path off the   ##
##      absolute "Root" directory. Include the .SQL extenstion.              ##
##                                                                           ##
##  Path/Filename values that have spaces MUST be surrounded by double AND   ##
##  single quotes like this: "'path with spaces/filename with a space.txt'"  ##
##                                                                           ##
## Comments prefixed with "#" are ignored.                                   ##
##                                                                           ##
## Comments prefixed with "//" will become comments that are printed during  ##
##   execution of the SQL script.                                            ##
##                                                                           ##
## Directives are prefixed with "?" and include:                             ##
##   CD = change the relative directory.                                     ##
##   INCLUDE = include another .TXT source file (in the same directory as    ##
##             this .PS1 build script.)                                      ##
##                                                                           ##
###############################################################################

#
# Make sure 3 arguments are supplied:
#
if($args.Length -lt 3)
{
	Write-Host "Incorrect number of parameters" -foregroundcolor "red";
	exit;
}

# First parameter is the "Root" directory. All other directories are relative to this:
[string]$root = $args[0];

# The Source file (File we are reading):
[string]$source = $args[1];

# The target file: file we are writing:
[string]$OutputFile = $args[2];

# If output file is null, make it the same as the input file + .sql
$OutputFile = $OutputFile.trim();
if($OutputFile.Length -eq 0)
  {
  $OutputFile=$source+".sql";
  }

# The functions are contained in a separate powershell file "\BuildScripts\buildFunctions.ps1"
# Get the appropriate path and envoke the script via dot-sourcing:
$Functions = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ($Functions + '.\buildFunctions.ps1')

# Run-time settings are contained in a separate powershell file "\BuildScripts\buildSettings.ps1"
# Get the appropriate path and envoke the script via dot-sourcing:
$Settings = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ($Settings + '.\buildSettings.ps1')

#
# Get absolute path location where powershell script is running:
#
$BuildScripts=Split-Path ((Get-Variable MyInvocation -Scope 0).Value).MyCommand.Path;
$BuildScripts=$BuildScripts+"\";

#
# Concatennate "Build Scripts" directory with Source file:
#
$FileToLoad = $BuildScripts + $Source

#
# TotalFileList array holds all the files that are being joined.
# It is used to eliminate duplicate files.
# Only the first occurence of a duplicate file will be used.
#
[array]$TotalFileList=@();

#
# Make the call to start populating $global:FileList
# This populates the array $global:FileList with /** comments **/
# and absolute paths to the files:
#
LoadFileList $FileToLoad;


#
# Verify files exist before doing anything else:
#
$OutputFile = $root+$OutputFile;
$date=(Get-Date).ToString("yyyy-MM-dd HH:mm:ss");
$errors=$False;
foreach($entry in $global:FileList)
{
  $entry=$entry.trim();
  if($entry.length -gt 0)
  {
    if(($entry.StartsWith("/**") -eq $True) -or ($entry.StartsWith("-- :") -eq $True))
    {
      $bah=$True;
    } else {
      if((FileExists($entry)) -eq $False)
      {
        if($errors -eq $False)
        {
          $errlog = $root + "SQL_Build_Errors.txt";
          New-Item -ItemType file "$errlog" -force | Out-Null;
          Add-Content "$errlog" "/** File:          $OutputFile **/";
          Add-Content "$errlog" "/** Source:        $FileToLoad **/";
          Add-Content "$errlog" "/** Build Machine: $env:COMPUTERNAME **/";
          Add-Content "$errlog" "/** Build Date:    $date **/";
        }
        Add-Content "$errlog" "Missing File: $entry";
        $errors=$True;
      }
    }
  }
}
if($errors -eq $True)
{
  Write-Error "Missing files: Cannot Continue.";
  exit;
}

#
# Force the creation of the output file
# Include name, date, computer:
#
New-Item -ItemType file "$OutputFile" -force | Out-Null;
Add-Content "$OutputFile" "/** File:          $OutputFile **/";
Add-Content "$OutputFile" "/** Source:        $FileToLoad **/";
Add-Content "$OutputFile" "/** Build Machine: $env:COMPUTERNAME **/";
Add-Content "$OutputFile" "/** Build Date:    $date **/";

#
# Loop to add file contents and comments:
#
foreach($entry in $global:FileList)
{
  $entry=$entry.trim();
  if($entry.length -gt 0)
  {
    #for($i=0;$i -lt $spin.length;$i++){$k="`b" + $spin.Substring($I,1);write-host $k -noNewLine}
    if(($entry.StartsWith("/**") -eq $True) -or ($entry.StartsWith("-- :") -eq $True))
    {
      $entry = $entry.replace("/**","");
      $entry = $entry.replace("**/","");
      $entry = $entry.replace("'","''");
      $entry=$entry.trim();
      $entry = $sqldate + " + '-- $entry'";
      Add-Content "$OutputFile" $entry;
      Add-Content "$OutputFile" $AfterEachFile;
    }
    else
    {
      # Add a file
      if(($ForceUnique -eq $True) -and ($TotalFileList -contains $entry))
      {
        Add-Content "$OutputFile" "-- Omitted Duplicate file $entry";
      }
      else
      {
        if(FileExists($entry))
        {
          $TotalFileList += $entry;
          $announce=$sqldate+" + '-- $entry'";
          Add-Content "$OutputFile" $announce;
          Add-Content "$OutputFile" $AfterEachFile;
          $addFile = Get-Content $entry;
          Add-Content "$OutputFile" $addFile;
          Add-Content "$OutputFile" $AfterEachFile;
        } else {
          write-host "File not found!: $entry";
        }
      }
    }
  }
}
