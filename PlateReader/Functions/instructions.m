% 1. 	Create directory: /.../PlateReader_TXTL/Data
%                   /.../PlateReader_TXTL/Plots

% 2. 	Copy excel files from PlateReader in the Data folder.
% 3. 	Go into the Function directory and run the script instructions.m or executing the
% 	following command line:

clear all
close all

saveData(arrayfun(@selectData,cellfun(@importRaw, newfiles())));

%	This saves the new plate reader files from the Data folder in datapoints.mat.

% 4.	Plot the data x (x has to be in datapoints) with: plotData(x)
% 5.	Save plots with: savePlot
