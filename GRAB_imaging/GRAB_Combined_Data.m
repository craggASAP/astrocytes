%%%%% SVM 11-2022 %%%%%
%%%%%Collate .csv files obtained from each stimulation into one Excel file
%Need to have the output folder for each slice open or added to path
%order the files according to date modified and extract them in the order I
%did the stimulation

%list files in the current directory 
files = dir('*.csv'); 

%order files numerically (using natsortfiles function)
ordered_files = natsortfiles (files); %have the .m files open

%read the first file
output = csvread(ordered_files(1).name); 

 for i = 2:numel(ordered_files)
   new = csvread(ordered_files(i).name);  % Read the nth file
   output = horzcat(output, new); % Concatenate output with the second file in the list, etc.
 end

 %define the name of the collated file 
 filename='/Users/stefaniavietti/Desktop/5-HT TEST/5-HT preliminary.xlsx';
 
 %convert to table format
 tableformat= array2table(output);
 
 %write excel file (saved in the directory speficied when naming the file)
 writetable(tableformat, filename, 'Sheet' ,2); %specify sheet number (doesn't matter if renamed)
 


