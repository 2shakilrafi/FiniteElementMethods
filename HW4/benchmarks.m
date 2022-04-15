
N = [16 32 64 128 256];

chol_time = zeros(3,1);
forsub_time = zeros(3,1);
backsub_time = zeros(3,1);

labels = ["original"; "rcm";"amd"];

for i = 1:3
    matrix = gallery('wathen',N(i),N(i));
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
    x = chol_amd\y;
    backsub_time(3,1) = toc;

    disp("For a Wathen matrix of size " + N(i) + " the timings are:")
    table(labels,chol_time, forsub_time, backsub_time)
    
end
