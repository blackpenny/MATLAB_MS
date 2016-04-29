function [time,channels]=importOneChABS(input)
%importing data from one absorbance channel

%% extract the channel information
dataEx=regexp(input{7,4},'(\d\d\d)','tokens');
channels{1} = strcat('OD',dataEx{1,1}{1,1});

%% extract the times of the datapoints
for i=4:size(input,2);
    
    % read the times from txt
    dataSec{:,i-3,1}=regexp(input{7,i},'(\d*) s','tokens');
    dataMin{:,i-3,1}=regexp(input{7,i},'(\d*) min','tokens');
    dataHour{:,i-3,1}=regexp(input{7,i},'(\d*) h','tokens');
    
    % it its empty don't count
    if isempty(dataSec{:,i-3,1})
        dataSec{:,i-3,1}{1,1}={'0'};
    end
    
    if isempty(dataHour{:,i-3,1})
        dataHour{:,i-3,1}{1,1}={'0'};
    end
    if isempty(dataMin{:,i-3,1})
        dataMin{:,i-3,1}{1,1}={'0'};
    end
    
    % convert to doubles and add the times in seconds
    time(1,i-3,1)=str2double(dataSec{1,i-3,1}{1,1})+...
        60*str2double(dataMin{1,i-3,1}{1,1})+...
        60*60*str2double(dataHour{1,i-3,1}{1,1});
end

end