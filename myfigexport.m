function myfigexport = myfigexport(saveDir, figures, fileNames, createNewFolder, folderName, resolution)
	% Export figures
	% Inputs: saveDir, figures, fileNames, createNewFolder, folderName, resolution
	% saveDir				: directory in '' string NOT "" string!!!!
	% figures				: figure array [figure() figure()]
	% fileNames				: file name array ["name1.png" "name2.png"]
	% createNewFolder		: "true" or "false" - depending on whether you want to
	% 						  create a new folder for the figures.
	% folderName			: folder name in '' string
	% resolution			: absolute number.. Default: 400
	
	% Check if windows computer or mac
	if ispc
		% Windows
		dirSplit = '\';
	else
		% Mac
		dirSplit = '/';
	end
	
	% Default resolution
	if nargin == 5
		resolution = 400;
	end
	
	% If "\" or "/" at end of path. Remove it - otherwise an error occurs
	if saveDir(end) == dirSplit
		saveDir(end) == '';
	end

	% Just change savepath to whichever fits you!
	if (createNewFolder == "true")
		mkdir(saveDir, folderName);							% Create folder
		savePath = strcat(saveDir, dirSplit, folderName);	% Save path for figures
	else
		savePath = saveDir;						% Save path for figures
	end
	
	fileName = fileNames;
	
	for i=1:length(figures)
    	f = strcat(savePath, dirSplit, fileName(i));
    	exportgraphics(figures(i), f,'Resolution', resolution);
	end

	
end
