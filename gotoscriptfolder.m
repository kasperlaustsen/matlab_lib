function fcn = gotoscriptfolder()
	% Go to the folder location of this script
	filePath = matlab.desktop.editor.getActiveFilename;
	fileNameStartIndex = max(strfind(filePath, "\"));
	scriptFolder = filePath(1:fileNameStartIndex);
	cd(scriptFolder)
end
