function [W,A] = RLS(x,t,A,W)
e = t-x'*W;
z = A * x;
alpha = 1 / (1 + x' * z);

W = W + alpha*z*e;
A = A - alpha * A * x * x' * A';
end