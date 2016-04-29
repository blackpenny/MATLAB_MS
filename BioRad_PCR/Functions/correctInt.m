function correctInt(name)
load('datapoints.mat')
firstData=name.data(:,1);
for i=1:size(name.data,2)
    name.data(:,i)=name.data(:,i)-firstData;
end
eval(sprintf('%s=name',name.fileName));
clear name i firstData
save('datapoints.mat')
end



