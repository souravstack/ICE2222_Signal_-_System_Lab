clc;clear;close all;
n_sig=[];A=5;phi=0;
sf=100;
t_start=0;t_end=1
t_increment=1/sf;
sin_tp=0.2; f=1/sin_tp;

n_sig(1,:)=t_start:t_increment:t_end;
ind=0
for t=t_start:t_increment:t_end
    ind=ind+1;
    n_sig(2,ind)=A * sin(2*pi*f*t + phi);
end

figure(1)
plot(n_sig(1,:),n_sig(2,:),'b*--');
grid on
('Time(second)');
ylabel('Signal Amplide')
title('Sinusoidal Signal');
