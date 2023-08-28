clc;
clear;

Class_Num = 25;
Sampling_Num = 40;
Channel = 3;
Max_K = 100;

Label_Mat = zeros(Class_Num*Sampling_Num, 1);

Total_Degree_D = [];

for index_i = 1:3;
    % Img=[0.3 0.2 0.6; 0.6 0 0.6; 0.5 0.2 0.9];
    Degree_D = [];

    for index_j = 1:Class_Num
        for index_k = 1:1:Sampling_Num
            Path_1 = 'C:\Users\Administrator\Documents\Tencent Files\1937199504\FileRecv\data\datasets\UMD\';
            Path_2 = num2str(index_j);
            Path_3 = '\';
            Path_4 = num2str(index_k);
            Path_5 = ".png";
            fullfile = strcat(Path_1, Path_2, Path_3, Path_4, Path_5);
            Image = imread(fullfile);

            Original_Image = im2double(Image);
            Original_Image = imcomplement(Original_Image);

            Img = Original_Image(:, :, index_i);
            Graph_G = Complement_imageVisibilityGraph(Img, 'natural', true);
            Graph_G = graph(Graph_G(:, 1), Graph_G(:, 2));
            Deg_seq = degree(Graph_G);
            Pk = hist(Deg_seq, 1:1:Max_K) ./ (size(Original_Image, 1) * size(Original_Image, 2));
            Degree_D = [Degree_D; Pk];

            Label_Mat((index_j - 1)*Sampling_Num+index_k, 1) = index_j;
        end
    end

    Total_Degree_D = [Degree_D, Total_Degree_D];

end

Total_Degree_D(:, 3*Max_K+1) = Label_Mat(:);