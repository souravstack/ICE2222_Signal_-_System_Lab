clc;
clear all;
close all;
A = 5;
B = 3;
f1 = 3;    
f2 = 5;    
phi1 = 0;
phi2 = pi/6;  
fs = 100;      
ts = 1/fs;    
n = 0:1/fs:1;  
x1 = A * sin(2*pi*f1*n + phi1);
x2 = B * sin(2*pi*f2*n + phi2);
x3 = x1 + x2;
x3_rev = fliplr(x3);
x3_even = 0.5 * (x3 + x3_rev);
x3_odd  = 0.5 * (x3 - x3_rev);
x3_recon = x3_even + x3_odd;

x1_2n=A * sin(2*pi*f1*2*n + phi1);
x2_2n=A * sin(2*pi*f2*2*n + phi2);
y1=-(x1_2n)/2;
y2=-(x2_2n)/2;
x_sum=x1_2n+x2_2n;
y_sum=-(x_sum)/2;
y_sup=y1+y2;

if max(abs(y_sum - y_sup)) < 1e-6
    disp('System is linear');
else
    disp('System is nonlinear');
end

figure;

subplot(4,2,1);
stem(n,x1);
title('x1');
xlabel('n');
ylabel('Amplitude');

subplot(4,2,2);
stem(n,x2);
title('x2');
xlabel('n');
ylabel('Amplitude');

subplot(4,2,3);
stem(n,x3);
title('x3');
xlabel('n');
ylabel('Amplitude');

subplot(4,2,4);
stem(n,x3_rev);
title('x3 reverse');
xlabel('n');
ylabel('Amplitude');

subplot(4,2,5);
stem(n,x3_even);
title('Even');
xlabel('n');
ylabel('Amplitude');

subplot(4,2,6);
stem(n,x3_odd);
title('odd');
xlabel('n');
ylabel('Amplitude');

subplot(4,2,7);
stem(n,x3_recon);
title('Reconstructed');
xlabel('n');
ylabel('Amplitude');

