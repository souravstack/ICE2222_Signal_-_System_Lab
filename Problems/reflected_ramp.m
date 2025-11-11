% clc; clear; close all;
% t = -10:1:10;
% x = t .* (t >= 0);
% x_neg = fliplr(x);
% 
% x_even = 0.5 * (x + x_neg);
% x_odd  = 0.5 * (x - x_neg);
% 
% figure;
% 
% subplot(4,1,1);
% stem(t, x, 'y', 'filled');
% title('Original Signal x(t)'); grid on;
% 
% subplot(4,1,2);
% stem(t, x_even, 'b', 'filled');
% title('Even Part'); grid on;
% 
% subplot(4,1,3);
% stem(t, x_odd, 'r', 'filled');
% title('Odd Part'); grid on;
% 
% subplot(4,1,4);
% stem(t, x_even + x_odd, 'g', 'filled');
% title('Reconstructed: Even + Odd'); grid on;




clc;clear;clear all;
t = -10:1:10;
x = t .* (t >= 0);
x_neg = fliplr(x);


x_even = 0.5 * (x + x_neg);
x_odd  = 0.5 * (x - x_neg);

figure;

subplot(4,1,1);
stem(t,x,'r','filled');
title("Original signal");

subplot(4,1,2);
stem(t,x_even,'r','filled');
title("even signal");

subplot(4,1,3);
stem(t,x_even,'r','filled');
title("odd signal");

subplot(4,1,4);
stem(t,x_even+x_odd,'r','filled');
title("reconstraction signal");