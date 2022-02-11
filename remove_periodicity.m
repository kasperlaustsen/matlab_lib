function X_diffed = remove_periodicity(X,period)

X_diffed = X(1+period:end) - X(1:end-period)
%eq way
% X_diffed = X(1:end-period) - X(1+period:end)
end