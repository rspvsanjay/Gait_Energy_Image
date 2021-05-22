path='H:\Gait_IIT_BHU_Analysis\Pose_Energy_Image\data\Normalized_Silhouette_frames\';
save_path='H:\Gait_IIT_BHU_Analysis\Pose_Energy_Image\data\Normalized_Silhouette_frames_GEI\';
list = dir(path);
fName = {list.name};
[~,y1]=size(fName);
path
y1
tic;
for f_no=3:y1
    listin = dir(char(strcat(path,fName(f_no),'\')));
    fNamein = {listin.name};
    [~,y2]=size(fNamein);
    fName(f_no)
    for ff_no=3:y2
        listinin = dir(char(strcat(path,fName(f_no),'\',fNamein(ff_no),'\')));
        fNameinin = {listinin.name};
        [~,y3]=size(fNameinin);
        path2=char(strcat(path,fName(f_no),'\',fNamein(ff_no),'\'));
        sumimage=double(zeros(size((imread(char(strcat(path2,fNameinin(3))))))));
        for fff_no=3:y3           
            image=(imread(char(strcat(path2,fNameinin(fff_no)))));
            %image=imresize(image,size(sumimage));
            sumimage=sumimage+double(image);
        end
        max1=max(sumimage(:));
        energyimg=sumimage/max1;        
        if ~exist(char(strcat(save_path,fName(f_no),'\')),'dir')
            mkdir(char(strcat(save_path,fName(f_no),'\')));
        end        
        imwrite(energyimg,char(strcat(save_path,fName(f_no),'\',fNamein(ff_no),'.png')));
    end
end
toc;