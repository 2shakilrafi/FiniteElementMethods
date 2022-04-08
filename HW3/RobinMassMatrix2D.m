function R = RobinMassMatrix2D(p,e,kappa)

np = size(p,2);
ne = size(e,2);
R = sparse(np,np);
for E = 1:ne
    loc2glb = e(1:2,E);
    x = p(1,loc2glb);
    y = p(2,loc2glb);
    len = sqrt((x(1)-x(2))^2+(y(1)-y(2))^2);
    xc = mean(x); yc = mean(y);
    k = kappa;  %since kappa is 1 we simply replace the matrix with the constant kappa
    RE = k/6*[2 1; 1 2]*len;
    R(loc2glb,loc2glb) = R(loc2glb,loc2glb)+RE;
end