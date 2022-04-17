%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finite Element Methods HW4. 
% This is the answer to Question 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure();
    A = gallery('poisson',11);
    subplot(1,1,1),spy(A),title('spy of 11x11 Poisson matrix');


methods = ["Jacobi"; 
    "Block Jacobi"; 
    "Gauss-Siedel"; 
    "Block Gauss-Siedel"; 
    "Symmetric Gauss-Siedel";
    "Block Symmetric Gauss-Siedel";
    "SOR, omega = 1.6";
    "Block SOR, omega = 1.5"];

iterations = [k_J;
    k_BJ;
    k_GS;
    k_BGS;
    k_SGS;
    k_BSGS;
    k_SOR;
    k_BSOR];


for i = [11, 31, 63]

    A = gallery('poisson',i);
    I = eye(size(A,1));
    b = ones(size(A,1),1);
    x = zeros(size(A,1),1);
    tol = 10^-6;

    %Jacobi
    M = diag(diag(A));
    [x_J,k_J] = statit(A,M,[], b, x,tol);
    D = M;
    
    %Block Jacobi
    
    M = triu(tril(A,1),-1);
    D_B = M;
    
    [x_BJ,k_BJ] = statit(A,M,[], b, x,tol);
    
    %Gauss-Siedel
    
    M = tril(A); 
    
    [x_GS,k_GS] = statit(A,M,[], b, x,tol);
    
    
    %Block Gauss-Siedel
    
    M = tril(A,1);
    
    [x_BGS,k_BGS] = statit(A,M,[], b, x,tol);
    
    %Symmetric Gauss-Siedel
    
    M_1 = tril(A)/sqrt(D);
    M_2 = transpose(M_1);
    M = M_1*M_2;
    
    [x_SGS,k_SGS] = statit(A,M,M_2, b, x,tol);
    
    %Block symmetric Gauss-Siedel
    
    M_1 = tril(A,1)/chol(D_B);
    M_2 = transpose(M_1);
    M = M_1*M_2;
    
    [x_BSGS,k_BSGS] = statit(A,M,M_2, b, x,tol);
    
    %SOR (omega = 1.6)
    
    omega = 1.6;
    M = D/omega + tril(A,-1);
    
    [x_SOR,k_SOR] = statit(A,M,[], b, x,tol);
    
    %Block SOR (omega = 1.5)
    
    omega = 1.5;
    M = D_B/omega + tril(A,-3);
    
    [x_BSOR,k_BSOR] = statit(A,M,[], b, x,tol);
    
    %Final output
    disp("Iterations for Poisson matrix on an " + i + " by "+i+" grid is:")

    table(methods, iterations)
end
