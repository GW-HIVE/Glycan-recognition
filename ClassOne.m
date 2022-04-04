%% ClassOne.m
% Abigail G Basener
% 6/14/2021

%% Adjusted by Tianyi Wang to integrate more neural nets
% Feb 25, 2022

%% Setup
imdsM = imageDatastore("/Users/Tianyi/Documents/GRAD/lab/AIMproject/NNFiles2.2/G01755WL.png","IncludeSubfolders",true,"LabelSource","foldernames");
net1 = load('DarkNet19_test.mat');
net1.net
net2 = load('DarkNet_Glycosphingolipid_multiGPU.mat');
net2.net
net3 = load('DarkNet_O-linked_multiGPU.mat');
net3.net
net4 = load('DarkNet_N-linked_multiGPU_2.mat');
net4.net
disp('loaded neural nets')
%% Run Net
imdsM = augmentedImageDatastore([256 256 3],imdsM);
[POC1] = predict(net1.net, imdsM); 
[POC2] = predict(net2.net, imdsM);
[POC3] = predict(net3.net, imdsM);
[POC4] = predict(net4.net, imdsM);

%% Obtain score from net1
[SScore1,Indx1] = sort(POC1,2);
[x,y] = size(Indx1);
for i = 1:5 % Gose though top 5 choices
    Names1(i) =  net1.net.Layers(end).Classes(Indx1(1,y-i+1))
end
SScore1 = SScore1(end:-1:end-4)

%% Obtain score from net2
[SScore2,Indx2] = sort(POC2,2);
[x,y] = size(Indx2);
for i = 1:5 % Gose though top 5 choices
    Names2(i) =  net2.net.Layers(end).Classes(Indx2(1,y-i+1))
end
SScore2 = SScore2(end:-1:end-4)

%% Obtain score from net3
[SScore3,Indx3] = sort(POC3,2);
[x,y] = size(Indx3);
for i = 1:5 % Gose though top 5 choices
    Names3(i) =  net3.net.Layers(end).Classes(Indx3(1,y-i+1))
end
SScore3 = SScore3(end:-1:end-4)

%% Obtain score from net4
[SScore4,Indx4] = sort(POC4,2);
[x,y] = size(Indx4);
for i = 1:5 % Gose though top 5 choices
    Names4(i) =  net4.net.Layers(end).Classes(Indx4(1,y-i+1))
end
SScore4 = SScore4(end:-1:end-4)

%% Sort top 5 scores from net1, net2, net3 and net4
SScore = [SScore1,SScore2,SScore3, SScore4];
Names = [Names1, Names2, Names3, Names4];
[~, Indx_final] = sort(SScore,2,'descend');
% [x,y] = size(Indx
for i = 1:5
    Names_final(i) = Names(Indx_final(i))
end

%% output
for n = 1:5
    %Print name and file
    Token = convertCharsToStrings(char(Names_final(n)))
    %Chang ID
    disp(Token);
    %Get&Display Image
    Token = strcat(Token,".png");
    Token = strcat("DataMaster/",Token);
    Token = convertCharsToStrings(Token);
    f1 = figure;
    imshow(Token);
end