alpha= [0.5,1.5,0.75,1,0.25,1.25,1.1,1.75];
gamma=[-0.008,-0.015,-0.009,-0.01,-0.006,-0.014,-0.011,-0.017]
figure;
scatter(alpha,gamma,'X')
f = @(x) -0.0078*x-0.0035;
hold on
fplot(f,[0,2],'red')
hold off
ylabel('\gamma')
xlabel('\alpha')