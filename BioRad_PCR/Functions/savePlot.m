 function savePlot

h=findobj('type','figure');
n=length(h);

cd ..
cd Plots

PlotPath1=pwd;
PlotPath=strcat(PlotPath1,'/');

 for n1=1:n
     x=get(get(gca,'title'),'string');
     set(figure(n1), 'PaperPositionMode', 'auto');
     
     string1=strcat(PlotPath,x,'_Ch',num2str(n1));
     savefig(string1);
 
     string2=strcat(string1,'.png');
     %[file, path]=uiputfile(string1,'Save Table')

     saveas(figure(n1),string2,'png');     
 end
 
 cd ..
 cd Functions

end