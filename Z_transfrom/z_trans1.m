clc;
clear;
close all;

% 1. Define constant 'a'
a = 3/4; 

% 2. Derive the Z-transform manually
syms z
Xz = z / (z - a);

% 3. Simplify the rational form
Xz_simplified = simplify(Xz);

% 4. Show numerator and denominator coefficients
[num_sym, den_sym] = numden(Xz_simplified);
num = sym2poly(num_sym);
den = sym2poly(den_sym);

% 5. Compute poles and zeros
poles = roots(den);
zeros = roots(num);

disp('Poles:');
disp(poles);
disp('Zeros:');
disp(zeros);

% 6. Determine ROC
roc = sprintf('|z| > %.2f', abs(a));
disp('Region of Convergence (ROC): ');
disp(roc);

% 7. Plot Pole-Zero Diagram
figure;
hold on; grid on; axis equal;
title('Pole-Zero Plot of X(z)');
xlabel('Real Axis'); ylabel('Imag Axis');

% Unit circle
theta = linspace(0, 2*pi, 300);
plot(cos(theta), sin(theta), 'g--', 'LineWidth', 1);

% Plot poles and zeros
plot(real(zeros), imag(zeros), 'bo', 'MarkerSize', 8, 'LineWidth', 2);
plot(real(poles), imag(poles), 'rx', 'MarkerSize', 8, 'LineWidth', 2);

% Annotate values
if ~isempty(zeros)
    text(real(zeros), imag(zeros)+0.1, sprintf('%.2f', zeros), 'Color','b','HorizontalAlignment','center');
end
if ~isempty(poles)
    text(real(poles), imag(poles)-0.1, sprintf('%.2f', poles), 'Color','r','HorizontalAlignment','center');
end

legend('Unit Circle','Zeros','Poles');
hold off;

% 8. Display final symbolic result
disp('Final Z-transform X(z) = ');
disp(Xz_simplified);
