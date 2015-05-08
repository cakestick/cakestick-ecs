# Verbose output to console:
$Verbose=$False;

# This line of text is inserted after each file:
$AfterEachFile="go";

# $ForceUnique = $TRUE will make sure a file is included only once. (The first time)
$ForceUnique=$False;

# Date/Comment stuff
$sqldate="print convert(char(19),getdate(),120)"
