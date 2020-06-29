x=rand(100000000,1);
y= -log(-x+1);

figure(1)
subplot(211),
histogram(y,20);
hold on 
f = @(x) 400*exp(-x)
fplot(f,[0,7],'red')
hold off
subplot(212),
ksdensity(y,'width',0.1)
hold on 
f = @(x) exp(-x)
fplot(f,[0,7],'red')
hold off

mean= sum(y)/100000000
variance = sum(y.*y)/100000000 - mean