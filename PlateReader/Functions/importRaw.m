function data = importRaw(fileName)
%% get the data
cd ..
cd Data
%read the data
[num, txt]=xlsread(fileName, 1);
cd ..
cd Functions

%% initiate structure
data = struct();
data.fileName = fileName;
data.sampleNames = txt(9:end, 3);

%% check for ABS or FI and extract time an no. of channels
if  ~isempty(regexp(txt{4,1},'Fluorescence','match')) && isempty(regexp(txt{4,1},'multichromatic','match'))
    % only one channel
   % if  isempty(regexp(txt{4,1},'multichromatic','match'))
        [time, channels]=importOneCh(txt);
elseif  ~isempty(regexp(txt{4,1},'Fluorescence','match')) && ~isempty(regexp(txt{4,1},'multichromatic','match'))
    % more than one channel
        [time, channels]=importMultiCh(txt);
elseif ~isempty(regexp(txt{4,1},'Absorbance','match'))
    [time, channels]=importOneChABS(txt);
else
    disp('error 42')
end

%% write in data structure
numChannels = size(channels,2);
numDatapoints=size(time,2); % assumes that each channel has the same amount of datapoints
data.channels=channels;
data.time=time;
data.data = reshape(num(2:end, 3:end), numel(data.sampleNames), numDatapoints, numChannels);

end