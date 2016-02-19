NTFS and Windows Paths
======================

This
[blog article]( http://blogs.msdn.com/b/bclteam/archive/2007/02/13/long-paths-in-net-part-1-of-3-kim-hamilton.aspx )
by Kim Hamilton is referenced frequently.

Reparse Points
--------------

 * [Reparse point]( http://en.wikipedia.org/wiki/NTFS_reparse_point )
 * [Junction point]( http://en.wikipedia.org/wiki/NTFS_junction_point )
 * [Symbolic Link]( http://en.wikipedia.org/wiki/NTFS_symbolic_link )

Some examples
-------------

Not sure these are useful.

```
$pathToScan = "C:\Some Folder"  # The path to scan and the the lengths for (sub-directories will be scanned as well).
$outputFilePath = "C:\temp\PathLengths.txt" # This must be a file in a directory that exists and does not require admin rights to write to.
$writeToConsoleAsWell = $true   # Writing to the console will be much slower.

# Open a new file stream (nice and fast) and write all the paths and their lengths to it.
$outputFileDirectory = Split-Path $outputFilePath -Parent
if (!(Test-Path $outputFileDirectory)) {
    New-Item $outputFileDirectory -ItemType Directory
}
$stream = New-Object System.IO.StreamWriter($outputFilePath, $false)
Get-ChildItem -Path $pathToScan -Recurse -Force |
Select-Object -Property FullName, @{Name="FullNameLength";Expression={($_.FullName.Length)}} |
Sort-Object -Property FullNameLength -Descending |
ForEach-Object {
    $filePath = $_.FullName
    $length = $_.FullNameLength
    $string = "$length : $filePath"
    if ($writeToConsoleAsWell) {
        Write-Host $string
    }
    $stream.WriteLine($string)  # Write to the file.
}
$stream.Close()
```

```
SUBST Q: "C:\Documents and Settings\MyLoginName\My Documents\MyStuffToBeCopied"
Xcopy Q:\ "d:\Where it needs to go" /s /e
SUBST Q: /D
```

```
Get-ChildItem | Where-Object {$_.FullName.Length -gt 260}
```

```
Get-ChildItem | Select-Object -Property FullName, @{Name="FullNameLength";Expression={($_.FullName.Length)}
```

```
Get-ChildItem | Where-Object {$_.PSChildName.Length -gt 10}
```

Named Pipes
------------

Did you know that the device driver that implements named pipes is
actually a file system driver" In fact, the driver's name is NPFS.SYS,
for "Named Pipe File System". What you might also find surprising
is that its possible to obtain a directory listing of the named
pipes defined on a system. This fact is not documented, nor is it
possible to do this using the Win32 API. Directly using
NtQueryDirectoryFile, the native function that the Win32 FindFile
APIs rely on, makes it possible to list the pipes. The directory
listing NPFS returns also indicates the maximum number of pipe
instances set for each pipe and the number of active instances.


References
-----------

 * [Stackoverflow article]( http://stackoverflow.com/questions/1880321/why-does-the-260-character-path-length-limit-exist-in-windows )

<!-- vim: set autoindent expandtab sw=4 syntax=markdown: -->
