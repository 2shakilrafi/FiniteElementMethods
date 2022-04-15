B = gallery('wathen',8,8);

spy(B);

p = symrcm(B);
rcmB = B(p,p);

p = symamd(B);
amdB = B(p,p);

figure();
subplot(3,3,1),spy(B),title('B')
subplot(3,3,2),spy(chol(B)),title('chol B')
subplot(3,3,3),etreeplot(B),title('etreeplot B')

subplot(3,3,4),spy(rcmB),title('rcm B')
subplot(3,3,5),spy(chol(rcmB)),title('chol rcm B')
subplot(3,3,6),etreeplot(rcmB),title('etreelot rcm B')

subplot(3,3,7),spy(amdB),title('amd B')
subplot(3,3,8),spy(chol(amdB)),title('chol amd B')
subplot(3,3,9),etreeplot(amdB),title('etreelot amd B')


