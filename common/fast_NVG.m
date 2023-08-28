function [VG] = fast_NVG(signal_var, coords_var, weight, Period)
% Implementation of natural visibility graph based on:
% Lacasa, L., Luque, B., Ballesteros, F., Luque, J., & Nuno, J. C. (2008).
% From time series to complex networks: The visibility graph.
% PNAS, 105(13), 4972-4975.
% ===============================================================
% Code by: Giovanni Iacobello, Politecnico di Torino (Italy)
% giovanni.iacobello@polito.it
% ===============================================================
% INPUTS:
% signal_var: series with data values (must be a vector)
% coords_var: independent variable (e.g., time or space) vector (same length of signal_var)
% weight: char value. 'u' = unweighted (default); 'w' = weighted
% B_period: flag value. 0 = no signal periodicity (default); 1= boundary periodicity.
%           For time-series, B_period must be always 0.
%
% OUTPUTS:
% VG: sparse adjacency matrix (symmetrical)
%

%%  INPUT CHECK

VG = [];
if isvector(signal_var) == 0 || isvector(coords_var) == 0
    disp('Error size: series and coordinates must be vectors')
    return;
end
if length(signal_var) ~= length(coords_var)
    disp('Error size: series and coordinates must have the same length')
    return;
end
if iscolumn(signal_var) == 0
    signal_var = signal_var';
end
if iscolumn(coords_var) == 0
    coords_var = coords_var';
end
if exist('weight', 'var') == 0
    weight = 'u';
elseif ischar(weight) == 0 || (strcmp(weight, 'u') + strcmp(weight, 'w')) == 0
    disp('Error weight: ''u''=unweighted; ''w''=weighted ')
    return;
end
if exist('B_period', 'var') == 0
    Period = 0;
elseif isscalar(Period) == 0 || sum(ismember([0, 1], Period)) == 0
    disp('Error boundary periodicity: ''0''=no periodicity; ''1''=periodicity ')
    return;
end
if Period == 1 && length(unique(diff(coords_var))) ~= 1
    disp('Error: the vector with coordinates must be uniformly-spaced. Use NaN in the signal to account for non-uniform sampling.')
    disp('E.g.: signal_var=[1,NaN,4.2,NaN,NaN,8.4]; coords_var=[1,2,3,4,5,6]')
    return;
end

%% PRE-PROCESSING

if Period == 0
    TS2map = signal_var;
    TT2map = coords_var;
elseif Period == 1
    %re-arrange the signal to account for boundary periodicity
    Nt = size(signal_var, 1);
    [~, peaks_signal_ind] = max(signal_var);
    [~, sorted_indx] = sort([(peaks_signal_ind:Nt)'; (1:peaks_signal_ind - 1)'], 'ascend'); %keep the indexing order
    TS2map = [signal_var(peaks_signal_ind:end); signal_var(1:peaks_signal_ind)]; % the peaks_signal_ind node is put both at the beginning and at the end of the new signal
    TT2map = (1:length(TS2map))';
end

weight = find(ismember({'u', 'w'}, weight)); %weight=1 or 2
clear signal_var coords_var

%% RUNNING
N = size(TS2map, 1);
B = cell(N, weight);
B = NVG_alg(TS2map, 1, N, B, TT2map, weight);

%% CONVERTING INTO SPARSE MATRIX

Adj_tmp = cell(N, 1);
for ii = 1:N
    Adj_tmp{ii} = ones(length(B{ii, 1}), 1) * ii;
end
target = vertcat(Adj_tmp{:});
clear A_tmp
source = vertcat(B{:, 1});

if weight == 1
    weight_input = ones(size(target));
elseif weight == 2
    weight_input = cell(N, 1);
    for ii = 1:N
        if isempty(B{ii, 1}) == 0
            weight_input{ii} = B{ii, 2};
        end
    end
    weight_input = vertcat(weight_input{:});
end

if ~isa(source, 'double')
    source = double(source); %"sparse" function requires doubles
end
VG = sparse(source, target, weight_input, N, N);
VG = VG + VG'; %makes adjcency matrix simmetrical

%% restore the original indexing and remove duplicate links
if Period == 1
    % remove the link between the maximum with the auxiliary node (they are the same node)
    VG(1, end) = 0;
    VG(end, 1) = 0;
    %merge the links from the maximum (1st node) and the auxiliary (last node)
    VG(:, 1) = or(VG(:, 1), VG(:, end));
    VG(1, :) = VG(:, 1)'; %=or(A(1,:),A(end,:));
    % remore the auxiliary node
    VG(:, end) = [];
    VG(end, :) = [];
    % restore the initial indexing
    VG = VG(sorted_indx, sorted_indx);
end

end
