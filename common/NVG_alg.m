function Graph_G = NVG_alg(Time_Series, Data_Left, Dta_Right, Graph_G, Time, Weight)
% Natural visibility algorithm fast based on:
% Lan, X., Mo, H., Chen, S., Liu, Q., & Deng, Y. (2015).
% Fast transformation from time series to visibility graphs.
% Chaos, 25(8), 083105.
% ===============================================================
% Code by: Giovanni Iacobello, Politecnico di Torino (Italy)
% giovanni.iacobello@polito.it
% ===============================================================
%   ts= series with data values
%   left= first data index
%   right= last data index
%   G=adjacency list (cell array)
%   t=time vector (e.g., 1,2,3,4,...)

if Data_Left < Dta_Right
    if var(Time_Series(Data_Left:Dta_Right)) ~= 0 %this check avoids that matlab returns error of infinite recursion for constant time-series

        index_k = find(Time_Series(Data_Left:Dta_Right) == max(Time_Series(Data_Left:Dta_Right))); %[~,k]=max(ts(left:right));
        [~, k_interm] = min(abs(index_k - (Dta_Right - Data_Left) / 2));
        index_k = index_k(k_interm);

        index_k = index_k + Data_Left - 1;
        tsk = Time_Series(index_k);
        tk = Time(index_k);
        beta = pi; %maximum visibility angle
        neigs_k = zeros(Dta_Right-Data_Left+1, 1);
        if Weight == 2
            weight_k = zeros(Dta_Right-Data_Left+1, 1);
        end
        index_cn = 1;
        for index_ii = index_k - 1:-1:Data_Left
            alfa = atan((Time_Series(index_ii)-tsk)/(Time(index_ii) - tk));
            if alfa < beta
                neigs_k(index_cn) = index_ii;
                if Weight == 2
                    %define your weight! -> e.g., I used "alfa/2"
                    weight_k(index_cn) = alfa / 2;
                end
                beta = alfa;
                index_cn = index_cn + 1;
            end
        end
        beta = -pi; %minimum visibility angle
        for index_ii = index_k + 1:Dta_Right
            alfa = atan((Time_Series(index_ii)-tsk)/(Time(index_ii) - tk));
            if alfa > beta
                neigs_k(index_cn) = index_ii;
                if Weight == 2
                    %define your weight! -> e.g., I used "alfa/2"
                    weight_k(index_cn) = alfa / 2;
                end
                beta = alfa;
                index_cn = index_cn + 1;
            end
        end
        Graph_G{index_k, 1} = neigs_k(1:index_cn-1);
        if Weight == 2
            Graph_G{index_k, 2} = weight_k(1:index_cn-1);
        end
        Graph_G = NVG_alg(Time_Series, Data_Left, index_k-1, Graph_G, Time, Weight);
        Graph_G = NVG_alg(Time_Series, index_k+1, Dta_Right, Graph_G, Time, Weight);
    else
        for index_ii = Data_Left:Dta_Right - 1
            Graph_G{index_ii, 1} = [Graph_G{index_ii, 1}; index_ii + 1]; %add only next node (neighbour) in the series
            if Weight == 2
                %define your weight! -> e.g., I used "ii/2"
                Graph_G{index_ii, 2} = [Graph_G{index_ii, 2}; index_ii / 2];
            end
            %end
        end
    end

    return;
end