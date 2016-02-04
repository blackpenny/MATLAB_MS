function import1Ch(fileName)

[num, txt]=xlsread(fileName, 1);

   numChannels = 1;
            
            for i1=1:size(txt,2)-4;
                    dataSec{:,i1}=regexp(txt{7,i1+3},'(\d*) s','tokens');
                    dataMin{:,i1}=regexp(txt{7,i1+3},'(\d*) min','tokens');
                    dataHour{:,i1}=regexp(txt{7,i1+3},'(\d*) h','tokens');
                    
                    if isempty(dataSec{:,i1})
                        dataSec{:,i1}{1,1}='0';
                    end
                        
                    if isempty(dataHour{:,i1})
                        dataHour{:,i1}{1,1}='0';
                    end
                    if isempty(dataMin{:,i1})
                        dataMin{:,i1}{1,1}='0';
                    end
                    
                  time(1,i1)=(1/60)*str2double(dataSec{1,i1}{1,1})+...
                             str2double(dataMin{1,i1}{1,1})+...
                             (60)*str2double(dataHour{1,i1}{1,1});
            end
end