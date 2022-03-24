function [] = newscript()
% This script copes a script template to a selected folder with a selected
% name and opens said script for editing. The selected script should be
% named 'newScriptTemplate' and should be located in the same folder as
% this function

% Get function path (where the template file should be)
[functionpath,~,~] = fileparts(mfilename('fullpath'));

% Pop up save window to specify file name and path
[file,path,indx] = uiputfile('x.m');

% Concentate path and filename
pathandname = strcat(path, file);

%concentate function path and name of script
funcpathnname = strcat(functionpath, '/newScriptTemplate.m');

% Copy template from function folder to selected destination folder with
% selected name
copyfile(funcpathnname, pathandname);

% Edit the file
edit(pathandname);