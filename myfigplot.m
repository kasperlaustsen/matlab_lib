function f = myfigplot(figNum, wantedPlots, wantedSims, Xdata, sensorData, ...
	titles, ylabels, simNames, plottype, xlimits, ylimits, gridOn)
	
	% Plot chosen data sets for comparison
	% Inputs: figNum, wantedPlots, wantedSims, Nsims, Xdata, sensorData, titles,
	% ylabels, simNames, plottype, xlimits, ylimits
	% figNum			: The number of the figure
	% wantedPlots		: Ex. [1 2] - Data from sensor 1 and 2
	% wantedSims		: Ex. [1 3] - Data from sim 1 and 3
	% Nsims				: The number of .int files which is used
	% Xdata				: The cell of Xdata (timeseries)
	% sensorData		: The cell of sensor data
	% titles			: An array of the titles relating to the chosen dataseries
	% ylabels			: An array of the y labels relating to the chosen dataseries
	% simNames			: An array of the simNames relating to the .int files
	% plottype			: 1 if timeseries, 0 if fft (sets xlabel)
	% xlimits			: ex. xlimits = [0 1]. if xlimits = 0 then it's not set
	% ylimits			: ex. ylimits = [0 100]. if ylimits = 0 then it's not set
	% gridOn			: 1 if grid should be on. 0 if it should be off
	Nplots = length(wantedPlots);
	switch Nplots
		case 1
			figSize = [1 0.25 700 200];
		case 2
			figSize = [1 0.25 700 350];
		case 3
			figSize = [1 0.25 700 550];
		case 4
			figSize = [1 0.25 700 750];
		case 5
			figSize = [1 0.25 700 950];
	end
	
	if plottype
		xlabelstr = "Time [s]";
	else
		xlabelstr = "Frequency [Hz]";
	end
	
	f = myfig(figNum, figSize);
	for ii = 1:length(wantedPlots)
		axs(ii) = subplot(length(wantedPlots), 1, ii);

		for nn = wantedSims
			plot(Xdata{nn}, sensorData{nn}(:,wantedPlots(ii)))
			hold on
		end
		hold off
		
		% Set limits if they are specified as an input other than 0
		if length(xlimits) > 1
			xlim(xlimits)
		end
		
		if not(isnumeric(ylimits))
			% Check if an array of ylims is input in stead of just 0
			if length(ylimits{ii}) == 2
				% Check the ylim index to see if the subplot has a
				% designated ylim setup.
				ylim(ylimits{ii})
			end
		end
		
		if gridOn
			grid on
		end

		title(titles(wantedPlots(ii)))
		if ii == length(wantedPlots)
			% Only put time/frequency label on last plot
			xlabel(xlabelstr)
		end
		
		% If FFT then set ylabel to default fft ylabel
		if plottype
			ylabel(ylabels(wantedPlots(ii)))
		else
			ylabel("Amplitude")
		end
		
		if ii == 1
			% only put legend on first subplot
			legend(simNames(wantedSims))
		end
	end
	linkaxes(axs,'x');
	
end