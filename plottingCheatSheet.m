% The intention of this script is simply to function as a template for
% clever tricks on plotting. Everything from setting default font sizes to
% systemizing plotting with for-loops and everything in-between

% Notes:
% - I use my own function for plotting: myfig()
% - I use my own function for exporting figures



%% 1. Setup for exporting figures
% ------------------------------------
% In order to easily export figures do the following:

% Start a figure cell array to later use for exporting figures
figArray = [];
figNameArray = [];
% You can use a figure plotting prefix if you want something like
setupPrefix = "tj00_";
% You can combine that with the use of a figNo variable to include the
% figure number in the plot name as well:

% EXAMPLE:
figNo = 1;
f = myfig(-1)
% plot(something)

figArray = [figArray f];
figNameArray = [figNameArray strcat(setupPrefix, string(figNo), "_figureName.png")];

% This will give figure name "tj00_1_figureName.png"

% Then comes the export:

% Check whether a windows computer is used or not:
if ispc
	% PC
	figSaveDir = "c:\Users\Mrotr\Git\Repos\CA9_Writings\Graphics\TestResults\VTSplotting\";
else
	% Mac
	figSaveDir = "/Users/martin/Documents/Git/Repos/CA9_Writings/Graphics/TestResults/VTSplotting";
end

resolution = 400;
myfigexport(figSaveDir, figArray, figNameArray, "false", "noFolderName", resolution)


%% Setting default font sizes, line widths and grid on preferences

% Set grid on to default for both axes
set(groot,'DefaultAxesXGrid','on')
set(groot,'DefaultAxesYGrid','on')

% Set LaTeX interpretation as default
list_factory = fieldnames(get(groot,'factory'));
index_interpreter = find(contains(list_factory,'Interpreter'));
for i = 1:length(index_interpreter)
    default_name = strrep(list_factory{index_interpreter(i)},'factory','default');
    set(groot, default_name,'latex');
end

% Set default font sizes
% Get list of settings that can be changed:
% get(groot, 'factory')
set(groot,'defaultAxesFontSize', 13)					% Default is 10

% Set default line width
set(groot, 'DefaultLineLineWidth', 1.3);

%% Using Figure handle to include lines, set legends, change figure axes properties etc.

% When using "f = myfig()" or "f = figure" you get a figure handle "f"
% This can be used to retrieve axes from the figure e.g. in a subplot.
% Often for loops and functions are used to plot figurs and thus it's not
% convenient to customize each subplot w.r.t setting xlines/ylines or other
% stuff in the functions or for loops.

% EXAMPLE:
f = myfig(-1)
for ii = 1:4
	subplot(ii,1,4)
	plot(something)
end

% Pull the axes object from the figure object
axes = findobj(f, 'type', 'axes'); 
% Place an xline on the second subplot (counted from the bottom!)
xline(axes(2), point_on_xaxis, '--', {'LabelName'});
% Set location of legend of top plot (4th form the bottom!)
legend(axes(4), 'Location', 'north')

annotation(f, 'textarrow',[0.25 0.18],[0.85 0.83],'String','1st mode');


%% Xline, Yline and textarrows

% Xline/yline
xline(axes, point_on_xaxis, '--', {'LabelName'}, ...
	'LabelOrientation', 'horizontal', ...
	'LabelVerticalAlignment', 'top', ...
	'HandleVisibility', 'off');

% Using text arrows. The position of these is based on the figure size and
% not the individual axes on a subplot!
annotation(f, 'textarrow',[x_start x_end],[y_start y_end], 'String','LabelName');
