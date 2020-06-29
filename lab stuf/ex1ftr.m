
%plot Normal distribution  Distribution
N=[100,1000,10000]
height=[20,150,1200]
figure(1)

for i =1:3 
botrange=0;
y=randn(N(i),1);
subplot(3,1,i),
numberofbins = 21;
binranges = zeros(numberofbins,1);
for j = 1:numberofbins+1
    binranges(j) = (3--3)/(numberofbins-1) *(j-1) + -3.15;
end
histogram(y,binranges)
hold on
for j = 1:length(binranges)-1
    pj = normcdf(binranges(j+1)) - normcdf(binranges(j));
    mean = N(i)*pj;
    sd = sqrt(N(i)*pj*(1-pj))*3;
    if j==length(binranges)/2
        toprange = (mean + sd )*1.1;
    end
    tempbot= (mean-sd)*1.1;
    if tempbot <botrange
        botrange=tempbot;
    end
    line([binranges(j),binranges(j+1)],[mean,mean],'color','red','LineWidth',1)
    line([binranges(j),binranges(j+1)],[mean+sd,mean+sd],'color',[0 0.5 0],'LineWidth',1)
    line([binranges(j),binranges(j+1)],[mean-sd,mean-sd],'color',[0 0.5 0],'LineWidth',1)
end
hold off  
axis([-3.5 3.5 botrange toprange])
title(['N=',num2str(N(i))])
end



