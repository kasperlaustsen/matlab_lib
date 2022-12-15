function fig = myfig(fignumber, positionIn, sizeIn)
	% Create figure w. white colour and specific position and size.
	% Inputs: fignumber, positionIn, sizeIn
	%	- fignumber: The figure number
	%	- positionIn: Position array [x y] in range 0 -> 1 where 0.5 is in
	%	the middle
	%	- sizeIn: Size array [width height] in range 0 -> 1. 0.5 is half
	%	the width/height of the screen width/height
	% Outputs: figure handler
	
	% Extract screen resolution to define placement of figure
	set(groot, 'units',' pixels');	% Set unit for screen resolution extraction
	screenRes = get(groot, 'screensize'); screenRes = screenRes([3 4]);
	screenXres = screenRes(1); screenYres = screenRes(2);


	% Default figure width and height in % of screen size
	defWidth = 0.4; defHeight = 0.3;
	% Default figure x and y position (In middle of screen the the left)
	defxpos = 0; defypos = 0.5;
	
	if nargin == 1
		% No position argument given: Use defualt position
		pos = [defxpos defypos];
		size = [defWidth defHeight];
	elseif nargin == 2
		% Only figure size is given
		size = sizeIn;
	elseif nargin == 3
		% Both size and position arguments are given
		pos = positionIn;
		size = sizeIn;
	end

	% Convert figure size from % of screen size to pixels
	sizePixels = [size(1)*screenXres size(2)*screenYres];

	% Define x and y position based on screen resolution
	xpos = pos(1) * screenXres-sizePixels(1)/2;
	ypos = pos(2) * screenYres-sizePixels(2)/2;

	% Contain the figure inside the screen if position is beyond borders
	if xpos < 0
		xpos = 0;
	end
	if ypos < 0
		ypos = 0;
	end
	if xpos > (screenXres-pos(1))
		xpos = screenXres-pos(1);
	end
	if ypos > (screenYres-pos(2))
		ypos = (screenYres-pos(2));
	end

	if fignumber > 0
		fig = figure(fignumber);
	else
		fig = figure();
	end
	
	fig.Position = [xpos ypos sizePixels(1) sizePixels(2)]; fig.Color = 'white';

end
