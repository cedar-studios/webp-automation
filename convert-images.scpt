on run {input, parameters}
  -- converts files to comma-delimited list
	set AppleScript's text item delimiters to ","
	set fileList to {}
	repeat with i in input
		set end of fileList to quoted form of POSIX path of (i as text)
	end repeat

  -- replace node path if necessary
	do shell script "/opt/homebrew/bin/node ~/convert-images.js " & fileList as string
	
	return input
end run
