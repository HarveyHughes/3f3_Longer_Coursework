v=exprnd(1,10000,1);
u=rand(10000,1);
u=(u-0.5)*pi ;
alphavals=[0.5,1.5];
beta=0;
tvalues=[0,1,3,6];
x=zeros(length(u),2);
tailprob=zeros(4,4);

for i = 1:2
alpha = alphavals(i);
b=1/alpha * atan(beta*tan(pi*alpha/2)) ;
s=(1+beta^2*(tan(pi*alpha/2))^2)^(1/(2*alpha));
x(:,i)=s* sin(alpha*(u+b))./(cos(u).^(1/alpha)).* (cos(u-alpha*(u+b))./v).^((1-alpha)/alpha); 
for j = 1:length(u) %calculate tail probabilities
   X=abs(x(j,i));
   if X > tvalues(4)
       tailprob(:,i)=tailprob(:,i)+1;
   elseif X>tvalues(3)
       tailprob(1:3,i)=tailprob(1:3,i)+1;
   elseif X>tvalues(2)
       tailprob(1:2,i)=tailprob(1:2,i)+1;
   elseif X>tvalues(1)
       tailprob(1,i)=tailprob(1,i)+1;
   end       
end
end
tailprob=tailprob./length(u);
for i = 1:length(tvalues)
   tailprob(i,3:4)=2*normcdf(-tvalues(i)); 
end
tailprob

figure(1)

subplot(2,1,1),
histogram(x(:,1),[-10:10/20:10])
axis([-10 10 0 2000])
tit = strcat('\fontsize{18} \alpha=0.5 \fontsize{18} , \beta=0');
title(tit)
hold on
n = [-10:.1:10];
norm = 4000*normpdf(n,0,1);
plot(n,norm,'red')
hold off

subplot(2,1,2),
histogram(x(:,2),[-10:10/20:10])
axis([-10 10 0 2000])
tit = strcat('\fontsize{18} \alpha=1.5 \fontsize{18} , \beta=0');
title(tit)
hold on
n = [-10:.1:10];
norm = 3000*normpdf(n,0,1);
plot(n,norm,'red')
hold off


