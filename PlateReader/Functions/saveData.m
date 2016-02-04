function saveData(data)

d=load('datapoints.mat');

for i=1:numel(data);
    d.(data(i).fileName)=data(i);
end

%save the data
save('datapoints.mat', '-struct', 'd');
disp('Import completed.')