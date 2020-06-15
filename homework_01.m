clc;
clear all;

%% Problem 2
%Let x[n] = ?[n] + 2?[n-1] - ?[n-3] and h[n] = 2?[n+1] + 2?[n-1]. Compute 
%the following convolution: y[n] = x[n] * h[n].
xn = [0,1,2,3];
x  = [1,2,0,-1];

hn = [-1,0,1];
h  = [ 2,0,2];

y = conv(x,h);
yn = (min(xn)+min(hn)):(max(xn)+max(hn));

figure(2);clf
subplot(3,1,1);
hh=stem(xn,x,'b');hh.LineWidth=1.5;
grid('on');
hh=xlabel('\bfn');hh.FontSize=12;
hh=ylabel('\bfx[n]');hh.FontSize=14;

subplot(3,1,2);
hh=stem(hn,h,'g');hh.LineWidth=1.5;
grid('on');
hh=xlabel('\bfn');hh.FontSize=12;
hh=ylabel('\bfh[n]');hh.FontSize=14;

subplot(3,1,3);
hh=stem(yn,y,'r');hh.LineWidth=1.5;
grid('on');
hh=xlabel('\bfn');hh.FontSize=12;
hh=ylabel('\bfy[n]');hh.FontSize=14;
hh=sgtitle('\bfProblem 2');hh.FontSize=16;

%% Problem 3
u = @(n)1.0*(n>=0);
x = @(n) u(n+3)-u(n-4);
X = @(w,n)reshape(arrayfun(@(w)sum(x(n).*exp(-1j*w*n)),w),size(w));

n=-100:100;
w = linspace(-2*pi,2*pi,1000);
Xw = X(w,n);
figure(3);clf;
plot(w,abs(Xw),'LineWidth',1.5);
hh=xlabel('\bf\omega');hh.FontSize=14;
hh=ylabel('\bfX(\omega)');hh.FontSize=14;
grid('on');
axis('tight');
hh=title('\bfProblem 3');hh.FontSize=16;

%% Problem 5
HH=figure(5);clf;
num = [1,-.5,0,1];
den = [1,.5,.75];
freqz(num,den);
hh=sgtitle('\bfProblem 5');hh.FontSize=16;


%% Problem 6
num = [1];
den = [1,-.5];
x = @(n)1+exp(1j*pi*n);

n=-50:50;
xn = x(n);
yn = filter(num,den,xn);
lgc = (abs(n)<25);

figure(6);clf;
subplot(2,1,1);
% xn is actually real (but it has eps*j small imaginary)
hh=stem(n(lgc),real(xn(lgc)),'b');hh.LineWidth=1.5;
grid('on');
hh=xlabel('\bfn');hh.FontSize=12;
hh=ylabel('\bfx[n]');hh.FontSize=14;

subplot(2,1,2);
% yn is actually real (but it has eps*j small imaginary)
hh=stem(n(lgc),real(yn(lgc)),'g');hh.LineWidth=1.5;
grid('on');
hh=xlabel('\bfn');hh.FontSize=12;
hh=ylabel('\bfy[n]');hh.FontSize=14;
hh=sgtitle('\bfProblem 6');hh.FontSize=16;



