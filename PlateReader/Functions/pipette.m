function pipette(data)
<<<<<<< HEAD
    
    YYMMDD=cellfun(@(take)cell2mat(take),regexp(inputname(1),'(\d.....)','tokens'),'uni',false)
    name=strcat('p',YYMMDD,'.xlsx')
    
=======
    % i dont know what this function does, please comment!
    YYMMDD=cellfun(@(take)cell2mat(take),regexp(inputname(1),'(\d.....)','tokens'),'uni',false);
    name=strcat('p',YYMMDD,'.xlsx');
>>>>>>> master
    % getting the data
     [Filename Pathname]=uigetfile
    
    cd('/Volumes/Macintosh Data/Documents/Lab book by themes/Matlab/GIT/Matthaeus/PlateReader_TXTL-v2/pipette');
    [~, ~, alldata]=xlsread(name{1,1});
    cd('/Volumes/Macintosh Data/Documents/Lab book by themes/Matlab/GIT/Matthaeus/PlateReader_TXTL-v2/Functions')
    % remove NaN and measure column width
    c=cellfun(@isnan,alldata,'UniformOutput',false);
    dataSize=size(alldata);
    maxLen = zeros(1,dataSize(2));
    for j1=1:dataSize(2)
        for j2=1:dataSize(1)
            len=length(num2str(alldata{j2,j1}));
            if (len > maxLen(1,j1))
                maxLen(1,j1)=len;
            end
            if c{j2,j1}==1
                alldata{j2,j1}='';
            else
            end
        end
    end

    % Some calibration needed as ColumnWidth is in pixels
    cellMaxLen = num2cell(maxLen*7);
    summe=0;
    
    for ij=1:j1;
       summe=cellMaxLen{1,ij}+summe;
    end
    
    % transform doubles to strings to fix the decimal places
    txtdata=cellfun(@num2str,alldata,'uni',false);
    
    % generate the tables
    for j3=1:l0
        figure(j3);
        set(gcf,'OuterPosition',[650*(j3-1) 700 summe*1.3 600*1+10*dataSize(2)])
        set(gca,'Position',[0.1 0.35 0.8 0.6])
        %eval(sprintf('hax=copyobj(hf%d,0);',j3));
        t=uitable('Data',txtdata, 'Position', [40 20 summe*1.1 15*dataSize(2)]);
        set(t, 'ColumnWidth', cellMaxLen);
        %title(inputname(1));
        title(sprintf('%s-%s',inputname(1),x{j3,1}));
    end
    if answer~=1
    end
    
end