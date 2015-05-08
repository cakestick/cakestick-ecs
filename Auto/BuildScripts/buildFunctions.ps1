$global:Parents=@{};
$global:Children=@();
[array]$global:FileList=@();
[string]$RelativePath="";
[string]$global:err="";

# SplitString returns an array from a string where values are seaparated by "="
function SplitString ($string)
{
  return $string.split("=");
}

#ParamKey returns the left side of "A=B" using SplitString
function ParamKey ($array)
{
  $c = SplitString($array);
  return $c[0].replace("?","");
}

#ParamValue returns the right side of "A=B" using SplitString
function ParamValue ($string)
{
  $c = SplitString($string);
  return $c[1];
}

# FileExists returns TRUE if file exists, FALSE if file does not exist
function FileExists ([string] $FileName)
{
  $test = Test-Path $FileName;
  if($test -eq $False)
  {
    return $False
  }
  return $True
}

#
# IsSelfRef tests include files to return TRUE if include causes self-referencing (infinite) loop
# Returns FALSE if Indlude does not cause infinite loop.
#
function IsSelfRef([string]$callee, [string]$called)
  {
  if(-not $global:Parents.ContainsKey($callee))
    {
    $FirstChild=@($called);
    $global:Parents[$callee]=$FirstChild;
    }
  else
    {
    [array]$children=$global:Parents[$callee];
    $children=$children+$called;
    $global:Parents[$callee]=$children;
    }

  $ngParents = $global:Parents.clone();
  foreach($lParent in $ngParents.KEYS)
  {
    [array]$lChildren=$($ngParents.item($lParent));
    if(($lChildren -contains $callee) -eq $True)
      {
      $lChildren=$lChildren+$called;
      if($called -eq $lParent)
        {
        $global:err="Circular Reference in $lParent";
        return $True;
        }
      $global:Parents[$lParent]=$lChildren;
      }
    }
  return $False;
}


#
# Recursive LoadFileList takes a .TXT file input and writes
# file relative locations to $global:FileList
# Also sets variables and checks for infinite loops
#
function LoadFileList ([string]$FileName)
  {
  # Make sure $FileName exists:
  # $FileName should be include an ABSOLUTE (not relative) path
  if((FileExists $FileName) -eq $False)
    {
    return $False
    }
  $myFileContents = gc $FileName;
  foreach($Line in $myFileContents)
    {
    $pass=$False;
    $Line = $Line.Trim();
    if(($Line.Length -eq 0) -or ($Line.StartsWith("#") -eq $True))
      {
      $pass=$True;
      }
    # Check for SQL Comment:
    if (($pass -eq $False) -and ($Line.StartsWith("//") -eq $True))
      {
      $NextFileList = $Line.replace("//","/** ") + " **/";
      $global:FileList=$global:FileList+$NextFileList;
      $pass = $True;
      }
    # Check for directive
    if (($pass -eq $False) -and ($Line.StartsWith("?") -eq $True))
      {
      $theKey = ParamKey($Line);
      $theValue = ParamValue($Line);
      $pass = $True;
      if(($theKey.ToUpper() -eq "CD") -or ($theKey.ToUpper() -eq "CURRENTDIRECTORY"))
        {
        $RelativePath=$theValue + "\";
        if ($Verbose -eq $True) {Write-Host "Changing Path: $RelativePath";}
        }
      if(($theKey.ToUpper() -eq "INCLUDE") -or ($theKey.ToUpper() -eq "INC"))
        {
        $NextFileList=$theValue;
        $global:FileList+="/** Include $theValue **/";
        $NextFileList=$BuildScripts+$NextFileList;
        if(IsSelfRef $FileName $NextFileList -eq $True)
          {
          Write-Host $global:err -foregroundcolor "Red";
          exit;
          }
        $RelativePath="";
        if ($Verbose -eq $True) {Write-Host "Including File: $NextFileList";}
        LoadFileList $NextFileList;
        }
      }
    # Must be a file:
    if($pass -eq $False)
      {
      $ThePathAndFile=$root + $RelativePath + $line;
      $global:FileList=$global:FileList+$ThePathAndFile;
      if ($Verbose -eq $True) {Write-Host "$ThePathAndFile";}
      }
    }
  }

