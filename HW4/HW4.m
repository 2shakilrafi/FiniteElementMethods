A = gallery('poisson',11);
spy(A);
I = eye(size(A,1));
b = ones(size(A,1),1)
x = zeros(size(A,1),1)

%Jacobi
M = diag(diag(A))
[x_J,k_J] = statit(A,M,[], b, x,eps)
D = M

%Block Jacobi

M = triu(tril(A,1),-1)
D_B = M

[x_BJ,k_BJ] = statit(A,M,[], b, x,eps)

%Gauss-Siedel

M = tril(A) 

[x_GS,k_GS] = statit(A,M,[], b, x,eps)

%Block Gauss-Siedel

M = tril(A,1)

[x_BGS,k_BGS] = statit(A,M,[], b, x,eps)

%Symmetric Gauss-Siedel

M_1 = tril(A)/sqrt(D)
M_2 = transpose(M_1)
M = M_1*M_2

[x_SGS,k_SGS] = statit(A,M,M_2, b, x,eps)

%Block symmetric Gauss-Siedel

M_1 = tril(A,1)/chol(D_B)
M_2 = transpose(M_1)
M = M_1*M_2

[x_BSGS,k_BSGS] = statit(A,M,M_2, b, x,eps)

%SOR (omega = 1.6)

omega = 1.6
M = D/omega + tril(A,-1)

[x_SGS,k_SGS] = statit(A,M,[], b, x,eps)

%Block SOR (omega = 1.5)

M = D_B/omega + tril(A,-1)


