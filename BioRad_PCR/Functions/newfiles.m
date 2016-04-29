function newName=newfiles
%imports the excel files from the Data folder to datapoints -name the well
% with 'mCer' and 'mV' accordingly.

% look at the olddata
load datapoints
olddata=who;
x='*.xls';

cd ..
cd Data
%look at the new data
%cd('/Volumes/Macintosh Data/Documents/Lab book by themes/Matlab/TX_TL/TXTL/Data')
files=dir(x);

%make a list which indicates if the data has already been imported
matchdata=arrayfun(@(file)any(strcmp(regexprep(file.name,'\.xls$',''),olddata)),files);
%make a list of the files in Data
namedata=arrayfun(@(filename)regexprep(filename.name,'\.xls$',''),files,'uniform',false);


%find the new files
new=find(matchdata==0);
lnew=length(new);
if lnew==0;
    newName={};
    disp('No new files');
else
    for i1=1:lnew
% import if new files are found
        newName{i1,1}=namedata{new(i1),1};
    end
end

cd ..
cd Functions