function plotData(data)

close all
load('datapoints.mat');

LWidth=3; % Linewidth
FontForPlot='Arial'; % Font type
FSize=15; % Font size
MSize=3; % Marker size
colors={'MidnightBlue','LightCyan';'FireBrick','LightYellow';'SlateGray','LightGray';'DarkGreen','PaleGreen';'DeepPink','Pink';'DarkSlateBlue','Thistle'};

% different channels
for i0=1:size(data.filter,2);
    nSample=0;
    for i1 = 1:size(data.filter,1);
       if data.filter(i1,i0)==1;        
          figure(i0)
          nSample=nSample+1;
          x=floor((nSample-1)/3)+1;
          ColorPlot1{nSample}=rgb(colors{x,1}) - mod(nSample-1,3)*(rgb(colors{x,1})-rgb(colors{x,2}))/3;
          p(nSample)=plot(data.time(1,1:end,i0)/3600,data.data(i1,1:end,i0),'-','Color',ColorPlot1{nSample},...
                'Linewidth',LWidth,'MarkerSize',MSize,'MarkerFaceColor',ColorPlot1{nSample});
          sampleName{nSample,i0}=data.sampleNames{i1,1};
          hold on
       else
       end
    end
       % put the last xTick in
    diffdata=(data.time(1,end)-data.time(1,end-1))/3600;
    xlim([0 data.time(1,end)/3600+diffdata])
    
    set(gcf,'OuterPosition',[36000*(i0-1) 700 36000 36000])
    set(gca,'FontName',FontForPlot,'FontSize',FSize)
    %x={'east','center','west'}
    movegui(gcf,'center');

    ah1 = gca;
    if nSample>0;
        [~,~,~] = legend(ah1,p(1:nSample),sampleName(1:nSample,i0),'Interpreter','none');
    else
    end

    set(legend,'EdgeColor',[1 1 1],'Orientation','vertical',...
        'Location','NorthEast',...
        'FontSize',FSize);
         legend boxoff
        

    xlabel('Time (h)','Fontsize',FSize, 'FontName',FontForPlot)
    title(inputname(1),'Interpreter','none');
    
    %% channel
    if data.channels=='FAM'
        data.channels='Ex485-Em530';
    elseif data.channels=='HEX'    
        data.channels='Ex530-Em575';
    elseif data.channels=='Cy3' 
        data.channels='Ex545-Em585';
    elseif channels{1,1}=='TexasRed'
        data.channels='Ex575-Em625'
    elseif data.channels=='Cy5'
        data.channels='Ex630-Em685';
    end
    
    ah1.YLabel.String=strcat('FI (a.u.)-',data.channels);
    
    
end   
%%
%answer=input('Do you want to save the graph? Yes=1/No=else:\n');
%shg
%if answer==1
%         for n1=1:i0
%             string1=strcat(PlotPath,...
%                 char(inputname(1)),'_Ch',num2str(n1),'.fig');
%             [file, path]=uiputfile(string1,'Save Table');
%             set(figure(n1), 'PaperPositionMode', 'auto');
%             saveas(figure(n1),[path,file],'fig');      
%         end
%end
end
