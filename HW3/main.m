
A = StiffnessAssembler2D(p,t,1);
R = RobinMassMatrix2D(p,e,1);
r = RobinLoadVector2D(p,e,1,@gD,@gN);

xi = r\(A+R);

F = scatteredInterpolant(p(1,:)',p(2,:)',xi');
[x, y] = meshgrid(p(1,:), p(2,:));
z = F(x, y);
surf(x, y, z)
shading interp;
