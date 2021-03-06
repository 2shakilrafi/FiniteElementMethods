%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This is the second part of question 3
% where we time the cholesky decomp, forsub, and backsub
% of B, B with rcm and B with amd
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

chol_time = zeros(3,1);             %time it takes to chol various matrices
forsub_time = zeros(3,1);           %time it takes to forsub various matrices
backsub_time = zeros(3,1);          %time it takes to backsub various matrices

labels = ["original"; 
    "rcm";
    "amd"];

for N = [16 32 64 128 256];

    matrix = gallery('wathen',N,N);
    amd_matrix = matrix(symamd(matrix),symamd(matrix));
    rcm_matrix = matrix(symrcm(matrix),symrcm(matrix));

    tic
    chol_B = chol(matrix);
    chol_time(1,1) = toc;

    tic
    chol_rcm = chol(rcm_matrix);
    chol_time(2,1) = toc;

    tic
    chol_amd = chol(amd_matrix);
    chol_time(3,1) = toc;

    b = rand(size(matrix,1),1);
    
    tic 
    y = chol_B'\b;
    forsub_time(1,1) = toc;

    tic
    chol_B\y;
    backsub_time(1,1) = toc;

    tic 
    y = chol_rcm'\b;
    forsub_time(2,1) = toc;

    tic
    chol_rcm\y;
    backsub_time(2,1) = toc;

    tic 
    y = chol_amd'\b;
    forsub_time(3,1) = toc;

    tic
    chol_amd\y;
    backsub_time(3,1) = toc;

    disp("For a Wathen matrix of size " + N + " the timings are:")
    table(labels,chol_time, forsub_time, backsub_time)
    
end
