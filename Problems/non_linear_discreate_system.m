N =64;
n= 0:N-1;fs=32;
f1=1;f2=1;
x1 = sin(2*pi*f1*n/fs);
x2 = sin(2*pi*f2*n/fs);
x3 = x1+x2;

y1 = x1.^2;
y2 = x2.^2;
y3 = x3.^2;

ys = y1+y2;
Lc = y3 - ys;

figure;
subplot(3,3,1);stem(n,x1);title('x1(n):1-Hz sine');
subplot(3,3,2);stem(n,y1);title('y1(n)=x1(n)^2');
subplot(3,3,3);stem(n,y3);title('y3(n)=x3(n)^2');

subplot(3,3,4);stem(n,x2);title('x2(n):1-Hz sine');
subplot(3,3,5);stem(n,y2);title('y2(n)=x2(n)^2');
subplot(3,3,6);stem(n,ys);title('ys=(y1+y2)');

subplot(3,3,7);stem(n,x3);title('x3(n):1-Hz sine');
subplot(3,3,8);stem(n,y3);title('y3(n)=x3(n)^2');
subplot(3,3,9);stem(n,Lc);title('Lc=y3-ys');
