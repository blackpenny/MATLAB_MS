function [data] = selectData(data)

%% create figure
f = figure('Position',[100 100 400 200]);

%% column name and format (header)
cname{1,1} = data.fileName;
cformat{1,1} = 'char';


cname{1,2} = 'Select';
cformat{1,2} = 'logical';


%% make table content
select(:,1)=data.sampleNames; % load sample names


    for i3=1:numel(data.sampleNames)
        select{i3,2}=true;
    end


truth=true(1,2); % all values can be changed

%% put in data structure
data.filter = false(numel(data.sampleNames), numel(data.channels));

%% Create the uitable
t = uitable('Data', select,...
    'ColumnName', cname,...
    'ColumnFormat', cformat,...
    'ColumnEditable', truth,...
    'CellEditCallback',@giveOut,... %% this function writes the data from the table in the output structure everytime a cell has been changed
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
j = uicontrol('Style', 'popupmenu', 'String', {'FAM', 'HEX', 'Cy3', 'TexasRed', 'Cy5'}, 'Callback' , @whichChannel);  

    function whichChannel(hObject, callbackwhat)
     	val=hObject.Value;
        channels=hObject.String;
        data.channels=channels{val};
    end

h = uicontrol('Position',[100 10 200 40],'String','Finished',...
    'Callback','uiresume(gcbf)'); % this creates a push button 'Finished' that executes 'uiresume'

uiwait(gcf); % this waits until 'uiresume' is executed

close(f)

end