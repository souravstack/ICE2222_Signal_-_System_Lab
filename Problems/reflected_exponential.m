clc; clear; close all;

% Parameters
A = 60; a = 6; phi = 0;
sf = 100;                    % Sampling frequency
t_start = -1; t_end = 1;
t_increment = 1/sf;
sin_tp = 0.1; f = 1/sin_tp;
n0 = 0;

% Time vector
t = t_start:t_increment:t_end;
n = length(t);

% Original signal x(t)
x = zeros(1, n);
for i = 1:n
    if t(i) >= n0
        x(i) = A * exp(a * t(i)) * cos(2 * pi * f * t(i) + phi);
    else
        x(i) = 0;
    end
end

% Reflected signal x(-t) manually

% x_reflected = zeros(1, n);
% for i = 1:n
%     [~, j] = min(abs(t + t(i)));  % Find index where t(j) ? -t(i)
%     x_reflected(i) = x(j);
% end

x_reflected = fliplr(x);


% Even and Odd components
x_even = 0.5 * (x + x_reflected);
x_odd  = 0.5 * (x - x_reflected);

% Sum of even + odd
x_reconstructed = x_even + x_odd;

% ---- Plotting ----
figure;

subplot(3,2,1)
plot(t, x, 'b', 'LineWidth', 1.5);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,2,2)
plot(t, x_reflected, 'm', 'LineWidth', 1.5);
title('Reflected Signal (x(-t))');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,2,3)
plot(t, x_even, 'r--', 'LineWidth', 1.5);
title('Even Component');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,2,4)
plot(t, x_odd, 'g--', 'LineWidth', 1.5);
title('Odd Component');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,2,5.5)  % Bottom row spans both columns
plot(t, x, 'b', 'LineWidth', 1.5); hold on;
plot(t, x_reconstructed, 'k--', 'LineWidth', 1.5);
title('Original vs Even + Odd');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original', 'Even + Odd');
grid on;

ylabel('Amplitude');
grid on;




