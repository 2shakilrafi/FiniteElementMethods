function [x,k] = statit(A,M,M2,b,x,tol)
%STATIT Stationary Iteration
%
%       x^{k+1} = x^{k} + M \ r^{k},   r^{k} = b - A x^{k}
%       for solving A x = b
%
%       [x,k] = statit(A,M1,M2,b,x,tol)
%       Input:  A  system matrix
%               M1,M2  M = M1*M2 `preconditioner'
%                      (M2 = [] indicates M2=identity)
%               b  right hand side
%               x  initial vector x^{0} (default x = 0)
%               tol (default tol = eps)
%       Output: x approximate solution
%               k number of iteration until convergence
%       convergence criterion:
%       norm(b - A*x) <= tol*norm(b - A*x0)
% number of function input arguments
if (nargin < 6), tol = eps; end
if (nargin < 5), x = zeros(size(A,1),1); end

r = b - A*x;
rnrm0 = norm(r);  rnrm = rnrm0;
for k=1:5000
   if isempty(M2),
      x = x + M\r;
   else
      x = x + M2\(M\r);
   end
   r = b - A*x;
   rnrm = norm(r);
   if rnrm < tol*rnrm0, return, end
end


