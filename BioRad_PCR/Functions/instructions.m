% Create directory: /.../PlateReader_TXTL-v2/Data
%                   /.../PlateReader_TXTL-v2/Plots

% Copy excel file from PlateReader in the Data folder.
% go into the Function directory before executing the following command line:
saveData(arrayfun(@selectData,cellfun(@importRaw, newfiles())));
% this saves the new plate reader files from the Data folder in datapoints.mat


%%

% plot the data x (x has to be in datapoints), plots can be automatically saved in Plots
%>> plotData(x)