clc;
clear;

Class_num = 25;
Sampling_num = 40;
Channel = 3;
maxK = 100;

Label_Mat = zeros(Class_num*Sampling_num, 1);

Pkss = [];

for i = 1:1;
    % Img=[0.3 0.2 0.6; 0.6 0 0.6; 0.5 0.2 0.9];
    Pks = [];

    for j = 1:Class_num
        for k = 1:1:Sampling_num
            name_1 = 'C:\Users\Administrator\Desktop\data\datasets\UMD\';
            name_2 = num2str(j);
            name_3 = '\';
            name_4 = num2str(k);
            name_5 = ".png";
            fullfile = strcat(name_1, name_2, name_3, name_4, name_5);
            I = imread(fullfile);

            Original_Image = im2double(I);
            Original_Image = imcomplement(Original_Image);

            Img = Original_Image(:, :, i);
            G = Complement_imageVisibilityGraph(Img, 'natural', true);
            G = graph(G(:, 1), G(:, 2));
            Deg_seq = degree(G);
            Pk = hist(Deg_seq, 1:1:maxK) ./ (size(Original_Image, 1) * size(Original_Image, 2));
            Pks = [Pks; Pk];

            Label_Mat((j - 1)*Sampling_num+k, 1) = j;
        end
    end

    Pkss = [Pks, Pkss];

end

Pkss(:, 3*maxK+1) = Label_Mat(:);