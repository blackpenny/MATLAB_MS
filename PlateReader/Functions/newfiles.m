function newName=newfiles
% import the excel files from the Data folder to datapoints

%% look at the olddata
load datapoints
olddata=who;
x='*.xlsx';

%% look at the new data
cd ..
cd Data
files=dir(x);

%% make a list which indicates if the data has already been imported
matchdata=arrayfun(@(file)any(strcmp(regexprep(file.name,'\.xlsx$',''),olddata)),files);

%% make a list of the files in Data
namedata=arrayfun(@(filename)regexprep(filename.name,'\.xlsx$',''),files,'uniform',false);

%% delete any entry that starts with '~$'

%% find the new files and import
new=find(matchdata==0);
lnew=length(new);
if lnew==0;
    newName={};
    disp('No new files');
else
    for i1=1:lnew
        if isempty(regexp(namedata{new(i1),1},'~$*','match'))
            newName{i1,1}=namedata{new(i1),1};
        end
    end
end

%% change back to folder
cd ..
cd Functions