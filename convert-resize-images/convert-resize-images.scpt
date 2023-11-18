on run {input, parameters}
	-- convert files to comma-delimited list
	set AppleScript's text item delimiters to ","
	set fileList to {}
	repeat with i in input
		set end of fileList to quoted form of POSIX path of (i as text)
	end repeat
	
	-- prompt user for width
	display dialog "width (px)" default answer ""
	set width to text returned of result
	
    -- if no width, convert to webp without resizing
	if width is "" then
		do shell script "/opt/homebrew/bin/node ~/convert-images.js " & fileList as string
		return input
	end if
	
	-- prompt user for height
	display dialog "height (px)" default answer ""
	set height to text returned of result
	
	do shell script (("/opt/homebrew/bin/node ~/convert-resize-images.js " & fileList as string) & space & width & space & height)
	
	return input
end run
