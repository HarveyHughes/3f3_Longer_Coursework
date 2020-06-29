N=10;
mean = zeros(1000,1);
variance = zeros(1000,1);
meansquarederror = zeros(1000,1);
variancesquarederror = zeros(1000,1);
range=zeros(1000,1);
for j = 1:N
x=rand(1000,1);
y=-log(-x+1);

xs=rand(1000,1000);
f = @(x) -log(-x+1);
ys= arrayfun(f,xs);
for i = 1:1000
    mean(i)=mean(i)+ sum(ys(i,:))/1000;
    variance(i)= variance(i) + sum(ys(i,:).*ys(i,:))/1000 - mean(i)*mean(i);
    meansquarederror(i)= meansquarederror(i) + sum(ys(i,1:i))/i;
    variancesquarederror(i)= variancesquarederror(i) + sum(ys(i,1:i).*ys(i,1:i))/i - meansquarederror(i)*meansquarederror(i);
    range(i)=i;
end

end
meansquarederror= meansquarederror/N;
variancesquarederror=variancesquarederror/N;
samplegroupmean=  sum(mean)/(1000*N)
samplegroupvariance= sum(variance)/(1000*N)
figure(2)
subplot(211)
plot(range,(meansquarederror-1).*(meansquarederror-1));
f = @(x) 1/x;
hold on
fplot(f,[0,1000],'red')
hold off
axis([0 300 0 0.5])
subplot(212)
plot(range,(variancesquarederror-1).*(variancesquarederror-1));
f = @(x) 1/(2*sqrt(x));
hold on
fplot(f,[0,1000],'red')
hold off
axis([0 500 0 1])


figure(1)
subplot(211),
histogram(y,20);
hold on 
f = @(x) 400*exp(-x);
fplot(f,[0,7],'red')
hold off
subplot(212),
ksdensity(y,'width',0.1)
hold on 
f = @(x) exp(-x);
fplot(f,[0,7],'red')
hold off