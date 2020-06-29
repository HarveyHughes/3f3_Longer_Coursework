%Plot Normal Distributions
figure(1)
x=randn(1000,1);
subplot(211),
histogram(x,20)
hold on
n = [-3:.1:3];
norm = normpdf(n,0,1)*350;
plot(n,norm,'red')
hold off
subplot(212),
ksdensity(x,'width',0.1)
hold on
n = [-3:.1:3];
norm = normpdf(n,0,1);
plot(n,norm,'red')
hold off

%plot Uniform Distribution
figure(2)
y=rand(1000,1);
subplot(211),
histogram(y,10)
axis([0 1 0 150])
hold on
height = 100.* ones(length(n),1)
plot(n,height,'red')
hold off
subplot(212),
ksdensity(y,'width',0.1)
hold on
x1=[0,0,1,1];
y1=[0,1,1,0];
plot(x1,y1,'red')
hold off

%plot Uniform no.2 Distribution
N=[100,1000,10000]
height=[20,150,1200]
figure(3)
for i =1:3 
y=rand(N(i),1);
subplot(3,1,i),
histogram(y,10)
title(['N=',num2str(N(i))])
hold on
mean=N(i)*0.1;
sd= sqrt(N(i)*0.1*0.9);
line([0,1],[mean,mean],'color','red')
line([0,1],[mean+3*sd,mean+3*sd],'color','red')
line([0,1],[mean-3*sd,mean-3*sd],'color','red')
axis([0 1 0 height(i)])
hold off
end



