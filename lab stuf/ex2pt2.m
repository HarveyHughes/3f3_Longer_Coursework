x=randn(1000,1);
y=x.^2;   
py=zeros(length(y),1);
for i = 1:2 %y=x^2 is a 2:1 function
    J=abs(x)*2;
    py = py + normpdf((-1)^i*sqrt(y),0,1)./J ;
end

%Plot Transformed distribution
figure(1)
histogram(y,40)
hold on
scatter(y,py*400,'blue')
f = @(x) 1/(sqrt(2*pi*x)) *exp(-0.5*(sqrt(x))^2) *400
fplot(f,[0,7],'red','LineWidth',1.5)
hold off
title('y=x^2')
axis([0 10 0 750])


