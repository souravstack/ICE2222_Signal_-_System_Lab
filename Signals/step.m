clc; clear; close all;
n0 = 0; n1 = -5; n2 = 5;
total_len = abs(n1) + abs(n2) + 1;
x = zeros(2, total_len);
x(1, :) = n1:n2;

ind = 0;
for ii = n1:n2
    ind = ind + 1;
    if ii >= n0
        x(2, ind) = 1;
    else
        x(2, ind) = 0;
    end
end

figure(1)
plot(x(1, :), x(2, :), 'o');
hold on
plot([0, 0], [0, 1], 'r', 'LineWidth', 1)
title('Discrete impulse Function')
xlabel('value of x')
ylabel('value of y')
