function myfigexport = myfigexport(savePath, figures, fileNames, createSubFolder, subFoldeName, resolution)
	% Export figures
	% Inputs: saveDir, figures, fileNames, createNewFolder, folderName, resolution
	% saveDir				: directory in '' string NOT "" string!!!!
	% figures				: figure array [figure() figure()]
	% fileNames				: file name array ["name1.png" "name2.png"]
	% createNewFolder		: "true" or "false" - depending on whether you want to
	% 						  create a new folder for the figures.
	% folderName			: folder name in '' string
	% resolution			: absolute number.. Default: 400
	
	% Default resolution
	if nargin == 5
		resolution = 400;
	end

	% Just change savepath to whichever fits you!
	if (createSubFolder == "true")
		if isfolder(subFoldeName)
			% do nothing if folder already exists
			savePath = fullfile(savePath, subFoldeName);	% Save path for figures
		else
			mkdir(savePath, subFoldeName);							% Create folder
			savePath = fullfile(savePath, subFoldeName);	% Save path for figures
		end
	else
		savePath = savePath;		% Save path for figures
	end
	
	fileName = fileNames;
	
	for i=1:length(figures)
    	f = fullfile(savePath, fileName(i));
    	exportgraphics(figures(i), f,'Resolution', resolution);
	end

	
end
