function data = importRaw(fileName)
% CylceTime in seconds

cd ..
cd Data
%% read the data
    [num, txt]=xlsread(fileName, 1);
    
    [~, ~, raw] = xlsread(fileName,'Standard Curve_ Ct Results');
    channel = raw(2,3);
    %channel(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),channel)) = {''};
    
    
    data = struct();
    data.fileName = fileName;
    data.sampleNames = txt(1, 3:end)';
    data.wells= txt(1, 3:end)';
    data.channels = {}; 
    
%% time
disp(fileName);
answer=input('Please enter the CylceTime in seconds? ');
CycleTime=answer;

        for i1=1:size(num);
            time(1,i1)=num(i1,2)*CycleTime;
        end
%% data       
    %data.time = reshape(num(1, :), 1, [], numChannels);
    data.data = num(1:end, 3:end)'
    data.time=time;
%%  
    cd ..
    cd Functions
    
end
%end



