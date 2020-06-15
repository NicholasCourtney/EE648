clc;
clear all;

u = @(n)1.*(n>=0);
delta = @(n)1.*(n==0);

%% Problem 3

num = [4,.25,-.5];
den = conv([1,-.25],[1,.5]);


n = 0:10;
h = filter(num,den,delta(n));

figure(34);
hh=stem(n,h,'LineWidth',1.5);
grid('on');
hh=xlabel('\bfn');hh.FontSize=14;
hh=ylabel('\bfh[n]');hh.FontSize=14;
hh=title('\bfProblem 3.D');hh.FontSize=16;

n=-40:40;
xn = @(n)u(-n-1);
x = xn(n);
y = filter(num,den,x);
lgc = (abs(n)<floor(max(abs(n)*.5)));
%need to cut out a little because of settling time with filter beginning
%transient
figure(36);
subplot(2,1,1);
hh=stem(n(lgc),x(lgc),'LineWidth',1.5);
grid('on');
hh=xlabel('\bfn');hh.FontSize=14;
hh=ylabel('\bfx[n]');hh.FontSize=14;
axis('tight');

subplot(2,1,2);
hh=stem(n(lgc),y(lgc),'LineWidth',1.5);
grid('on');
hh=xlabel('\bfn');hh.FontSize=14;
hh=ylabel('\bfy[n]');hh.FontSize=14;
axis('tight');

hh=sgtitle('\bfProblem 3.F');hh.FontSize=16;


%% Problem 4
num = [1];
den = [1,-2];

z = roots(num);
p = roots(den);

figure(40);
clf;
legs={};
hold('on');
if(~isempty(z))
  plot(real(z),imag(z),'bo','MarkerSize',15,'LineWidth',1.5);
  legs{end+1}='Zeros';
end
if(~isempty(p))
  plot(real(p),imag(p),'rx','MarkerSize',15,'LineWidth',1.5);
  legs{end+1}='Poles';
end
th=linspace(0,2*pi,1e3);
plot(cos(th),sin(th),'k--');
legs{end+1}='Unit Circle';
legend(legs);
axis('square');
hh=xlabel('\bfreal');hh.FontSize=14;
hh=ylabel('\bfimag');hh.FontSize=14;
hh=title('\bfProblem 4');hh.FontSize=16;