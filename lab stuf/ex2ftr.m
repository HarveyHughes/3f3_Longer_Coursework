x=rand(1000,1)*2*pi; %uniform distribution
y=sin(x);
figure(2)
yclip=min(y,0.7);
scatter(yclip,x)
xlabel('y')
ylabel('x')
py=zeros(length(y),1);
for i = 1:1 %y=sin(x) is a 1:1 function in range 0-2pi  
    J=abs(cos(x));
    py = py + (1/(2*pi))./J ; % as p(x) = 1/2pi everywhere 
end

binrange=[0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,1]
%Plot Transformed distribution
figure(1)
subplot(211)
histogram(y,binrange)
hold on
scatter(y,py*150,'blue')
f = @(x) 1/(2*pi*abs(cos(asin(x)))) *150; 
fplot(f,[0,1],'red','LineWidth',1.5)
hold off
title('y=sin(x)')
axis([0 1 0 150])
binrange=[0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.69,0.71] % in order to see peak at 0.7
subplot(212)
histogram(yclip,binrange)
hold on
f = @(x) 1/(2*pi*abs(cos(asin(x)))) *150; 
fplot(f,[0,0.7],'red','LineWidth',1.5)
top=1/(2*pi)*(pi-2*asin(0.7))*1000
line([0.7 0.7],[0 top],'color', 'red', 'LineWidth',1.5)
hold off
title('y=sin(x) clippied at y=0.7')
axis([0 1 0 350])