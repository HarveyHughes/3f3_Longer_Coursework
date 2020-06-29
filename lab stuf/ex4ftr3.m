v=exprnd(1,1000000,1);
u=rand(1000000,1);
u=(u-0.5)*pi ;
alphavals=[0.5,1,1.5,1.75,2];
beta=0;
x=zeros(length(u),length(alphavals));
pdfx=zeros(1000,length(alphavals));
xi=zeros(1000,length(alphavals));
pts = linspace(-4,4,1000); % points to evaluate the estimator
for i = 1:length(alphavals)
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
n = [-4:.1:4];
for i = 1:length(alphavals)
   hold on
   plot(xi(:,i),pdfx(:,i),'LineWidth',1)
   hold off
end
hold on
norm = normpdf(n,0,sqrt(2));
plot(n,norm,'--red','LineWidth',1)
hold off
legend('\alpha = 0.5','\alpha = 1','\alpha = 1.5','\alpha = 1.75','\alpha = 2','Gaussian(0,2)')


