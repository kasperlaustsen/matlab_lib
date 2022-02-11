function [kx, y] = plot_binopmf(max_succeses,N,p)

k = max_succeses
kx = 0:k
y = binopdf(kx,N,p)

stem(kx,y)
xlabel('k number of succeses')
ylabel('Probability of k succeses')

end