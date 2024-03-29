function latexString = printlatexmatrix(matrix)
	% Clear command window

	% Choose matrix to convert

	M = matrix;

	% Check if matrix contains symbols. If thats the case = error
	if isa(M, 'sym')
		disp('ERROR: matrix cannot contain symbols')
	end
	
	% anonymous function to handle complex values
	zprintf = @(z) sprintf('%6.3f + %6.3fi', z, z/1i);

	%% Convert
	% Get matrix dimensions
	m = size(M, 1);
	n = size(M, 2);
	% Create first line
	s = sprintf('  \\begin{bmatrix}\n  ');
	% Add matrix content
	for k = 1:m
		for l = 1:n
			
			if isreal(M(k,l))
				s = sprintf('%s %6.3f', s, M(k, l)); % print 3 decimal places, align to 6 characters
			else
				z = zprintf(M(k, l));
				s = sprintf('%s %s', s, z); % print 3 decimal places, align to 6 characters
			end

			if l < n
				s = sprintf('%s &', s);
			end
		end
		if k < m
			s = sprintf('%s \\cr', s);
		end
		s = sprintf('%s\n  ', s);
	end
	% Add last line
	s = sprintf('%s\\end{bmatrix}\n', s);
	% Print the result
	disp(s);
end