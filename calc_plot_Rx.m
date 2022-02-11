function [x_axis Rx] = calc_plot_Rx(X)
N = length(X);
Rx = 1/N * conv(X,flip(X));
x_axis = -(length(X)-1):(length(X)-1);
plot(x_axis, Rx)


end