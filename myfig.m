function fig = myfig(fignumber, position)
	% Create figure w. white colour and specific position and size
	% Inputs: fignumber, position
	%	- fignumber: The figure number
	%	- position: Position and size array [x y width height] 
	%			default = [0 500 600 400]
	% Outputs: figure handler
	
	% Default position
	if nargin == 1
		position = [0 500 600 400];
	end
	
	if fignumber > 0
		fig = figure(fignumber);
	else
		fig = figure();
	end

	fig.Position = position; fig.Color = 'white';

end
