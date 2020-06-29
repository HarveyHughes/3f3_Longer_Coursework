v=exprnd(1,10000000,1);
u=rand(10000000,1);
u=(u-0.5)*pi ;
alphavals=[0.5,1.5];
beta=0;
x=zeros(length(u),2);
pdfx=zeros(1000,2);
xi=zeros(1000,2);
pts = linspace(0,100,1000); % points to evaluate the estimator
for i = 1:2
alpha = alphavals(i);
b=1/alpha * atan(beta*tan(pi*alpha/2)) ;
s=(1+beta^2*(tan(pi*alpha/2))^2)^(1/(2*alpha));
x(:,i)=s* sin(alpha*(u+b))./(cos(u).^(1/alpha)).* (cos(u-alpha*(u+b))./v).^((1-alpha)/alpha); 
%[pdfx(:,i),xi(:,i)] = ksdensity(x(:,i),pts);
[p,xd]=ksdensity(x(:,i),pts);
pdfx(:,i)=p;
xi(:,i)=xd;
end
figure(1)
lgpdfx=log10(pdfx);
subplot(2,2,1),
plot(xi(:,1),pdfx(:,1),'red')
%axis([-20 20 0 1])
tit = strcat('\fontsize{18} \alpha=0.5 \fontsize{18} , \beta=0 pdf');
title(tit)
subplot(2,2,2)
plot(xi(:,1),lgpdfx(:,1),'blue')
tit = strcat(' \fontsize{18}Log plot of \alpha=0.5 \fontsize{18} , \beta=0 pdf');
title(tit)
xlim([0 100]);
f = @(x) -0.008*x-2.8;
hold on
fplot(f,[0,100],'red')
hold off


subplot(2,2,3),
plot(xi(:,2),pdfx(:,2),'red')
%axis([-20 20 0 1])
tit = strcat('\fontsize{18} \alpha=1.5 \fontsize{18} , \beta=0 pdf');
title(tit)
subplot(2,2,4)
plot(xi(:,2),lgpdfx(:,2),'blue')
tit = strcat(' \fontsize{18}Log plot of \alpha=1.5 \fontsize{18} , \beta=0 pdf');
title(tit)
xlim([0 100]);
f = @(x) -0.015*x-3.9;
hold on
fplot(f,[0,100],'red')
hold off



