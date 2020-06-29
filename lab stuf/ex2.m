x=randn(1000,1);
a=2;
b=1;
y=a*x+b;
J=abs(a);


py=0;
for i = 1:1 %only one possible value for x given y
    py = normpdf((y-b)/a,0,1)/J ;
end
    
%Plot Normal Distributions
figure(1)
subplot(221),
histogram(y,20)
hold on
scatter(y,py*700,'blue')
f = @(x) 1/(sqrt(2*pi)*a) *exp(-0.5*(x-b)^2/(a^2)) *700
fplot(f,[-5,5],'red','LineWidth',1.5)
hold off
title('\fontsize{14}a=2, b=1')


subplot(222),
a=10;
b=1;
y=a*x+b;
J=abs(a);
py=0;
for i = 1:1 %only one possible value for x given y
    py = normpdf((y-b)/a,0,1)/J ;
end
histogram(y,20)
hold on
scatter(y,py*3200,'blue')
f = @(x) 1/(sqrt(2*pi)*a) *exp(-0.5*(x-b)^2/(a^2)) *3200
fplot(f,[-25,25],'red','LineWidth',1.5)
hold off
title('\fontsize{14}a=10, b=1')

subplot(223),
a=2;
b=10;
y=a*x+b;
J=abs(a);
py=0;
for i = 1:1 %only one possible value for x given y
    py = normpdf((y-b)/a,0,1)/J ;
end
histogram(y,20)
hold on
scatter(y,py*700,'blue')
f = @(x) 1/(sqrt(2*pi)*a) *exp(-0.5*(x-b)^2/(a^2)) *700
fplot(f,[5,15],'red','LineWidth',1.5)
hold off
title('\fontsize{14}a=2, b=10')


subplot(224),
a=10;
b=10;
y=a*x+b;
J=abs(a);
py=0;
for i = 1:1 %only one possible value for x given y
    py = normpdf((y-b)/a,0,1)/J ;
end
histogram(y,20)
hold on
scatter(y,py*3200,'blue')
f = @(x) 1/(sqrt(2*pi)*a) *exp(-0.5*(x-b)^2/(a^2)) *3200
fplot(f,[-25,40],'red','LineWidth',1.5)
hold off
title('\fontsize{14}a=10, b=10')
