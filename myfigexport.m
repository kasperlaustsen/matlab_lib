function myfigexport = myfigexport(savePathIn, figures, fileNames, createSubFolder, subFolderName, resolution)
	% Export figures
	% Inputs: saveDir, figures, fileNames, createNewFolder, folderName, resolution
	% savePath				: Path where figures are saved (unless it is
	%							chosen to make a subfolder)
	% figures				: figure array [figure() figure()]
	% fileNames				: file name array ["name1.png" "name2.png"]
	% createSubFolder		: "true" or "false" - depending on whether you want to
	%							create a new folder for the figures.
	% subFolderName			: sub folder name
	% resolution			: absolute number.. Default: 400
	
	% Default resolution
	if nargin == 5
		resolution = 400;
	end

	% Just change savepath to whichever fits you!
	if (createSubFolder == "true")
		if isfolder(subFolderName)
			% do nothing if folder already exists
			savePath = fullfile(savePathIn, subFolderName);	% Save path for figures
		else
			mkdir(savePathIn, subFolderName);							% Create folder
			savePath = fullfile(savePathIn, subFolderName);	% Save path for figures
		end
	else
		savePath = savePathIn;		% Save path for figures
	end
	
	fileName = fileNames;
	
	for i=1:length(figures)
    	f = fullfile(savePath, fileName(i));
    	exportgraphics(figures(i), f,'Resolution', resolution);
	end

	
end
