v=exprnd(1,1000,1);
u=rand(1000,1);
u=(u-0.5)*pi ;
alpha=0.5;
betavals=[-1,-0.5,0,0.5,1,-1,-0.5,0,0.5,1];
x=zeros(length(u),10);

figure(1)
histrange=50;
range=700;

for i = 1:10
beta = betavals(i);
if i>5
    alpha = 1.5;
    histrange=10;
    range=400;
end 
b=1/alpha * atan(beta*tan(pi*alpha/2)) ;
s=(1+beta^2*(tan(pi*alpha/2))^2)^(1/(2*alpha));
x(:,i)=s* sin(alpha*(u+b))./(cos(u).^(1/alpha)).* (cos(u-alpha*(u+b))./v).^((1-alpha)/alpha); 
subplot(2,5,i),
histogram(x(:,i),[-histrange:histrange/10:histrange])
axis([-histrange histrange 0 range])
tit = strcat('\fontsize{18} \alpha=',num2str(alpha), '\fontsize{18} , \beta=',num2str(beta));
title(tit)
end







