clc
clear all;
close all;
Train_AlexNet_Feature=[];
Train_AlexNet_Label=[];
Dataset='Train';
files=ls(Dataset)
files(1,:)=[]
files(1,:)=[]
%length(files)
for i=1:size(files,1)
    files2=strcat(Dataset,'\',files(i,:))
    files3=ls(files2)
    files3(1,:)=[]
    files3(1,:)=[]
    for j=1:size(files3,1)
        files4=strcat(files2,'\',files3(j,:))
        I=imread(files4);
        g=imresize(I,[227,227]);
        net=alexnet;
        net.Layers;
        layer='fc7';
        F=activations(net,g,layer,'outputAs','rows');
        Train_AlexNet_Feature=[Train_AlexNet_Feature;F];
            if(files(i,:)=='1 ')
            Train_AlexNet_Label=[Train_AlexNet_Label;1];
            else
            Train_AlexNet_Label=[Train_AlexNet_Label;0];
            end
        %pause(1)
    end
end
save('Train_AlexNet_Feature','Train_AlexNet_Feature')
save('Train_AlexNet_Label','Train_AlexNet_Label')
