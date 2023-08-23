function G = NVG_alg(ts, left, right, G, t, weight)
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

if left < right
    if var(ts(left:right)) ~= 0 %this check avoids that matlab returns error of infinite recursion for constant time-series

        k = find(ts(left:right) == max(ts(left:right))); %[~,k]=max(ts(left:right));
        [~, k_interm] = min(abs(k - (right - left) / 2));
        k = k(k_interm);

        k = k + left - 1;
        tsk = ts(k);
        tk = t(k);
        beta = pi; %maximum visibility angle
        neigs_k = zeros(right-left+1, 1);
        if weight == 2
            weight_k = zeros(right-left+1, 1);
        end
        cn = 1;
        for ii = k - 1:-1:left
            alfa = atan((ts(ii)-tsk)/(t(ii) - tk));
            if alfa < beta
                neigs_k(cn) = ii;
                if weight == 2
                    %define your weight! -> e.g., I used "alfa/2"
                    weight_k(cn) = alfa / 2;
                end
                beta = alfa;
                cn = cn + 1;
            end
        end
        beta = -pi; %minimum visibility angle
        for ii = k + 1:right
            alfa = atan((ts(ii)-tsk)/(t(ii) - tk));
            if alfa > beta
                neigs_k(cn) = ii;
                if weight == 2
                    %define your weight! -> e.g., I used "alfa/2"
                    weight_k(cn) = alfa / 2;
                end
                beta = alfa;
                cn = cn + 1;
            end
        end
        G{k, 1} = neigs_k(1:cn-1);
        if weight == 2
            G{k, 2} = weight_k(1:cn-1);
        end
        G = NVG_alg(ts, left, k-1, G, t, weight);
        G = NVG_alg(ts, k+1, right, G, t, weight);
    else
        for ii = left:right - 1
            G{ii, 1} = [G{ii, 1}; ii + 1]; %add only next node (neighbour) in the series
            if weight == 2
                %define your weight! -> e.g., I used "ii/2"
                G{ii, 2} = [G{ii, 2}; ii / 2];
            end
            %         end
        end
    end

    return;
end