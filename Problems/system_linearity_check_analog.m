clc; clear; close all;

%% ===== GIVEN PARAMETERS =====
A = 5; B = 3;
f1 = 3; f2 = 5;
phi1 = 0; phi2 = deg2rad(30);
fs = 100; Ts = 1/fs;
n = 0:Ts:1;

%% ===== CREATE SIGNALS =====
x1 = A*sin(2*pi*f1*n + phi1);
x2 = B*sin(2*pi*f2*n + phi2);
x3 = x1 + x2;

%% ===== (i) EVEN & ODD PARTS =====
n_full = [-fliplr(n(2:end)) n];        % negative + positive indices
x3_full = [fliplr(x3(2:end)) x3];     % mirror signal

xe = 0.5 * (x3_full + fliplr(x3_full));  % Even part
xo = 0.5 * (x3_full - fliplr(x3_full));  % Odd part

x3_reconstructed = xe + xo;  % check reconstruction

%% ===== (ii) LINEARITY TEST =====
y1 = -(interp1(n,x1,2*n,'linear',0))/3;
y2 = -(interp1(n,x2,2*n,'linear',0))/3;
y3 = -(interp1(n,x3,2*n,'linear',0))/3;
linearity_error = max(abs(y3 - (y1+y2)));

%% ===== PLOTS =====
figure;
subplot(4,1,1);
stem(n,x1);
title('x1(n)'); legend('x1'); grid on;

subplot(4,1,2);
stem(n,x2);
title('x2(n)'); legend('x2'); grid on;


subplot(4,1,3);
stem(n,x3,'g','LineWidth',1.2);
title('x3(n) = x1(n) + x2(n)'); grid on;

subplot(4,1,4);
stem(n_full,x3_reconstructed,'g','LineWidth',1.2);
title('Reconstructed x3(n) from xe and xo'); grid on;

% ----- EVEN PART -----
figure;
stem(n_full,xe,'g','LineWidth',1.5);
title('Even Part of x3(n)'); xlabel('n'); ylabel('xe(n)'); grid on;

% ----- ODD PART -----
figure;
stem(n_full,xo,'m','LineWidth',1.5);
title('Odd Part of x3(n)'); xlabel('n'); ylabel('xo(n)'); grid on;

% ----- LINEARITY CHECK -----
figure;
plot(n,y3,'k','LineWidth',1.2); hold on;
stem(n,y1+y2,'r--','LineWidth',1.2);
title(['System Linearity Check (Error ? ' num2str(linearity_error) ')']);
legend('y3','y1+y2'); grid on;



