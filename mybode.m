function [ax1, ax2] = mybode(sys, xlimIn, ylimCell, radOrHz, titleStr)

if class(ylimCell) == "double"
	ylimCell = {[],[]};
end

[mag,phase,wout] = bode(sys);
% Correct for phase shift such that it starts negatively
if phase(1) > 0
	temp = ceil(phase(1)/360);
	phase = phase - temp*360;
end

if radOrHz == 1
	% rad/s
	frequency = wout;
	xlabelstr = 'Frequency [rad/s]';
elseif radOrHz == 2
	% Hz
	frequency = wout/(2*pi);
	xlabelstr = 'Frequency [Hz]';
end

ax1 = subplot(2,1,1);
semilogx(frequency, mag2db(squeeze(mag)))
title(titleStr)
if xlimIn ~= 0
	xlim(xlimIn)
end
if length(ylimCell{1}) > 1
	ylim(ylimCell{1})
end
ylabel('Magnitude [dB]')
grid

ax2 = subplot(2,1,2);
semilogx(frequency, squeeze(phase))
title('Phase corrected to start w. negative phase')
if xlimIn ~= 0
	xlim(xlimIn)
end
xlabel(xlabelstr)
ylabel('Phase [deg]')
grid