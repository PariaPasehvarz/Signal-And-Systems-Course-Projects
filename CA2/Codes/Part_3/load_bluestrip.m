function load_bluestrip()
files=dir('key');
len=length(files)-2;
blue_arm=cell(2,len);

for i=1:len
   blue_arm{1,i}=imread([files(i+2).folder,'\',files(i+2).name]);
   blue_arm{2,i}=files(i+2).name(1);
end

save ARM blue_arm;
end