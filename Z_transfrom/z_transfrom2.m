
clc; 
clear;
close all;
% 1. Define constants
a1 = 5/6;
a2 = 1/4;

% 2. Derive the function  manually

syms z
Xz = 2*z/(a1 - z) + 3*z/(z - a2);
disp('Z-transform X(z) = ');
pretty(Xz)

% 3. Simplify to single rational function

Xz_simplified = simplify(Xz);
disp('Simplified rational form of X(z): ');
pretty(Xz_simplified)

% 4. show numerator and denominator coefficient

[num_sym, den_sym] = numden(Xz_simplified);
num = sym2poly(num_sym);
den = sym2poly(den_sym);

disp('Numerator coefficients: ');
disp(num);
disp('Denominator coefficients: ');
disp(den);



% 5.  compute manually  poles and zeros  Using quadratic formula

a = den(1); b = den(2); c = den(3);
p1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
p2 = (-b - sqrt(b^2 - 4*a*c)) / (2*a);

a = num(1); b = num(2); c = num(3);
if a ~= 0
    z1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
    z2 = (-b - sqrt(b^2 - 4*a*c)) / (2*a);
else
    % Handle simple zero at z=0 if highest power term missing
    z1 = 0;
    z2 = -c/b;
end

disp('Poles:');
disp([p1 p2]);
disp('Zeros:');
disp([z1 z2]);


% 6. Determine ROC 

roc = sprintf('|z| > %.2f', max(abs([a1 a2])));
disp('Region of Convergence (ROC): ');
disp(roc);

% 7. Plot Pole-Zero diagram manually

figure;
hold on; grid on; axis equal;
title('Pole-Zero Plot of X(z)');
xlabel('Real Axis'); ylabel('Imag Axis');

% Unit circle
theta = linspace(0, 2*pi, 300);
plot(cos(theta), sin(theta), 'k--', 'LineWidth', 1);

% Plot poles and zeros
plot([z1 z2], [0 0], 'bo', 'MarkerSize', 8, 'LineWidth', 2);
plot([p1 p2], [0 0], 'rx', 'MarkerSize', 8, 'LineWidth', 2);

% Annotate values(Extra notation) 
text(z1, 0.08, sprintf('%.2f', z1), 'Color','b','HorizontalAlignment','center');
text(z2, 0.08, sprintf('%.2f', z2), 'Color','b','HorizontalAlignment','center');
text(p1, -0.1, sprintf('%.2f', p1), 'Color','r','HorizontalAlignment','center');
text(p2, -0.1, sprintf('%.2f', p2), 'Color','r','HorizontalAlignment','center');

legend('Unit Circle','Zeros','Poles');
hold off;

% 8. Display final symbolic result

disp('Final Z-transform X(z) = ');
disp(Xz_simplified);
