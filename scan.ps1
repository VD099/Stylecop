$UpdatedFiles=[string] (git diff HEAD HEAD~ --name-only)
#echo $UpdatedFiles
$temp=$UpdatedFiles -split ' '
$count=$temp.length

For ($i=0; $i -lt $temp.Length; $i++)
{

$name=$temp[$i]
$outputname = [io.path]::GetFileNameWithoutExtension("$name")
StyleCopCLI -cs "$name" -out  $(build.artifactstagingdirectory)\StylecopResults_$outputname.xml

}

exit 0
