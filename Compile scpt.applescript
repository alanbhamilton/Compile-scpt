-- compile .applescript file to .scpt file in /bin
on run {asFile, parameters}
	try
		set fileInfo to (info for asFile)
		-- get path of file passed in - creates posix value
		set asFolder to POSIX path of asFile
		-- get hfs value by coercing the posix value into a string
		set asFolder to POSIX file asFolder as string
		-- strip off the file name leaving path only
		set asFolder to (characters 1 thru -((length of (name of fileInfo)) + 1) of asFolder) as string
		-- make sure the file passed in is an .applescript file
		if name extension of fileInfo is "applescript" then
			tell application "Finder"
				-- check if /bin needs to be created
				if not (exists (asFolder & "bin")) then
					make new folder at asFolder with properties {name:"bin"}
				end if
				-- make shell script command and invoke -> osacompile -o "/bin/<script>.scpt" "<script>.applescript"
				set command to ("osacompile -o \"" & my posixPath(asFolder) & "bin/" & displayed name of fileInfo & ".scpt\"" & space & "\"" & my posixPath(asFolder) & name of fileInfo & "\"")
				do shell script command
			end tell
		else
			-- error for wrong file type
			display dialog "Choose an .applescript file to compile!"
		end if
	on error errorMessage number errorNumber
		display dialog "Error: " & errorNumber & return & errorMessage
	end try
end run

on posixPath(macPath)
	set macPath to (macPath as text)
	set rootOffset to (offset of ":" in macPath)
	set rootdisk to (characters 1 thru (rootOffset - 1) of macPath)
	tell application "Finder"
		if (disk (rootdisk as string) is the startup disk) then
			set unixpath to "/" & (characters (rootOffset + 1) thru end of macPath)
		else
			set unixpath to "/Volumes:" & macPath
		end if
	end tell
	set chars to every character of unixpath
	repeat with i from 2 to length of chars
		if item i of chars as text is equal to "/" then
			set item i of chars to ":"
		else if item i of chars as text is equal to ":" then
			set item i of chars to "/"
		end if
	end repeat
	return every item of chars as string
end posixPath
