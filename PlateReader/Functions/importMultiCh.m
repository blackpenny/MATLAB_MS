function [time, channels]=importMultiCh(input)
% importing data with more than one fluorescent channel

for i=4:size(input,2);
%% extract the information and rearrange into doubles    
    chNum{1,i}=regexp(input{7,i},' (\d*))','tokens'); % determine the number of the channel
    dataNum{1,i}=regexp(input{7,i},'(\d*) -','tokens'); % determine the datapoint number
    chNumber(1,i)=str2double(chNum{1,i}{1,1}); %convert cells to double array
    dataNumber(1,i)=str2double(dataNum{1,i}{1,1}); %convert cells to double array
    
    dataEx{1,i}=regexp(input{7,i},'((\d*),','tokens'); %extract ex. wavelength
    dataEm{1,i}=regexp(input{7,i},', (\d\d\d)','tokens'); %extract em. wavelength
    channels(chNumber(1,i)) = strcat('Ex',dataEx{1,i}{1,1},'Em',dataEm{1,i}{1,1}); % save the channels in data
    
%% read the times from input
    dataSec{:, dataNumber(1,i), chNumber(1,i)}=regexp(input{7,i},'(\d*) s','tokens'); %extract the seconds
    dataMin{:,dataNumber(1,i), chNumber(1,i)}=regexp(input{7,i},'(\d*) min','tokens'); %extract the min
    dataHour{:,dataNumber(1,i), chNumber(1,i)}=regexp(input{7,i},'(\d*) h','tokens'); %extract the hours
    
%% it its empty don't count    
    if isempty(dataSec{:,dataNumber(1,i), chNumber(1,i)})
        dataSec{:,dataNumber(1,i), chNumber(1,i)}={'0'}; 
    end
    if isempty(dataMin{:,dataNumber(1,i), chNumber(1,i)})
        dataMin{:,dataNumber(1,i), chNumber(1,i)}={'0'};
    end
    if isempty(dataHour{:,dataNumber(1,i), chNumber(1,i)})
        dataHour{:,dataNumber(1,i), chNumber(1,i)}={'0'};
    end
    
%% convert to doubles and add the times in seconds    
    time(1,dataNumber(1,i), chNumber(1,i))=str2double(dataSec{1, dataNumber(1,i), chNumber(1,i)}{1,1})+...
        60*str2double(dataMin{1, dataNumber(1,i), chNumber(1,i)}{1,1})+...
        60*60*str2double(dataHour{1, dataNumber(1,i), chNumber(1,i)}{1,1}); 
    
end

end