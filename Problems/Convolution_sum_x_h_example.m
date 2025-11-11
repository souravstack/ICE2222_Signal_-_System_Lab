clc;   clear;   close all;
% Given sequences
x = [1, 2, 3, 1];
h = [1, 2, 1, -1];
% Indices for x(k) and h(k)
nx = 0:length(x)-1;     % Indices for x(k), where the first element is at n=0
nh = -1:length(h)-2;    % Indices for h(k), where the second element (2) is at n=0
% Determine the range for the convolution sum
ny_start = min(nx) + min(nh);
ny_end = max(nx) + max(nh);
ny = ny_start:ny_end;
y = zeros(1, length(ny));

% Step 1:Fold h(k) to get h(-k)
% Discrete-time Reflected Impulse Response Signal h(-k):
n_orig = h;
h_folded = [];
index_t = 0;
index_refl = length(n_orig);     
for ii = 1:index_refl
    index_t = index_t + 1;
    h_folded(1,index_t) = n_orig(1,index_refl);            
    index_refl = index_refl - 1;
end
%h_folded
% Discrete-time indices of Reflected Impulse Signal:
n_ind = nh;
nh_folded = [];
index_t = 0;
index_refl = length(n_ind);     
for ii = 1:index_refl
    index_t = index_t + 1;
    nh_folded(1,index_t) = -1*n_ind(1,index_refl);            
    index_refl = index_refl - 1;
end
%nh_folded
% Step 2, 3, 4 & 5: Loop to compute the convolution sum for each time index n
for n_idx = 1:length(ny)
    n = ny(n_idx);
    % Step 2: Shift h(-k) by n to get h(n-k)
    h_shifted_indices = nh_folded + n;
    % Step 3: Multiply x(k) by h(n-k)
    % Find overlapping indices for x(k) and h(n-k)
    [overlap_indices, ia, ib] = intersect(nx, h_shifted_indices);
    % Initialize product sequence
    product_sequence = zeros(1, length(overlap_indices));
    if ~isempty(overlap_indices)
        % Get the corresponding values from x and h
        x_values = x(ia);
        h_values = h_folded(ib);
        % Multiply the values
        product_sequence = x_values .* h_values;
    end
    % Step 4: Sum all the values of the product sequence
    y(n_idx) = sum(product_sequence);
end
% Display the results
disp('Sequence x(k):');
disp(x);
disp('Time-indices for x(k):');
disp(nx);
disp(' ');
disp('Sequence h(k):');
disp(h);
disp('Time-indices for h(k):');
disp(nh);
disp(' ');
disp('Convolution sum y(n):');
disp(y);
disp('Time-indices for y(n):');
disp(ny);
% Verify with Matlab's built-in conv function
y_matlab = conv(x, h);
disp(' ');
disp('Verification with Matlab''s conv function:');
disp(y_matlab);

