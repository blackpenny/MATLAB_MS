function [data] = selectData(data)

%% create figure
f = figure('Position',[100 100 400 200]);

%% column name and format (header)
cname{1,1} = 'TXTL';
cformat{1,1} = 'char';

for i1=1:numel(data.channels)
    cname{1,i1+1} = data.channels{1,i1};
    cformat{1,i1+1} = 'logical';
end

%% make table content
select(:,1)=data.sampleNames; % load sample names

for i2=2:numel(data.channels)+1 % load tick boxes and set to false
    for i3=1:numel(data.sampleNames)
        select{i3,i2}=true;
    end
end

truth=true(1,numel(data.channels)+1); % all values can be changed

%% put in data structure
data.filter = false(numel(data.sampleNames), numel(data.channels));

%% Create the uitable
t = uitable('Data', select,...
    'ColumnName', cname,...
    'ColumnFormat', cformat,...
    'ColumnEditable', truth,...
    'CellEditCallback',@giveOut,...
    'RowName',[],...
    'Position',[20 70 1 1]);

%% Set width and height
t.Position(3) = t.Extent(3);
t.Position(4) = t.Extent(4);

%% callback function
    function giveOut(hObject,callbackdata)
        data.sampleNames = t.Data(:, 1);
        data.filter = cell2mat(t.Data(:, 2:end));
    end

%%
h = uicontrol('Position',[100 10 200 40],'String','Finished',...
    'Callback','uiresume(gcbf)');

uiwait(gcf);

close(f)

end