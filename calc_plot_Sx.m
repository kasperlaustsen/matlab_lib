function [xf Sx] = calc_plot_Sx(X)
N = length(X);
% xf = -0.5:1/(N-1):0.5;
xf = -0.5:1/N:0.5-1/N;
Sx = 1/N * abs(fft(X)).^2;

plot(xf, fftshift(Sx))


end