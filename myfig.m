function fig = myfig(fignumber, positionIn)
	% Create figure w. white colour and specific position and size.
	% Inputs: fignumber, position
	%	- fignumber: The figure number
	%	- position: Position and size array [x y width height] or [width height]
	%			default = [0 500 600 400]
	% Outputs: figure handler

	
	defaultPosition = [0 500 700 500];	% Defualt position and width/height
	sizePosIn = size(positionIn);		% Calculate size of input position

	if nargin == 1
		sprintf('nargin=1!')
		% No position argument given: Use defualt position
		position = defaultPosition;
	elseif nargin == 2
		sprintf('nargin=2!')
		% If only xlength and ylength are given, then use default position and
		% change size only
		if sizePosIn(2) == 2
			position = [defaultPosition(1:2) positionIn];
		else
			position = positionIn;
		end
	end

	
	if fignumber > 0
		fig = figure(fignumber);
	else
		fig = figure();
	end
	
	fig.Position = position; fig.Color = 'white';

end
