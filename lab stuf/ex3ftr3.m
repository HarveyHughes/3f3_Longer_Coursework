M=100;
x=rand(M,1);
y=-log(-x+1);

N=3;
mean = zeros(M,1);
variance = zeros(M,1);
meansquarederror = zeros(M,N);
mse=zeros(M,1);
vse=zeros(M,1);
variancesquarederror = zeros(M,N);
range=zeros(M,1);

for j =1:N
xs=rand(M,M);
f = @(x) -log(-x+1);
ys= arrayfun(f,xs);
for i = 1:M
    mean(i)=sum(ys(i,:))/M;
    variance(i)=sum(ys(i,:).*ys(i,:))/M - mean(i)*mean(i);
    temp= sum(ys(i,1:i))/i;
    meansquarederror(i,j)= temp;
    variancesquarederror(i,j)= sum(ys(i,1:i).*ys(i,1:i))/i - temp*temp;
    range(i)=i;
end
samplegroupmean=sum(mean)/M;
samplegroupvariance=sum(variance.*variance)/M;
end
for i = 1:M
   mse(i)=sum(meansquarederror(i,:))/N; 
   vse(i)=sum(variancesquarederror(i,:))/N;
end
figure(2)
subplot(211)
plot(range,(mse-1).*(mse-1)*5);
f = @(x) 1/(x);
hold on
fplot(f,[0,M],'red')
hold off
axis([0 100 0 0.5])
title('Mean Squared Error')
xlabel('Sample Size')
ylabel('Error Squared')
subplot(212)
plot(range,(vse-1).*(vse-1));
f = @(x) 1/(2*sqrt(x));
hold on
fplot(f,[0,M],'red')
hold off
axis([0 100 0 1])
title('Variance Squared Error')
xlabel('Sample Size')
ylabel('Error Squared')

